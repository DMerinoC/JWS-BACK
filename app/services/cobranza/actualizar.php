<?php
require_once '../../models/cobranza.php';
require_once '../../models/ordenTrabajo.php';
date_default_timezone_set('America/Lima');
if (
    isset(
    $_POST["CodigoCobranza"],
    $_POST["CodigoCotizacion"],
    $_POST["FechaEmision"],
    $_POST["FechaVencimiento"],
    $_POST["Delivery"],
    $_POST["Monto"],
    $_POST["Moneda"],
    $_POST["Documento"],
    $_POST["EstadoCobranza"]
)
) {
    $CodigoCobranza = $_POST["CodigoCobranza"];
    $CodigoCotizacion = $_POST["CodigoCotizacion"];
    $FechaEmision = $_POST["FechaEmision"];
    $FechaVencimiento = $_POST["FechaVencimiento"];
    $Delivery = $_POST["Delivery"];
    $Monto = $_POST["Monto"];
    $Moneda = $_POST["Moneda"];
    $Documento = $_POST["Documento"];
    $EstadoCobranza = $_POST["EstadoCobranza"];
    

    if ($EstadoCobranza == "Pagado" || $EstadoCobranza == "Pago Parcial") {
        $CodigoTrabajador = $_POST["CodigoTrabajador"];
        if(empty($CodigoTrabajador)){
            echo json_encode(['mensaje' => 'Rellene los campos vacios']);
            return;
        }
        $orden = new orden(
            "",
            $CodigoCotizacion,
            $CodigoTrabajador,
            "",
            "",
            date('Y-m-d H:i:s', time()),
            date(
                'Y-m-d H:i:s',
                strtotime(
                    '+2 months',
                    strtotime(date(
                        'Y-m-d H:i:s',
                        time()
                    ))
                )
            ),
            "Inicial",
            "Inicial"
        );
        $agregado = $orden->GuardarOrden();
    }

    if (!empty($CodigoCobranza) && !empty($CodigoCotizacion) && !empty($FechaEmision) && !empty($FechaVencimiento) && !empty($Delivery) && !empty($Monto) && !empty($Moneda) && !empty($Documento) && !empty($EstadoCobranza)) {
        // INSTANCIAMOS
        $cobranza = new cobranza($CodigoCobranza, $CodigoCotizacion, "", "", $FechaEmision, $FechaVencimiento, $Delivery, $Monto, $Moneda, $Documento, $EstadoCobranza);
        // APLICAMOS GUARDAR
        $resultado = $cobranza->ActualizarCobranza();
        // MANEJAMOS RESPUESTAS
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Cobranza actualizada correctamente') {
            echo json_encode(['mensaje' => 'Cobranza actualizada correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}