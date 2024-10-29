<?php
require_once '../../models/cobranza.php';
if (isset($_POST["CodigoCobranza"])) {
    $CodigoCobranza = $_POST["CodigoCobranza"];
    if (!empty($CodigoCobranza)) {
        $cobranza = new cobranza($CodigoCobranza, "", "", "", "", "", "", "", "", "");
        $resultado = $cobranza->EliminarCobranza();

        // Verificar el resultado de la eliminación
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje'])) {
            echo json_encode(['mensaje' => $resultado[0]['mensaje']]);
        } else {
            echo json_encode(['mensaje' => 'Error al eliminar la cobranza']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacíos']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}
?>
