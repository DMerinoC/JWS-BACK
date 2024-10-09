<?php
require_once '../../models/detalleCotizacion.php';

// Función para validar la fecha
function validarFecha($fecha)
{
    $d = DateTime::createFromFormat('Y-m-d', $fecha);
    return $d && $d->format('Y-m-d') === $fecha;
}

$idcotizacion = isset($_GET['idcotizacion']) ? intval($_GET['idcotizacion']) : 0;
$fecha_emision = isset($_GET['fecha_emision']) ? $_GET['fecha_emision'] : null;

// Validar parámetros
if ($idcotizacion > 0 && $fecha_emision && validarFecha($fecha_emision)) {
    $detalle = detalleCotizacion::Listar($idcotizacion, $fecha_emision);
    echo json_encode($detalle);
} else {
    echo json_encode(["error" => "Parámetros insuficientes o inválidos"]);
}
