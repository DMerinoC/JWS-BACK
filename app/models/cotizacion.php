<?php
require_once '../../config/conexion.php';
class cotizacion
{
    public $CodigoCotizacion;
    public $CodigoCliente;
    public $NombreCliente;
    public $CelularCliente;
    public $FechaEmision;
    public $ObservacionCotizacion;
    private $conexion;

    function __construct($CodigoCotizacion, $CodigoCliente, $NombreCliente, $CelularCliente, $FechaEmision, $ObservacionCotizacion, $iniciarBD = true)
    {
        $this->CodigoCotizacion = $CodigoCotizacion;
        $this->CodigoCliente = $CodigoCliente;
        $this->NombreCliente = $NombreCliente;
        $this->CelularCliente = $CelularCliente;
        $this->FechaEmision = $FechaEmision;
        $this->ObservacionCotizacion = $ObservacionCotizacion;
        if ($iniciarBD) {
            $this->conexion = new conexion();
        }
    }
    public static function Listar()
    {
        $listarCotizacion = [];
        $conexion = new conexion();
        $sql = "CALL listarCotizacion();";
        $stmt = $conexion->prepare($sql);
        $stmt->execute();
        while ($datos = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $cotizacion = new cotizacion(
                $datos["idcotizacion"],
                $datos["nombre_cliente"],
                $datos["celular_cliente"],
                $datos["fecha_emision"],
                $datos["observacion"],
                false
            );
            array_push($listarCotizacion, $cotizacion);
        }
        return $listarCotizacion;
    }
    public function GuardarCotizacion()
    {
        try {
            $CodigoCliente = $this->CodigoCliente;
            $FechaEmision = $this->FechaEmision;
            $ObservacionCotizacion = $this->ObservacionCotizacion;
            $sql = "CALL crearcotizacion(?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoCliente, $FechaEmision, $ObservacionCotizacion]);
            $results = [];
            do {
                $results[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());
            return $results;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function EliminarCotizacion()
    {
        try {
            $CodigoCotizacion = $this->CodigoCotizacion;
            $sql = "CALL eliminarCotizacion(?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoCotizacion]);
            $resultados = [];
            do {
                $resultados[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());

            return $resultados;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function ActualizarCotizacion()
    {
        try {
            $CodigoCotizacion = $this->CodigoCotizacion;
            $CodigoCliente = $this->CodigoCliente;
            $FechaEmision = $this->FechaEmision;
            $ObservacionCotizacion = $this->ObservacionCotizacion;
            $sql = "CALL actualizarCotizacion(?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoCotizacion, $CodigoCliente, $FechaEmision, $ObservacionCotizacion]);
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
