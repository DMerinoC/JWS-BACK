<?php
require_once '../../models/cobranza.php';
if (
    isset(
    $_POST["CodigoCotizacion"],
    $_POST["FechaEmision"],
    $_POST["FechaVencimiento"],
    $_POST["Delivery"],
    $_POST["Monto"],
    $_POST["Moneda"],
    $_POST["Documento"],
    $_POST["EstadoCobranza"]
)
) {
    $CodigoCotizacion = $_POST["CodigoCotizacion"];
    $FechaEmision = $_POST["FechaEmision"];
    $FechaVencimiento = $_POST["FechaVencimiento"];
    $Delivery = $_POST["Delivery"];
    $Monto = $_POST["Monto"];
    $Moneda = $_POST["Moneda"];
    $Documento = $_POST["Documento"];
    $EstadoCobranza = $_POST["EstadoCobranza"];

    if (!empty($CodigoCotizacion) && !empty($FechaEmision) && !empty($FechaVencimiento) && !empty($Delivery) && !empty($Monto) && !empty($Moneda) && !empty($Documento) && !empty($EstadoCobranza)) {
        // INSTANCIAMOS
        $cobranza = new cobranza("", $CodigoCotizacion, "", "", $FechaEmision, $FechaVencimiento, $Delivery, $Monto, $Moneda, $Documento, $EstadoCobranza);
        // APLICAMOS GUARDAR
        $resultado = $cobranza->GuardarCobranza();
        // MANEJAMOS RESPUESTAS
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Cobranza insertada correctamente') {
            echo json_encode(['mensaje' => 'Cobranza insertada correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}
