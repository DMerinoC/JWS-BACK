<?php
require_once '../../models/materiaPrima.php';
if (isset($_POST["CodigoMateriaPrima"])) {
    $CodigoMateriaPrima = $_POST["CodigoMateriaPrima"];
    if (!empty($CodigoMateriaPrima)) {
        $materia = new materia($CodigoMateriaPrima, "", "", "", "", "", "", "", "");
        $resultado = $materia->EliminarMateria();
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'La materia prima no existe') {
            echo json_encode(['mensaje' => 'La materia prima no existe']);
        } else if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Materia prima eliminada correctamente') {
            echo json_encode(['mensaje' => 'Materia prima eliminada correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}
