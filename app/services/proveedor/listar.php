<?php
require_once '../../models/proveedor.php';
$proveedor = proveedor::Listar();
echo json_encode($proveedor);