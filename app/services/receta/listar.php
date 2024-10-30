<?php
require_once '../../models/receta.php';

// Función para validar la fecha
$idproducto = isset($_GET['idproducto']) ? intval($_GET['idproducto']) : 0;
// Validar parámetros
if ($idproducto > 0) {
    $receta = receta::Listar($idproducto);
    echo json_encode($receta);
} else {
    echo json_encode(["error" => "Parámetros insuficientes o inválidos"]);
}
