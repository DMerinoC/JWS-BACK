<?php
require_once '../../models/cotizacion.php';
date_default_timezone_set('America/Lima');

if (isset($_POST["CodigoCliente"], $_POST["Estado"])) {
    $CodigoCliente = $_POST["CodigoCliente"];
    $Estado = $_POST["Estado"];

    if (!empty($CodigoCliente) && !empty($Estado)) {
        // INSTANCIAMOS
        $cotizacion = new cotizacion("", $CodigoCliente, "", "", "", date('Y-m-d H:i:s', time()), $Estado);
        // APLICAMOS GUARDAR
        $resultado = $cotizacion->GuardarCotizacion();
        // MANEJAMOS RESPUESTAS
        if (is_array($resultado) && count($resultado) > 0 ) {
            echo json_encode(['data'=>$resultado[0]["idcotizacion"]]);
        }
    } else {
        echo json_encode(['-' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}