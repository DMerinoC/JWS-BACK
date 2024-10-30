<?php
require_once '../../models/producto.php';
if (isset($_POST["CodigoProducto"])) {
    $CodigoProducto = $_POST["CodigoProducto"];
    if (!empty($CodigoProducto)) {
        $producto = new producto($CodigoProducto, "", "", "");
        $resultado = $producto->EliminarProducto();
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'El producto no existe') {
            echo json_encode(['mensaje' => 'El producto no existe']);
        } else if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Producto eliminado correctamente') {
            echo json_encode(['mensaje' => 'Producto eliminado correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}
