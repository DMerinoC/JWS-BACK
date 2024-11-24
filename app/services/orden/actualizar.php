<?php
require_once '../../models/ordenTrabajo.php';
require_once '../../models/almacen.php';

if (isset($_POST["CodigoOrdenTrabajo"], $_POST["CodigoCotizacion"], $_POST["CodigoTrabajador"], $_POST["FechaEmisionOrden"], $_POST["FechaMaximaEntrega"], $_POST["EstadoOrden"], $_POST["EstadoProduccion"])) {
    $CodigoOrdenTrabajo = $_POST["CodigoOrdenTrabajo"];
    $CodigoCotizacion = $_POST["CodigoCotizacion"];
    $CodigoTrabajador = $_POST["CodigoTrabajador"];
    $FechaEmisionOrden = $_POST["FechaEmisionOrden"];
    $FechaMaximaEntrega = $_POST["FechaMaximaEntrega"];
    $EstadoOrden = $_POST["EstadoOrden"];
    $EstadoProduccion = $_POST["EstadoProduccion"];

    if ($EstadoOrden == "Terminado" && $EstadoProduccion == "10") {
        $almacen = new almacen("", $CodigoOrdenTrabajo, "Listo para Entrega");
        // APLICAMOS GUARDAR
        $resultado = $almacen->GuardarAlmacen();
    }

    if (!empty($CodigoOrdenTrabajo) && !empty($CodigoCotizacion) && !empty($CodigoTrabajador) && !empty($FechaEmisionOrden) && !empty($FechaMaximaEntrega) && !empty($EstadoOrden) && !empty($EstadoProduccion)) {
        $orden = new orden($CodigoOrdenTrabajo, $CodigoCotizacion, $CodigoTrabajador, "", "", $FechaEmisionOrden, $FechaMaximaEntrega, $EstadoOrden, $EstadoProduccion);
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