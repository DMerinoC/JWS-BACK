<?php
require_once '../../models/detalleCotizacion.php';

if (isset($_POST["CodigoDetalleCotizacion"])) {
    $CodigoDetalleCotizacion = $_POST["CodigoDetalleCotizacion"];

    if (!empty($CodigoDetalleCotizacion)) {
        $detalleCotizacion = new detalleCotizacion($CodigoDetalleCotizacion, "", "", "", "", "", "", "", "");
        $resultado = $detalleCotizacion->EliminarDetalle();
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'El detalle cotizacion no existe') {
            echo json_encode(['mensaje' => 'El detalle cotizacion no existe']);
        } else if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Detalle Cotizacion eliminada correctamente') {
            echo json_encode(['mensaje' => 'Detalle Cotizacion eliminada correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}