<?php
require_once '../../models/receta.php';
if (isset($_POST["CodigoProducto"], $_POST["CodigoMateria"], $_POST["CantidadMateria"], $_POST["PrecioMateriaCantidad"])) {
    $CodigoProducto = $_POST["CodigoProducto"];
    $CodigoMateria = $_POST["CodigoMateria"];
    $CantidadMateria = $_POST["CantidadMateria"];
    $PrecioMateriaCantidad = $_POST["PrecioMateriaCantidad"];

    if (!empty($CodigoProducto) && !empty($CodigoMateria) && !empty($CantidadMateria) && !empty($PrecioMateriaCantidad)) {
        $receta = new receta("", $CodigoProducto, $CodigoMateria, "", "", $CantidadMateria, $PrecioMateriaCantidad);
        $resultado = $receta->GuardarReceta();
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Receta insertada correctamente') {
            echo json_encode(['mensaje' => 'Receta insertada correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}