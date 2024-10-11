<?php
require_once '../../config/conexion.php';

class cobranza
{
    public $CodigoCobranza;
    public $CodigoCliente;
    public $NombreCliente;
    public $FechaEmision;
    public $FechaVencimiento;
    public $Monto;
    public $Moneda;
    public $Documento;
    public $Observacion;
    public $Recurrente;
    public $EstadoCobranza;
    private $conexion;

    function __construct($CodigoCobranza, $CodigoCliente, $NombreCliente, $FechaEmision, $FechaVencimiento, $Monto, $Moneda, $Documento, $Observacion, $Recurrente, $EstadoCobranza, $iniciarBD = true)
    {
        $this->CodigoCobranza = $CodigoCobranza;
        $this->CodigoCliente = $CodigoCliente;
        $this->NombreCliente = $NombreCliente;
        $this->FechaEmision = $FechaEmision;
        $this->FechaVencimiento = $FechaVencimiento;
        $this->Monto = $Monto;
        $this->Moneda = $Moneda;
        $this->Documento = $Documento;
        $this->Observacion = $Observacion;
        $this->Recurrente = $Recurrente;
        $this->EstadoCobranza = $EstadoCobranza;
        if ($iniciarBD) {
            $this->conexion = new conexion();
        }
    }

    public static function Listar()
    {
        $listarCobranza = [];
        $conexion = new conexion();
        $sql = "CALL listarCobranza();"; 
        $stmt = $conexion->prepare($sql);
        $stmt->execute();
        while ($datos = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $cobranza = new cobranza(
                $datos["idcobranza"],         
                $datos["idcliente"],           
                $datos["nombre_cliente"],      
                $datos["fecha_emision"],       
                $datos["fecha_vencimiento"],   
                $datos["monto"],               
                $datos["moneda"],              
                $datos["documento"],
                $datos["observacion"],
                $datos["recurrente"],
                $datos["estadocobranza"],
                false
            );
            array_push($listarCobranza, $cobranza);
        }
        
        return $listarCobranza;
    }

    public function GuardarCobranza()
    {
        try {
            $sql = "CALL crearCobranza(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([
                $this->CodigoCliente,
                $this->NombreCliente,
                $this->FechaEmision,
                $this->FechaVencimiento,
                $this->Monto,
                $this->Moneda,
                $this->Documento,
                $this->Observacion,
                $this->Recurrente,
                $this->EstadoCobranza
            ]); 
            
            if ($stmt->rowCount() > 0) {
                return $stmt->fetchAll(PDO::FETCH_ASSOC);
            } else {
                return [['mensaje' => 'Cobranza insertada correctamente']];
            }
        } catch (PDOException $e) {
            return [['mensaje' => 'Error al insertar la cobranza: ' . $e->getMessage()]];
        }
    }
    

    public function EliminarCobranza()
    {
        try {
            $sql = "CALL eliminarCobranza(?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$this->CodigoCobranza]);
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            return ['error' => $e->getMessage()];
        }
    }

    public function ActualizarCobranza()
    {
        try {
            $sql = "CALL actualizarCobranza(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([
                $this->CodigoCobranza,
                $this->CodigoCliente,
                $this->NombreCliente,
                $this->FechaEmision,
                $this->FechaVencimiento,
                $this->Monto,
                $this->Moneda,
                $this->Documento,
                $this->Observacion,
                $this->Recurrente,
                $this->EstadoCobranza
            ]);
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            return ['error' => $e->getMessage()];
        }
    }
}
?>
