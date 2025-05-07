<?php

// entry point dari aplikasi
require_once 'controllers/PlantProductController.php';

$controller = new PlantProductController();

// routing request
$action = isset($_GET['action']) ? $_GET['action'] : 'index';

// memanggil controller method yang sesuai berdasarkan action
switch ($action) {
    case 'add_plant_product':
        $controller->addPlantProduct();
        break;
    case 'index':
    default:
        $controller->index();
        break;
}
