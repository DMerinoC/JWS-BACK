<?php
header("Access-Control-Allow-Origin: http://localhost:8080");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    http_response_code(200); // OK
    exit();
}
require_once '../../models/trabajador.php';
require_once '../../config/tokenJWT.php';

use \Firebase\JWT\JWT;
use \Firebase\JWT\Key;

$validacion = false;

try {
    $token = $_POST["token"];
    $UsuarioTrabajador = $_POST["UsuarioTrabajador"];

    $jwt = new JWT();
    $key = new key($key_, "HS256");

    $tokenResuelto = $jwt->decode($token, $key);
    if ($tokenResuelto->usuario->UsuarioTrabajador == $UsuarioTrabajador) {
        $validacion = true;
    } else {
        $validacion = false;
    }
    echo $validacion;
} catch (\Throwable $th) {
    $validacion = false;
    echo $validacion;
}