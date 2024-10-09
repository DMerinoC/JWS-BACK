<?php
require_once '../../models/cotizacion.php';
if (isset($_POST["CodigoCliente"], $_POST["FechaEmision"], $_POST["ObservacionCotizacion"])) {
    $CodigoCliente = $_POST["CodigoCliente"];
    $FechaEmision = $_POST["FechaEmision"];
    $ObservacionCotizacion = $_POST["ObservacionCotizacion"];

    if (!empty($CodigoCliente) && !empty($FechaEmision) && !empty($ObservacionCotizacion)) {
        // INSTANCIAMOS
        $cotizacion = new cotizacion("", $CodigoCliente, "", "", $FechaEmision, $ObservacionCotizacion);
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
