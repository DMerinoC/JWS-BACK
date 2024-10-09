<?php
require_once '../../models/cliente.php';
if (isset($_POST["CodigoCliente"])) {
    $CodigoCliente = $_POST["CodigoCliente"];
    if (!empty($CodigoCliente)) {
        $cliente = new cliente($CodigoCliente, "", "", "", "", "", "", "", "");
        $resultado = $cliente->EliminarCliente();
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'El cliente no existe') {
            echo json_encode(['mensaje' => 'El cliente no existe']);
        } else if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Cliente eliminado correctamente') {
            echo json_encode(['mensaje' => 'Cliente eliminado correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}