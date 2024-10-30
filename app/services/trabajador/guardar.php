<?php
require_once '../../models/trabajador.php';

if (isset($_POST["CodigoRol"], $_POST["NombreTrabajador"], $_POST["CorreoTrabajador"], $_POST["UsuarioTrabajador"], $_POST["ClaveTrabajador"], $_POST["SueldoTrabajador"], $_POST["SueldoExtraTrabajador"])) {
    $CodigoRol = $_POST["CodigoRol"];
    $NombreTrabajador = $_POST["NombreTrabajador"];
    $CorreoTrabajador = $_POST["CorreoTrabajador"];
    $UsuarioTrabajador = $_POST["UsuarioTrabajador"];
    $ClaveTrabajador = $_POST["ClaveTrabajador"];
    $SueldoTrabajador = $_POST["SueldoTrabajador"];
    $SueldoExtraTrabajador = $_POST["SueldoExtraTrabajador"];

    if (!empty($CodigoRol) && !empty($NombreTrabajador) && !empty($CorreoTrabajador) && !empty($UsuarioTrabajador) && !empty($ClaveTrabajador) && !empty($SueldoTrabajador) && !empty($SueldoExtraTrabajador)) {
        $hashedPassword = password_hash($ClaveTrabajador, PASSWORD_BCRYPT);
        $trabajador = new trabajador("", $CodigoRol, $NombreTrabajador, $CorreoTrabajador, $UsuarioTrabajador, $hashedPassword, $SueldoTrabajador, $SueldoExtraTrabajador,"");
        $resultado = $trabajador->GuardarTrabajador();
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'El nombre del trabajador y el usuario ya existen') {
            echo json_encode(['mensaje' => 'El nombre del trabajador y el usuario ya existen']);
        } else if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'El trabajador ya existe') {
            echo json_encode(['mensaje' => 'El trabajador ya existe']);
        } else if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'El usuario ya existe') {
            echo json_encode(['mensaje' => 'El usuario ya existe']);
        } else if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Trabajador insertado correctamente') {
            echo json_encode(['mensaje' => 'Trabajador insertado correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}