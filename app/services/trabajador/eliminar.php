<?php
require_once '../../models/trabajador.php';
if (isset($_POST["CodigoTrabajador"])) {
    $CodigoTrabajador = $_POST["CodigoTrabajador"];
    if (!empty($CodigoTrabajador)) {
        $trabajador = new trabajador($CodigoTrabajador, "", "", "", "", "", "", "","");
        $resultado = $trabajador->EliminarTrabajador();
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'El trabajador no existe') {
            echo json_encode(['mensaje' => 'El trabajador no existe']);
        } else if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Trabajador eliminado correctamente') {
            echo json_encode(['mensaje' => 'Trabajador eliminado correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}