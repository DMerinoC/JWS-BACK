<?php
    require_once '../../models/cotizacion.php';
    $cotizacion = cotizacion::Listar();
    echo json_encode($cotizacion);
