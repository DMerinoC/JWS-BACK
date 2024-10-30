<?php
require_once '../../models/guiaRemision.php';
if (isset($_POST["CodigoCotizacion"], $_POST["FechaEmisionRemision"], $_POST["EstadoGuia"], $_POST["Garantia"])) {
    $CodigoCotizacion = $_POST["CodigoCotizacion"];
    $FechaEmisionRemision = $_POST["FechaEmisionRemision"];
    $Garantia = $_POST["Garantia"];
    $EstadoGuia = $_POST["EstadoGuia"];

    if (!empty($CodigoCotizacion) && !empty($FechaEmisionRemision) && !empty($EstadoGuia) && !empty($Garantia)) {
        $remision = new remision("", $CodigoCotizacion, "", $Garantia, $FechaEmisionRemision, $EstadoGuia);
        $resultado = $remision->GuardarRemision();
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Guia remision insertada correctamente') {
            echo json_encode(['mensaje' => 'Guia remision insertada correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}