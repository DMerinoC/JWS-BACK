<?php
require_once '../../config/conexion.php';
class cobranza
{
    public $CodigoCobranza;
    public $CodigoCliente;
    public $NombreCliente;
    public $FechaEmision;
    public $FechaVencimiento;
    public $Delivery;
    public $Monto;
    public $Moneda;
    public $Documento;
    public $EstadoCobranza;
    private $conexion;

    function __construct($CodigoCobranza, $CodigoCliente, $NombreCliente, $FechaEmision, $FechaVencimiento, $Delivery, $Monto, $Moneda, $Documento, $EstadoCobranza, $iniciarBD = true)
    {
        $this->CodigoCobranza = $CodigoCobranza;
        $this->CodigoCliente = $CodigoCliente;
        $this->NombreCliente = $NombreCliente;
        $this->FechaEmision = $FechaEmision;
        $this->FechaVencimiento = $FechaVencimiento;
        $this->Delivery = $Delivery;
        $this->Monto = $Monto;
        $this->Moneda = $Moneda;
        $this->Documento = $Documento;
        $this->EstadoCobranza = $EstadoCobranza;
        if ($iniciarBD) {
            $this->conexion = new conexion();
        }
    }
    public static function Listar()
    {
        $listarCobranza = [];
        $conexion = new conexion();
        $sql = "CALL listarcobranza();";
        $stmt = $conexion->prepare($sql);
        $stmt->execute();
        while ($datos = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $cobranza = new cobranza(
                $datos["idcobranza"],
                $datos["idcliente"],
                $datos["nombre_cliente"],
                $datos["fecha_emision"],
                $datos["fecha_vencimiento"],
                $datos["delivery"],
                $datos["monto"],
                $datos["moneda"],
                $datos["documento"],
                $datos["estado_cobranza"],
                false
            );
            array_push($listarCobranza, $cobranza);
        }
        return $listarCobranza;
    }
    public function GuardarCobranza()
    {
        try {
            $CodigoCliente = $this->CodigoCliente;
            $FechaEmision = $this->FechaEmision;
            $FechaVencimiento = $this->FechaVencimiento;
            $Delivery = $this->Delivery;
            $Monto = $this->Monto;
            $Moneda = $this->Moneda;
            $Documento = $this->Documento;
            $EstadoCobranza = $this->EstadoCobranza;
            $sql = "CALL crearCobranza(?, ?, ?, ?, ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoCliente, $FechaEmision, $FechaVencimiento, $Delivery, $Monto, $Moneda, $Documento, $EstadoCobranza]);
            $results = [];
            do {
                $results[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());
            return $results;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function EliminarCobranza()
    {
        try {
            $CodigoCobranza = $this->CodigoCobranza;
            $sql = "CALL eliminarCobranza(?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoCobranza]);
            $resultados = [];
            do {
                $resultados[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());

            return $resultados;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function ActualizarCobranza()
    {
        try {
            $CodigoCobranza = $this->CodigoCobranza;
            $CodigoCliente = $this->CodigoCliente;
            $FechaEmision = $this->FechaEmision;
            $FechaVencimiento = $this->FechaVencimiento;
            $Delivery = $this->Delivery;
            $Monto = $this->Monto;
            $Moneda = $this->Moneda;
            $Documento = $this->Documento;
            $EstadoCobranza = $this->EstadoCobranza;
            $sql = "CALL actualizarCobranza( ?, ?, ?, ?, ?, ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoCobranza, $CodigoCliente, $FechaEmision, $FechaVencimiento, $Delivery, $Monto, $Moneda, $Documento, $EstadoCobranza]);
            $resultados = [];
            do {
                $resultados[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());

            return $resultados;
        } catch (PDOException $e) {
            return false;
        }
    }
}
