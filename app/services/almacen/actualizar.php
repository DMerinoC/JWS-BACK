<?php
require_once '../../models/almacen.php';
require_once '../../models/guiaRemision.php';
date_default_timezone_set('America/Lima');

if (isset($_POST["CodigoAlmacen"], $_POST["CodigoOrdenTrabajo"], $_POST["EstadoProductoAlmacen"])) {
    $CodigoAlmacen = $_POST["CodigoAlmacen"];
    $CodigoOrdenTrabajo = $_POST["CodigoOrdenTrabajo"];
    $EstadoProductoAlmacen = $_POST["EstadoProductoAlmacen"];

    if ($EstadoProductoAlmacen == "Enviado" || $EstadoProductoAlmacen == "Recogido") {
        $CodigoCotizacion = $_POST["CodigoCotizacion"];
        $Garantia = $_POST["Garantia"];
        $remision = new remision(
            "",
            $CodigoCotizacion,
            "",
            $Garantia,
            date('Y-m-d H:i:s', time()),
            "Enviado"
        );
        $resultado = $remision->GuardarRemision();
    }

    if (!empty($CodigoAlmacen) && !empty($CodigoOrdenTrabajo) && !empty($EstadoProductoAlmacen)) {
        // INSTANCIAMOS
        $almacen = new almacen($CodigoAlmacen, $CodigoOrdenTrabajo, $EstadoProductoAlmacen);
        // APLICAMOS GUARDAR
        $resultado = $almacen->ActualizarAlmacen();
        // MANEJAMOS RESPUESTAS
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Almacen actualizado correctamente') {
            echo json_encode(['mensaje' => 'Almacen actualizado correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}