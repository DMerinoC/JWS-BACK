<?php
require_once '../../models/almacen.php';
$almacen = almacen::Listar();
echo json_encode($almacen);