<?php
require_once '../../models/detalleCotizacion.php';

// Función para validar la fecha
$idcotizacion = isset($_GET['idcotizacion']) ? intval($_GET['idcotizacion']) : 0;
// Validar parámetros
if ($idcotizacion > 0) {
    $detalle = detalleCotizacion::Listar($idcotizacion);
    echo json_encode($detalle);
} else {
    echo json_encode(["error" => "Parámetros insuficientes o inválidos"]);
}
