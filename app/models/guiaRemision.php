<?php
require_once '../../config/conexion.php';
class remision
{
    public $CodigoRemision;
    public $CodigoCotizacion;
    public $CodigoCliente;
    public $NombreCliente;
    public $FechaEmisionRemision;
    public $ObservacionRemision;
    private $conexion;

    function __construct($CodigoRemision, $CodigoCotizacion, $CodigoCliente, $NombreCliente, $FechaEmisionRemision, $ObservacionRemision, $iniciarBD = true)
    {
        $this->CodigoRemision = $CodigoRemision;
        $this->CodigoCotizacion = $CodigoCotizacion;
        $this->CodigoCliente = $CodigoCliente;
        $this->NombreCliente = $NombreCliente;
        $this->FechaEmisionRemision = $FechaEmisionRemision;
        $this->ObservacionRemision = $ObservacionRemision;
        if ($iniciarBD) {
            $this->conexion = new conexion();
        }
    }
    public static function Listar()
    {
        $listarRemision = [];
        $conexion = new conexion();
        $sql = "CALL listarGuiaRemision();";
        $stmt = $conexion->prepare($sql);
        $stmt->execute();
        while ($datos = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $remision = new remision(
                $datos["idguiaremision"],
                $datos["idcotizacion"],
                $datos["idcliente"],
                $datos["nombre_cliente"],
                $datos["fecha_emision"],
                $datos["observacion"],
                false
            );
            array_push($listarRemision, $remision);
        }
        return $listarRemision;
    }
    public function GuardarRemision()
    {
        try {
            $CodigoCotizacion = $this->CodigoCotizacion;
            $FechaEmisionRemision = $this->FechaEmisionRemision;
            $ObservacionRemision = $this->ObservacionRemision;
            $sql = "CALL crearGuiaRemision(?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoCotizacion, $FechaEmisionRemision, $ObservacionRemision]);
            $results = [];
            do {
                $results[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());
            return $results;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function EliminarRemision()
    {
        try {
            $CodigoRemision = $this->CodigoRemision;
            $sql = "CALL eliminarGuiaRemision(?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoRemision]);
            $resultados = [];
            do {
                $resultados[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());

            return $resultados;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function ActualizarRemision()
    {
        try {
            $CodigoRemision = $this->CodigoRemision;
            $CodigoCotizacion = $this->CodigoCotizacion;
            $FechaEmisionRemision = $this->FechaEmisionRemision;
            $ObservacionRemision = $this->ObservacionRemision;
            $sql = "CALL actualizarGuiaRemision( ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoRemision, $CodigoCotizacion, $FechaEmisionRemision, $ObservacionRemision]);
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
