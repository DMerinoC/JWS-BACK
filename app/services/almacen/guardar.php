<?php
require_once '../../models/almacen.php';
if (isset($_POST["CodigoOrdenTrabajo"], $_POST["EstadoProductoAlmacen"])) {
    $CodigoOrdenTrabajo = $_POST["CodigoOrdenTrabajo"];
    $EstadoProductoAlmacen = $_POST["EstadoProductoAlmacen"];

    if (!empty($CodigoOrdenTrabajo) && !empty($EstadoProductoAlmacen)) {
        // INSTANCIAMOS
        $almacen = new almacen("", $CodigoOrdenTrabajo, $EstadoProductoAlmacen);
        // APLICAMOS GUARDAR
        $resultado = $almacen->GuardarAlmacen();
        // MANEJAMOS RESPUESTAS
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Almacen insertado correctamente') {
            echo json_encode(['mensaje' => 'Almacen insertado correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde', $CodigoOrdenTrabajo, $EstadoProductoAlmacen]);
}