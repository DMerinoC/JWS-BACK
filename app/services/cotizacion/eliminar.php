<?php
require_once '../../models/cotizacion.php';
if (isset($_POST["CodigoCotizacion"])) {
    $CodigoCotizacion = $_POST["CodigoCotizacion"];
    if (!empty($CodigoCotizacion)) {
        $cotizacion = new cotizacion($CodigoCotizacion, "", "", "", "", "","");
        $resultado = $cotizacion->EliminarCotizacion();
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'La cotizacion no existe') {
            echo json_encode(['mensaje' => 'La cotizacion no existe']);
        } else if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Cotizacion eliminada correctamente') {
            echo json_encode(['mensaje' => 'Cotizacion eliminada correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}
