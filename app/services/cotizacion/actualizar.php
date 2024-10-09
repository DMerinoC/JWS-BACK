<?php
require_once '../../models/cotizacion.php';
if (isset($_POST["CodigoCotizacion"], $_POST["CodigoCliente"], $_POST["FechaEmision"], $_POST["ObservacionCotizacion"])) {
    $CodigoCotizacion = $_POST["CodigoCotizacion"];
    $CodigoCliente = $_POST["CodigoCliente"];
    $FechaEmision = $_POST["FechaEmision"];
    $ObservacionCotizacion = $_POST["ObservacionCotizacion"];

    if (!empty($CodigoCotizacion) && !empty($CodigoCliente) && !empty($FechaEmision) && !empty($ObservacionCotizacion)) {
        // INSTANCIAMOS
        $cotizacion = new cotizacion($CodigoCotizacion, $CodigoCliente, "", "", $FechaEmision, $ObservacionCotizacion);
        // APLICAMOS GUARDAR
        $resultado = $cotizacion->ActualizarCotizacion();
        // MANEJAMOS RESPUESTAS
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'La cotizacion no existe') {
            echo json_encode(['mensaje' => 'La cotizacion no existe']);
        } else if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Cotizacion actualizada correctamente') {
            echo json_encode(['mensaje' => 'Cotizacion actualizada correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}
