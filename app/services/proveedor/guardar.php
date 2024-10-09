<?php
require_once '../../models/proveedor.php';

if (isset($_POST["NombreProveedor"], $_POST["RucProveedor"], $_POST["TipoRucProveedor"], $_POST["DireccionProveedor"], $_POST["ContactoProveedor"], $_POST["UrlProveedor"], $_POST["CargoCompras"])) {
    $NombreProveedor = $_POST["NombreProveedor"];
    $RucProveedor = $_POST["RucProveedor"];
    $TipoRucProveedor = $_POST["TipoRucProveedor"];
    $DireccionProveedor = $_POST["DireccionProveedor"];
    $ContactoProveedor = $_POST["ContactoProveedor"];
    $UrlProveedor = $_POST["UrlProveedor"];
    $CargoCompras = $_POST["CargoCompras"];

    if (!empty($NombreProveedor) && !empty($RucProveedor) && !empty($TipoRucProveedor) && !empty($DireccionProveedor) && !empty($ContactoProveedor) && !empty($UrlProveedor) && !empty($CargoCompras)) {
        $proveedor = new proveedor("", $NombreProveedor, $RucProveedor, $TipoRucProveedor, $DireccionProveedor, $ContactoProveedor, $UrlProveedor, $CargoCompras);
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