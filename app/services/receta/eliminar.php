<?php
require_once '../../models/receta.php';
if (isset($_POST["CodigoReceta"])) {
    $CodigoReceta = $_POST["CodigoReceta"];

    if (!empty($CodigoReceta)) {
        $receta = new receta($CodigoReceta, "", "", "", "", "", "");
        $resultado = $receta->EliminarReceta();
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Receta eliminada correctamente') {
            echo json_encode(['mensaje' => 'Receta eliminada correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}