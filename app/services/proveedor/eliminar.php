<?php
require_once '../../models/proveedor.php';
if (isset($_POST["CodigoProveedor"])) {
    $CodigoProveedor = $_POST["CodigoProveedor"];
    if (!empty($CodigoProveedor)) {
        $proveedor = new proveedor($CodigoProveedor, "", "", "", "", "", "", "");
        $resultado = $proveedor->EliminarProveedor();
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'El proveedor no existe') {
            echo json_encode(['mensaje' => 'El proveedor no existe']);
        } else if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Existe algún proveedor actuando en otro servicio.') {
            echo json_encode(['mensaje' => 'Existe algún proveedor actuando en otro servicio.']);
        } else if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Proveedor eliminado correctamente') {
            echo json_encode(['mensaje' => 'Proveedor eliminado correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}