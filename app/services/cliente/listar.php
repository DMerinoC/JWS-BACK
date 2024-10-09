<?php
require_once '../../models/cliente.php';
$cliente = cliente::Listar();
echo json_encode($cliente);