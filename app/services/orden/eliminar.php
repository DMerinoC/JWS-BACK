<?php
require_once '../../models/ordenTrabajo.php';

if (isset($_POST["CodigoOrdenTrabajo"])) {
    $CodigoOrdenTrabajo = $_POST["CodigoOrdenTrabajo"];

    if (!empty($CodigoOrdenTrabajo)) {
        $orden = new orden($CodigoOrdenTrabajo, "", "", "", "", "", "", "");
        $resultado = $orden->EliminarOrden();
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'La orden de trabajo no existe') {
            echo json_encode(['mensaje' => 'La orden de trabajo no existe']);
        } else if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Orden de Trabajo eliminada correctamente') {
            echo json_encode(['mensaje' => 'Orden de Trabajo eliminada correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}