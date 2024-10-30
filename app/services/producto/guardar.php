<?php
require_once '../../models/producto.php';
if (isset($_POST["NombreProducto"], $_POST["PrecioProducto"], $_POST["ObservacionProducto"])) {
    $NombreProducto = $_POST["NombreProducto"];
    $PrecioProducto = $_POST["PrecioProducto"];
    $ObservacionProducto = $_POST["ObservacionProducto"];

    if (!empty($NombreProducto) && !empty($PrecioProducto) && !empty($ObservacionProducto)) {
        // INSTANCIAMOS
        $producto = new producto("", $NombreProducto, $PrecioProducto, $ObservacionProducto, );
        // APLICAMOS GUARDAR
        $resultado = $producto->GuardarProducto();
        // MANEJAMOS RESPUESTAS
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'El Producto ya existe') {
            echo json_encode(['mensaje' => 'El Producto ya existe']);
        } else if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Producto insertado correctamente') {
            echo json_encode(['mensaje' => 'Producto insertado correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}
