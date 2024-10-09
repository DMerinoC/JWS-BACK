<?php
require_once '../../models/guiaRemision.php';
if (isset($_POST["CodigoRemision"])) {
    $CodigoRemision = $_POST["CodigoRemision"];
    if (!empty($CodigoRemision)) {
        $remision = new remision($CodigoRemision, "", "", "", "", "");
        $resultado = $remision->EliminarRemision();
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'La guia remision no existe') {
            echo json_encode(['mensaje' => 'La guia remision no existe']);
        } else if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Guia remision eliminada correctamente') {
            echo json_encode(['mensaje' => 'Guia remision eliminada correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}