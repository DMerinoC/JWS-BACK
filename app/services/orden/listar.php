<?php
require_once '../../models/ordenTrabajo.php';
$orden = orden::Listar();
echo json_encode($orden);