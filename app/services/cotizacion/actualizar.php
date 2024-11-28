<?php
require_once '../../models/cotizacion.php';
require_once '../../models/cobranza.php';
date_default_timezone_set('America/Lima');
if (isset($_POST["CodigoCotizacion"], $_POST["CodigoCliente"], $_POST["FechaEmision"], $_POST["Estado"])) {
    $CodigoCotizacion = $_POST["CodigoCotizacion"];
    $CodigoCliente = $_POST["CodigoCliente"];
    $FechaEmision = $_POST["FechaEmision"];
    $Estado = $_POST["Estado"];

    if ($Estado == "Aprobado") {
        $Delivery = $_POST["Delivery"];
        $Monto = $_POST["Monto"];
        $Moneda = $_POST["Moneda"];
        $EstadoCobranza = $_POST["EstadoCobranza"];

        if (empty($Monto) || empty($Moneda) || empty($EstadoCobranza)) {
            echo json_encode(['mensaje' => 'Rellene los campos vacios']);
            return;
        }

        $cobranza = new cobranza(
            "",
            $CodigoCotizacion,
            $CodigoCliente,
            "",
            date('Y-m-d H:i:s', time()),
            date('Y-m-d H:i:s', strtotime('+2 months', strtotime(date('Y-m-d H:i:s', time())))),
            $Delivery, //input normal
            $Monto, // lo mandas
            $Moneda, // soles dolares
            "", // no sé
            $EstadoCobranza // Pago Pendiente Pago Parcial Pagado
        );
        $agregado = $cobranza->GuardarCobranza();
    }

    if (!empty($CodigoCotizacion) && !empty($CodigoCliente) && !empty($FechaEmision) && !empty($Estado)) {
        // INSTANCIAMOS
        $cotizacion = new cotizacion(
            $CodigoCotizacion,
            $CodigoCliente,
            "",
            "",
            "",
            $FechaEmision,
            $Estado
        );
        // APLICAMOS GUARDAR
        $resultado = $cotizacion->ActualizarCotizacion();
        $resultado_resta = $cotizacion->restarMateria();
        // MANEJAMOS RESPUESTAS
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'La cotizacion no existe') {
            echo json_encode(['mensaje' => 'La cotizacion no existe']);
        } else if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Cotizacion actualizada correctamente') {
            echo json_encode(['mensaje' => 'Cotizacion actualizada correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}