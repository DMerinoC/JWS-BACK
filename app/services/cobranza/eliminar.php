<?php
require_once '../../models/cobranza.php';
if (isset($_POST["CodigoCobranza"])) {
    $CodigoCobranza = $_POST["CodigoCobranza"];

    if (!empty($CodigoCobranza)) {
        // INSTANCIAMOS
        $cobranza = new cobranza($CodigoCobranza, "", "", "", "", "", "", "", "", "", "");
        // APLICAMOS GUARDAR
        $resultado = $cobranza->EliminarCobranza();
        // MANEJAMOS RESPUESTAS
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'La cobranza no existe') {
            echo json_encode(['mensaje' => 'La cobranza no existe']);
        } else if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Cobranza eliminada correctamente') {
            echo json_encode(['mensaje' => 'Cobranza eliminada correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}
