<?php
require_once '../../config/conexion.php';
class orden
{
    public $CodigoOrdenTrabajo;
    public $CodigoCotizacion;
    public $CodigoTrabajador;
    public $NombreTrabajador;
    public $SueldoTrabajador;
    public $FechaEmisionOrden;
    public $FechaMaximaEntrega;
    public $ObservacionOrdenTrabajo;
    private $conexion;

    function __construct($CodigoOrdenTrabajo, $CodigoCotizacion, $CodigoTrabajador, $NombreTrabajador, $SueldoTrabajador, $FechaEmisionOrden, $FechaMaximaEntrega, $ObservacionOrdenTrabajo, $iniciarBD = true)
    {
        $this->CodigoOrdenTrabajo = $CodigoOrdenTrabajo;
        $this->CodigoCotizacion = $CodigoCotizacion;
        $this->CodigoTrabajador = $CodigoTrabajador;
        $this->NombreTrabajador = $NombreTrabajador;
        $this->SueldoTrabajador = $SueldoTrabajador;
        $this->FechaEmisionOrden = $FechaEmisionOrden;
        $this->FechaMaximaEntrega = $FechaMaximaEntrega;
        $this->ObservacionOrdenTrabajo = $ObservacionOrdenTrabajo;
        if ($iniciarBD) {
            $this->conexion = new conexion();
        }
    }
    public static function Listar()
    {
        $listarOrden = [];
        $conexion = new conexion();
        $sql = "CALL listarOrdenTrabajo();";
        $stmt = $conexion->prepare($sql);
        $stmt->execute();
        while ($datos = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $orden = new orden(
                $datos["idordentrabajo"],
                $datos["idcotizacion"],
                $datos["idtrabajador"],
                $datos["nombre_trabajador"],
                $datos["sueldo_trabajador"],
                $datos["fecha_emision"],
                $datos["fecha_maxima_entrega"],
                $datos["observacion"],
                false
            );
            array_push($listarOrden, $orden);
        }
        return $listarOrden;
    }
    public function GuardarOrden()
    {
        try {
            $CodigoCotizacion = $this->CodigoCotizacion;
            $CodigoTrabajador = $this->CodigoTrabajador;
            $FechaEmisionOrden = $this->FechaEmisionOrden;
            $FechaMaximaEntrega = $this->FechaMaximaEntrega;
            $ObservacionOrdenTrabajo = $this->ObservacionOrdenTrabajo;
            $sql = "CALL crearOrdenTrabajo(?, ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoCotizacion, $CodigoTrabajador, $FechaEmisionOrden, $FechaMaximaEntrega, $ObservacionOrdenTrabajo]);
            $results = [];
            do {
                $results[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());
            return $results;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function EliminarOrden()
    {
        try {
            $CodigoOrdenTrabajo = $this->CodigoOrdenTrabajo;
            $sql = "CALL eliminarOrdenTrabajo(?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoOrdenTrabajo]);
            $resultados = [];
            do {
                $resultados[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());

            return $resultados;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function ActualizarOrden()
    {
        try {
            $CodigoOrdenTrabajo = $this->CodigoOrdenTrabajo;
            $CodigoCotizacion = $this->CodigoCotizacion;
            $CodigoTrabajador = $this->CodigoTrabajador;
            $FechaEmisionOrden = $this->FechaEmisionOrden;
            $FechaMaximaEntrega = $this->FechaMaximaEntrega;
            $ObservacionOrdenTrabajo = $this->ObservacionOrdenTrabajo;
            $sql = "CALL actualizarOrdenTrabajo( ?, ?, ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoOrdenTrabajo, $CodigoCotizacion, $CodigoTrabajador, $FechaEmisionOrden, $FechaMaximaEntrega, $ObservacionOrdenTrabajo]);
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
