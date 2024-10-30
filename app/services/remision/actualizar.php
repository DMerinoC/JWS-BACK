<?php
require_once '../../models/guiaRemision.php';
if (isset($_POST["CodigoRemision"], $_POST["CodigoCotizacion"], $_POST["Garantia"], $_POST["FechaEmisionRemision"], $_POST["EstadoGuia"])) {
    $CodigoRemision = $_POST["CodigoRemision"];
    $CodigoCotizacion = $_POST["CodigoCotizacion"];
    $Garantia = $_POST["Garantia"];
    $FechaEmisionRemision = $_POST["FechaEmisionRemision"];
    $EstadoGuia = $_POST["EstadoGuia"];

    if (!empty($CodigoRemision) && !empty($CodigoCotizacion) && !empty($Garantia)&& !empty($FechaEmisionRemision) && !empty($EstadoGuia)) {
        $remision = new remision($CodigoRemision, $CodigoCotizacion, "", $Garantia, $FechaEmisionRemision, $EstadoGuia);
        $resultado = $remision->ActualizarRemision();
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Guia remision actualizada correctamente') {
            echo json_encode(['mensaje' => 'Guia remision actualizada correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}