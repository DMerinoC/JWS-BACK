<?php
require_once '../../models/almacen.php';

if (isset($_POST["CodigoAlmacen"])) {
    $CodigoAlmacen = $_POST["CodigoAlmacen"];

    if (!empty($CodigoAlmacen)) {
        // INSTANCIAMOS
        $almacen = new almacen($CodigoAlmacen, "", "");
        // APLICAMOS GUARDAR
        $resultado = $almacen->EliminarAlmacen();
        // MANEJAMOS RESPUESTAS
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Almacen eliminado correctamente') {
            echo json_encode(['mensaje' => 'Almacen eliminado correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}