<?php
require_once '../../models/cliente.php';

if (isset($_POST["NombreCliente"], $_POST["Tipo"], $_POST["NumeroDocumento"],  $_POST["Email"], $_POST["Celular"])) {
    $Tipo = $_POST["Tipo"];
    $NumeroDocumento = $_POST["NumeroDocumento"];
    $NombreCliente = $_POST["NombreCliente"];
    $Email = $_POST["Email"];
    $Celular = $_POST["Celular"];

    if (!empty($NombreCliente) && !empty($Tipo) && !empty($NumeroDocumento) &&  !empty($Email) && !empty($Celular)) {
        $cliente = new cliente("", $Tipo, $NumeroDocumento, $NombreCliente, $Email, $Celular);
        $resultado = $cliente->GuardarCliente();
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'El cliente ya existe') {
            echo json_encode(['mensaje' => 'El cliente ya existe']);
        } else if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Cliente insertado correctamente') {
            echo json_encode(['mensaje' => 'Cliente insertado correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}