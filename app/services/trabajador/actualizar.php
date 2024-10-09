<?php
require_once '../../models/trabajador.php';

if (isset($_POST["CodigoTrabajador"], $_POST["CodigoRol"], $_POST["NombreTrabajador"], $_POST["CorreoTrabajador"], $_POST["UsuarioTrabajador"], $_POST["ClaveTrabajador"], $_POST["SueldoTrabajador"])) {
    $CodigoTrabajador = $_POST["CodigoTrabajador"];
    $CodigoRol = $_POST["CodigoRol"];
    $NombreTrabajador = $_POST["NombreTrabajador"];
    $CorreoTrabajador = $_POST["CorreoTrabajador"];
    $UsuarioTrabajador = $_POST["UsuarioTrabajador"];
    $ClaveTrabajador = $_POST["ClaveTrabajador"];
    $SueldoTrabajador = $_POST["SueldoTrabajador"];

    if (!empty($CodigoTrabajador) && !empty($CodigoRol) && !empty($NombreTrabajador) && !empty($CorreoTrabajador) && !empty($UsuarioTrabajador) && !empty($ClaveTrabajador) && !empty($SueldoTrabajador)) {
        $hashedPassword = password_hash($ClaveTrabajador, PASSWORD_BCRYPT);
        // INSTANCIAMOS
        $trabajador = new trabajador($CodigoTrabajador, $CodigoRol, $NombreTrabajador, $CorreoTrabajador, $UsuarioTrabajador, $hashedPassword, $SueldoTrabajador, "");
        // APLICAMOS GUARDAR
        $resultado = $trabajador->actualizarTrabajador();
        // MANEJAMOS RESPUESTAS
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'El trabajador ya existe') {
            echo json_encode(['mensaje' => 'El trabajador ya existe']);
        }else if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Trabajador actualizado correctamente') {
            echo json_encode(['mensaje' => 'Trabajador actualizado correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}