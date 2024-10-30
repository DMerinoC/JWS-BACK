<?php
require_once '../../config/conexion.php';
class detalleCotizacion
{
    public $CodigoDetalleCotizacion;
    public $CodigoCotizacion;
    public $CodigoProducto;
    public $NombreProducto;
    public $PrecioProducto;
    public $CantidadDetalleCotizacion;
    public $PrecioDetalleCotizacion;
    public $FechaEmisionCotizacion;
    public $ObservacionDetalleCotizacion;
    private $conexion;

    function __construct($CodigoDetalleCotizacion, $CodigoCotizacion, $CodigoProducto, $NombreProducto, $PrecioProducto, $CantidadDetalleCotizacion, $PrecioDetalleCotizacion, $FechaEmisionCotizacion, $ObservacionDetalleCotizacion, $iniciarBD = true)
    {
        $this->CodigoDetalleCotizacion = $CodigoDetalleCotizacion;
        $this->CodigoCotizacion = $CodigoCotizacion;
        $this->CodigoProducto = $CodigoProducto;
        $this->NombreProducto = $NombreProducto;
        $this->PrecioProducto = $PrecioProducto;
        $this->CantidadDetalleCotizacion = $CantidadDetalleCotizacion;
        $this->PrecioDetalleCotizacion = $PrecioDetalleCotizacion;
        $this->FechaEmisionCotizacion = $FechaEmisionCotizacion;
        $this->ObservacionDetalleCotizacion = $ObservacionDetalleCotizacion;
        if ($iniciarBD) {
            $this->conexion = new conexion();
        }
    }
    public static function Listar($idcotizacion)
    {
        $listarDetalle = [];
        $conexion = new conexion();
        $sql = "CALL listarDetalleCotizacion(:idcotizacion);";
        $stmt = $conexion->prepare($sql);
        $stmt->bindParam(':idcotizacion', $idcotizacion, PDO::PARAM_INT);
        $stmt->execute();
        while ($datos = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $detalleCotizacion = new detalleCotizacion(
                $datos["iddetallecotizacion"],
                $datos["idcotizacion"],
                "",
                $datos["nombre_producto"],
                $datos["precio_producto"],
                $datos["cantidad"],
                $datos["precio"],
                $datos["fecha_emision"],
                $datos["observacion"],
                false
            );
            array_push($listarDetalle, $detalleCotizacion);
        }
        return $listarDetalle;
    }
    public function GuardarDetalle()
    {
        try {
            $CodigoCotizacion = $this->CodigoCotizacion;
            $CodigoProducto = $this->CodigoProducto;
            $CantidadDetalleCotizacion = $this->CantidadDetalleCotizacion;
            $PrecioDetalleCotizacion = $this->PrecioDetalleCotizacion;
            $ObservacionDetalleCotizacion = $this->ObservacionDetalleCotizacion;
            $sql = "CALL crearDetalleCotizacion(?, ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoCotizacion, $CodigoProducto, $CantidadDetalleCotizacion, $PrecioDetalleCotizacion, $ObservacionDetalleCotizacion]);
            $results = [];
            do {
                $results[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());
            return $results;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function EliminarDetalle()
    {
        try {
            $CodigoDetalleCotizacion = $this->CodigoDetalleCotizacion;
            $sql = "CALL eliminarDetalleCotizacion(?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoDetalleCotizacion]);
            $resultados = [];
            do {
                $resultados[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());

            return $resultados;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function ActualizarDetalle()
    {
        try {
            $CodigoDetalleCotizacion = $this->CodigoDetalleCotizacion;
            $CodigoCotizacion = $this->CodigoCotizacion;
            $CodigoProducto = $this->CodigoProducto;
            $CantidadDetalleCotizacion = $this->CantidadDetalleCotizacion;
            $PrecioDetalleCotizacion = $this->PrecioDetalleCotizacion;
            $ObservacionDetalleCotizacion = $this->ObservacionDetalleCotizacion;
            $sql = "CALL actualizarDetalleCotizacion(?, ?, ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoDetalleCotizacion, $CodigoCotizacion, $CodigoProducto, $CantidadDetalleCotizacion, $PrecioDetalleCotizacion, $ObservacionDetalleCotizacion]);
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
