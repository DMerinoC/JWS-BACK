<?php
require_once '../../config/conexion.php';
class remision
{
    public $CodigoRemision;
    public $CodigoCotizacion;
    public $NombreCliente;
    public $Garantia;
    public $FechaEmisionRemision;
    public $EstadoGuia;
    private $conexion;

    function __construct($CodigoRemision, $CodigoCotizacion, $NombreCliente, $Garantia, $FechaEmisionRemision, $EstadoGuia, $iniciarBD = true)
    {
        $this->CodigoRemision = $CodigoRemision;
        $this->CodigoCotizacion = $CodigoCotizacion;
        $this->NombreCliente = $NombreCliente;
        $this->Garantia = $Garantia;
        $this->FechaEmisionRemision = $FechaEmisionRemision;
        $this->EstadoGuia = $EstadoGuia;
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
                $datos["nombre_cliente"],
                $datos["garantia"],
                $datos["fecha_emision"],
                $datos["estado_guia"],
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
            $Garantia = $this->Garantia;
            $FechaEmisionRemision = $this->FechaEmisionRemision;
            $EstadoGuia = $this->EstadoGuia;
            $sql = "CALL crearGuiaRemision(?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoCotizacion, $Garantia, $FechaEmisionRemision, $EstadoGuia]);
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
            $Garantia = $this->Garantia;
            $FechaEmisionRemision = $this->FechaEmisionRemision;
            $EstadoGuia = $this->EstadoGuia;
            $sql = "CALL actualizarGuiaRemision( ?, ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoRemision, $CodigoCotizacion, $Garantia, $FechaEmisionRemision, $EstadoGuia]);
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
