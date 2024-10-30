<?php
require_once '../../models/ordenTrabajo.php';

if (isset($_POST["CodigoOrdenTrabajo"], $_POST["CodigoCotizacion"], $_POST["CodigoTrabajador"], $_POST["FechaEmisionOrden"], $_POST["FechaMaximaEntrega"], $_POST["EstadoOrden"])) {
    $CodigoOrdenTrabajo = $_POST["CodigoOrdenTrabajo"];
    $CodigoCotizacion = $_POST["CodigoCotizacion"];
    $CodigoTrabajador = $_POST["CodigoTrabajador"];
    $FechaEmisionOrden = $_POST["FechaEmisionOrden"];
    $FechaMaximaEntrega = $_POST["FechaMaximaEntrega"];
    $EstadoOrden = $_POST["EstadoOrden"];

    if (!empty($CodigoOrdenTrabajo) && !empty($CodigoCotizacion) && !empty($CodigoTrabajador) && !empty($FechaEmisionOrden) && !empty($FechaMaximaEntrega) && !empty($EstadoOrden)) {
        $orden = new orden($CodigoOrdenTrabajo, $CodigoCotizacion, $CodigoTrabajador, "", "", $FechaEmisionOrden, $FechaMaximaEntrega, $EstadoOrden);
        $resultado = $orden->ActualizarOrden();
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Orden de Trabajo actualizada correctamente') {
            echo json_encode(['mensaje' => 'Orden de Trabajo actualizada correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}