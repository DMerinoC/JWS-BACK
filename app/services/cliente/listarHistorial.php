<?php
require_once '../../models/cliente.php';
$idcliente = isset($_GET['idcliente']) ? intval($_GET['idcliente']) : 0;
if ($idcliente > 0) {
    $cliente = cliente::ListarHistorial($idcliente);
    echo json_encode($cliente);
} else {
    echo json_encode(["error" => "Parámetros insuficientes o inválidos"]);
}