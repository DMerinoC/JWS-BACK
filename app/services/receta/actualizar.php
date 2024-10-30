<?php
require_once '../../models/receta.php';
if (isset($_POST["CodigoReceta"], $_POST["CodigoProducto"], $_POST["CodigoMateria"], $_POST["CantidadMateria"], $_POST["PrecioMateriaCantidad"])) {
    $CodigoReceta = $_POST["CodigoReceta"];
    $CodigoProducto = $_POST["CodigoProducto"];
    $CodigoMateria = $_POST["CodigoMateria"];
    $CantidadMateria = $_POST["CantidadMateria"];
    $PrecioMateriaCantidad = $_POST["PrecioMateriaCantidad"];

    if (!empty($CodigoReceta) &&!empty($CodigoProducto) && !empty($CodigoMateria) && !empty($CantidadMateria) && !empty($PrecioMateriaCantidad)) {
        $receta = new receta($CodigoReceta, $CodigoProducto, $CodigoMateria, "", "", $CantidadMateria, $PrecioMateriaCantidad);
        $resultado = $receta->ActualizarReceta();
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Receta actualizada correctamente') {
            echo json_encode(['mensaje' => 'Receta actualizada correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}