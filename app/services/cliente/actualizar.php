<?php
require_once '../../models/cliente.php';

if (isset($_POST["CodigoCliente"],$_POST["NombreCliente"], $_POST["Tipo"], $_POST["NumeroDocumento"],  $_POST["Email"], $_POST["Celular"])) {
    $CodigoCliente = $_POST["CodigoCliente"];
    $Tipo = $_POST["Tipo"];
    $NumeroDocumento = $_POST["NumeroDocumento"];
    $NombreCliente = $_POST["NombreCliente"];
    $Email = $_POST["Email"];
    $Celular = $_POST["Celular"];

    if (!empty($CodigoCliente) &&!empty($NombreCliente) && !empty($Tipo) && !empty($NumeroDocumento) &&  !empty($Email) && !empty($Celular)) {
        // INSTANCIAMOS
        $cliente = new cliente($CodigoCliente, $Tipo, $NumeroDocumento, $NombreCliente, $Email, $Celular);
        // APLICAMOS GUARDAR
        $resultado = $cliente->ActualizarCliente();
        // MANEJAMOS RESPUESTAS
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'El cliente ya existe') {
            echo json_encode(['mensaje' => 'El cliente ya existe']);
        } else if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Cliente actualizado correctamente') {
            echo json_encode(['mensaje' => 'Cliente actualizado correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}