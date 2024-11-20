<?php
require_once '../../models/ordenTrabajo.php';

if (isset($_POST["CodigoCotizacion"], $_POST["CodigoTrabajador"], $_POST["FechaEmisionOrden"], $_POST["FechaMaximaEntrega"], $_POST["EstadoOrden"], $_POST["EstadoProduccion"])) {
    $CodigoCotizacion = $_POST["CodigoCotizacion"];
    $CodigoTrabajador = $_POST["CodigoTrabajador"];
    $FechaEmisionOrden = $_POST["FechaEmisionOrden"];
    $FechaMaximaEntrega = $_POST["FechaMaximaEntrega"];
    $EstadoOrden = $_POST["EstadoOrden"];
    $EstadoProduccion = $_POST["EstadoProduccion"];

    if (!empty($CodigoCotizacion) && !empty($CodigoTrabajador) && !empty($FechaEmisionOrden) && !empty($FechaMaximaEntrega) && !empty($EstadoOrden)&& !empty($EstadoProduccion)) {
        $orden = new orden("", $CodigoCotizacion, $CodigoTrabajador, "", "", $FechaEmisionOrden, $FechaMaximaEntrega, $EstadoOrden, $EstadoProduccion);
        $resultado = $orden->GuardarOrden();
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Orden de trabajo insertada correctamente') {
            echo json_encode(['mensaje' => 'Orden de trabajo insertada correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}