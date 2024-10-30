<?php
require_once '../../models/cobranza.php';
if (
    isset(
    $_POST["CodigoCobranza"],
    $_POST["CodigoCliente"],
    $_POST["FechaEmision"],
    $_POST["FechaVencimiento"],
    $_POST["Delivery"],
    $_POST["Monto"],
    $_POST["Moneda"],
    $_POST["Documento"],
    $_POST["EstadoCobranza"]
)
) {
    $CodigoCobranza = $_POST["CodigoCobranza"];
    $CodigoCliente = $_POST["CodigoCliente"];
    $FechaEmision = $_POST["FechaEmision"];
    $FechaVencimiento = $_POST["FechaVencimiento"];
    $Delivery = $_POST["Delivery"];
    $Monto = $_POST["Monto"];
    $Moneda = $_POST["Moneda"];
    $Documento = $_POST["Documento"];
    $EstadoCobranza = $_POST["EstadoCobranza"];

    if (!empty($CodigoCobranza) && !empty($CodigoCliente) && !empty($FechaEmision) && !empty($FechaVencimiento) && !empty($Delivery) && !empty($Monto) && !empty($Moneda) && !empty($Documento) && !empty($EstadoCobranza)) {
        // INSTANCIAMOS
        $cobranza = new cobranza($CodigoCobranza, $CodigoCliente, "", $FechaEmision, $FechaVencimiento, $Delivery, $Monto, $Moneda, $Documento, $EstadoCobranza);
        // APLICAMOS GUARDAR
        $resultado = $cobranza->ActualizarCobranza();
        // MANEJAMOS RESPUESTAS
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Cobranza actualizada correctamente') {
            echo json_encode(['mensaje' => 'Cobranza actualizada correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}
