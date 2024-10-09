<?php
    require_once '../../models/producto.php';
    $producto = producto::Listar();
    echo json_encode($producto);
