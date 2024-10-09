<?php
require_once '../../models/cliente.php';

if (isset($_POST["CodigoCliente"], $_POST["NombreCliente"], $_POST["RucCliente"], $_POST["TipoRuc"], $_POST["NivelInteres"], $_POST["ObservacionCompras"], $_POST["Email"], $_POST["Telefono"], $_POST["Celular"])) {
    $CodigoCliente = $_POST["CodigoCliente"];
    $NombreCliente = $_POST["NombreCliente"];
    $RucCliente = $_POST["RucCliente"];
    $TipoRuc = $_POST["TipoRuc"];
    $NivelInteres = $_POST["NivelInteres"];
    $ObservacionCompras = $_POST["ObservacionCompras"];
    $Email = $_POST["Email"];
    $Telefono = $_POST["Telefono"];
    $Celular = $_POST["Celular"];

    if (!empty($CodigoCliente) && !empty($NombreCliente) && !empty($RucCliente) && !empty($TipoRuc) && !empty($NivelInteres) && !empty($ObservacionCompras) && !empty($Email) && !empty($Telefono) && !empty($Celular)) {
        // INSTANCIAMOS
        $cliente = new cliente($CodigoCliente, $NombreCliente, $RucCliente, $TipoRuc, $NivelInteres, $ObservacionCompras, $Email, $Telefono, $Celular);
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