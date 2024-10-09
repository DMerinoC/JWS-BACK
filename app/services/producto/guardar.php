<?php
require_once '../../models/producto.php';
if (isset($_POST["NombreProducto"], $_POST["PrecioProducto"], $_POST["CantidadProducto"], $_POST["ObservacionProducto"], $_POST["ListaPredeterminado"])) {
    $NombreProducto = $_POST["NombreProducto"];
    $PrecioProducto = $_POST["PrecioProducto"];
    $CantidadProducto = $_POST["CantidadProducto"];
    $ObservacionProducto = $_POST["ObservacionProducto"];
    $ListaPredeterminado = $_POST["ListaPredeterminado"];

    if (!empty($NombreProducto) && !empty($PrecioProducto) && !empty($CantidadProducto) && !empty($ObservacionProducto) && !empty($ListaPredeterminado)) {
        // INSTANCIAMOS
        $producto = new producto("", $NombreProducto, $PrecioProducto, $CantidadProducto, $ObservacionProducto, $ListaPredeterminado);
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
