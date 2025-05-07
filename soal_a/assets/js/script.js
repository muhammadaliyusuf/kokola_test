document.addEventListener('DOMContentLoaded', function() {
    
    // handle form submission via AJAX
    document.getElementById('submitPlantProduct').addEventListener('click', function() {
        const form = document.getElementById('addPlantProductForm');
        const formData = new FormData(form);
        const messageDiv = document.getElementById('formMessage');
        
        const productName = formData.get('product_name');
        
        if (!productName) {
            showMessage('Please enter a product name.', 'danger');
            return;
        }
        
        // mengirim AJAX request
        fetch('index.php?action=add_plant_product', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // menampilkan success message
                showMessage(data.message, 'success');
                
                // update tabel dengan data baru
                updateTable(data.data, data.productsWithoutPlant);
                
                // reset form
                form.reset();
                
                // menutup modal after 1 detik
                setTimeout(() => {
                    const modal = bootstrap.Modal.getInstance(document.getElementById('addPlantProductModal'));
                    modal.hide();
                }, 1000);
            } else {
                // menampilkan error message
                showMessage(data.message, 'danger');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            showMessage('An error occurred while processing your request.', 'danger');
        });
    });
    
    // helper function u/menampilkan pesan
    function showMessage(message, type) {
        const messageDiv = document.getElementById('formMessage');
        messageDiv.textContent = message;
        messageDiv.className = `alert alert-${type}`;
        
        // menghilangkan message setelah 4 detik jika bukan success message
        if (type === 'success') {
            setTimeout(() => {
                messageDiv.className = 'alert d-none';
            }, 4000);
        }
    }
    
    // helper function update tabel dengan data baru
    function updateTable(data, productsWithoutPlant = []) {
        const tableBody = document.getElementById('plant-products-table');
        
        // clear table
        tableBody.innerHTML = '';
        
        // menambahkan baris baru untuk plant products
        data.forEach(row => {
            const tr = document.createElement('tr');
            
            const tdPlant = document.createElement('td');
            tdPlant.textContent = row.plant_code;
            
            const tdProducts = document.createElement('td');
            tdProducts.textContent = row.products;
            tdProducts.style.wordBreak = 'break-word';
            
            tr.appendChild(tdPlant);
            tr.appendChild(tdProducts);
            
            tableBody.appendChild(tr);
        });
        
        // menambahkan baris untuk products tanpa plant jika ada
        if (productsWithoutPlant && productsWithoutPlant.length > 0) {
            const tr = document.createElement('tr');
            
            const tdPlant = document.createElement('td');
            tdPlant.textContent = '-';
            
            const tdProducts = document.createElement('td');
            tdProducts.textContent = productsWithoutPlant.join(', ');
            tdProducts.id = 'products-without-plant';
            tdProducts.style.wordBreak = 'break-word';
            
            tr.appendChild(tdPlant);
            tr.appendChild(tdProducts);
            
            tableBody.appendChild(tr);
        }
    }
});