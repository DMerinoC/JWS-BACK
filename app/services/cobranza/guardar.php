<?php
require_once '../../models/cobranza.php';

if (isset($_POST["CodigoCliente"], $_POST["NombreCliente"], $_POST["FechaEmision"], $_POST["FechaVencimiento"], $_POST["Monto"], $_POST["Moneda"], $_POST["Documento"], $_POST["Observacion"], $_POST["Recurrente"], $_POST["EstadoCobranza"])) {
    $CodigoCliente = $_POST["CodigoCliente"];
    $FechaEmision = $_POST["NombreCliente"];
    $FechaEmision = $_POST["FechaEmision"];
    $FechaVencimiento = $_POST["FechaVencimiento"];
    $Monto = $_POST["Monto"];
    $Moneda = $_POST["Moneda"];
    $Documento = $_POST["Documento"]; 
    $Observacion = $_POST["Observacion"];
    $Recurrente = $_POST["Recurrente"];
    $EstadoCobranza = $_POST["EstadoCobranza"];

    if (!empty($CodigoCliente) && !empty($NombreCliente) && !empty($FechaEmision) && !empty($FechaVencimiento) && !empty($Monto) && !empty($Moneda) && !empty($Documento) && !empty($Observacion) && !empty($Recurrente) && !empty($EstadoCobranza)) {
        $cobranza = new cobranza("", $CodigoCliente, $NombreCliente, $FechaEmision, $FechaVencimiento, $Monto, $Moneda, $Documento, $Observacion, $Recurrente, $EstadoCobranza);
        $resultado = $cobranza->GuardarCobranza();

        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje'])) {
            echo json_encode($resultado[0]);
        } else {
            echo json_encode(['mensaje' => 'Error al insertar la cobranza']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}
?>
