<?php
require_once '../../models/cotizacion.php';

if (isset($_POST["CodigoCliente"], $_POST["FechaEmision"], $_POST["Estado"], $_POST["PrecioCotizacion"])) {
    $CodigoCliente = $_POST["CodigoCliente"];
    $FechaEmision = $_POST["FechaEmision"];
    $Estado = $_POST["Estado"];
    $PrecioCotizacion = $_POST["PrecioCotizacion"];

    if (!empty($CodigoCliente) && !empty($FechaEmision) && !empty($Estado) && !empty($PrecioCotizacion)) {
        // INSTANCIAMOS
        $cotizacion = new cotizacion("", $CodigoCliente, "", "", "", $FechaEmision, $Estado, $PrecioCotizacion);
        // APLICAMOS GUARDAR
        $resultado = $cotizacion->GuardarCotizacion();
        // MANEJAMOS RESPUESTAS
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Cotizacion insertado correctamente') {
            echo json_encode(['mensaje' => 'Cotizacion insertado correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}