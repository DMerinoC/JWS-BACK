<?php
require_once '../../models/guiaRemision.php';
$remision = remision::Listar();
echo json_encode($remision);