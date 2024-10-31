<?php
require_once '../../models/trabajador.php';
require_once '../../config/tokenJWT.php';

use \Firebase\JWT\JWT;
use \Firebase\JWT\Key;

header('Content-Type: application/json');

$UsuarioTrabajador = $_POST["UsuarioTrabajador"] ?? null;
$ClaveTrabajador = $_POST["ClaveTrabajador"] ?? null;

if (!$UsuarioTrabajador || !$ClaveTrabajador) {
    echo json_encode(array("error" => "Usuario y contraseña son requeridos."));
    http_response_code(400);
    exit;
}
$usuario = new trabajador(0, "", "", "", $UsuarioTrabajador, "", "", "", "");
$usuario->ClaveTrabajador = $ClaveTrabajador;
$usuarioValidado = $usuario->Validar();

if ($usuarioValidado->CodigoTrabajador == 0) {
    echo json_encode(array("error" => "Credenciales inválidas."));
    http_response_code(401);
    exit;
}

try {
    $jwt = new JWT();
    $token = $jwt->encode(array("usuario" => $usuarioValidado), $key_, "HS256");
    echo json_encode(array("token" => $token));
} catch (Exception $e) {
    echo json_encode(array("error" => "Error al generar el token: " . $e->getMessage()));
    http_response_code(500); // Internal Server Error
}