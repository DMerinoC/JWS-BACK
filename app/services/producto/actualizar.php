<?php
require_once '../../models/producto.php';
if (isset($_POST["CodigoProducto"], $_POST["NombreProducto"], $_POST["PrecioProducto"], $_POST["CantidadProducto"], $_POST["ObservacionProducto"], $_POST["ListaPredeterminado"])) {
    $CodigoProducto = $_POST["CodigoProducto"];
    $NombreProducto = $_POST["NombreProducto"];
    $PrecioProducto = $_POST["PrecioProducto"];
    $CantidadProducto = $_POST["CantidadProducto"];
    $ObservacionProducto = $_POST["ObservacionProducto"];
    $ListaPredeterminado = $_POST["ListaPredeterminado"];

    if (!empty($CodigoProducto) && !empty($NombreProducto) && !empty($PrecioProducto) && !empty($CantidadProducto) && !empty($ObservacionProducto) && !empty($ListaPredeterminado)) {
        $producto = new producto($CodigoProducto, $NombreProducto, $PrecioProducto, $CantidadProducto, $ObservacionProducto, $ListaPredeterminado);
        $resultado = $producto->ActualizarProducto();
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'El Producto ya existe') {
            echo json_encode(['mensaje' => 'El Producto ya existe']);
        } else if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Producto actualizado correctamente') {
            echo json_encode(['mensaje' => 'Producto actualizado correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}
