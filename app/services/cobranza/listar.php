<?php
require_once '../../models/cobranza.php';
$cobranza = cobranza::Listar();
echo json_encode($cobranza);
