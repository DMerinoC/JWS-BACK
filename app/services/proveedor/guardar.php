<?php
require_once '../../models/proveedor.php';

if (isset($_POST["NombreProveedor"], $_POST["RucProveedor"], $_POST["DireccionProveedor"], $_POST["ContactoProveedor"], $_POST["EmailProveedor"], $_POST["CelularProveedor"])) {
    $NombreProveedor = $_POST["NombreProveedor"];
    $RucProveedor = $_POST["RucProveedor"];
    $DireccionProveedor = $_POST["DireccionProveedor"];
    $ContactoProveedor = $_POST["ContactoProveedor"];
    $EmailProveedor = $_POST["EmailProveedor"];
    $CelularProveedor = $_POST["CelularProveedor"];

    if (!empty($NombreProveedor) && !empty($RucProveedor) && !empty($DireccionProveedor) && !empty($ContactoProveedor) && !empty($EmailProveedor) && !empty($CelularProveedor)) {
        $proveedor = new proveedor("", $RucProveedor, $NombreProveedor, $ContactoProveedor, $DireccionProveedor, $EmailProveedor, $CelularProveedor);
        $resultado = $proveedor->GuardarProveedor();
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'El Proveedor ya existe') {
            echo json_encode(['mensaje' => 'El Proveedor ya existe']);
        } else if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Proveedor insertado correctamente') {
            echo json_encode(['mensaje' => 'Proveedor insertado correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}