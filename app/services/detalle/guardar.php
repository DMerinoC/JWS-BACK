<?php
require_once '../../models/detalleCotizacion.php';

if (isset($_POST["CodigoCotizacion"], $_POST["CodigoProducto"], $_POST["CantidadDetalleCotizacion"], $_POST["ObservacionDetalleCotizacion"])) {
    $CodigoCotizacion = $_POST["CodigoCotizacion"];
    $CodigoProducto = $_POST["CodigoProducto"];
    $CantidadDetalleCotizacion = $_POST["CantidadDetalleCotizacion"];
    $ObservacionDetalleCotizacion = $_POST["ObservacionDetalleCotizacion"];

    if (!empty($CodigoCotizacion) && !empty($CodigoProducto) && !empty($CantidadDetalleCotizacion) && !empty($ObservacionDetalleCotizacion)) {
        $detalleCotizacion = new detalleCotizacion("", $CodigoCotizacion, $CodigoProducto, "", "", $CantidadDetalleCotizacion, "", "", $ObservacionDetalleCotizacion);
        $resultado = $detalleCotizacion->GuardarDetalle();
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Detalle cotizacion insertado correctamente') {
            echo json_encode(['mensaje' => 'Detalle cotizacion insertado correctamente']);
        } else if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Producto no encontrado') {
            echo json_encode(['mensaje' => 'Producto no encontrado']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}