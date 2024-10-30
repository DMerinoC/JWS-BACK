<?php
require_once '../../config/conexion.php';
class almacen
{
    public $CodigoAlmacen;
    public $CodigoOrdenTrabajo;
    public $EstadoProductoAlmacen;
    private $conexion;

    function __construct($CodigoAlmacen, $CodigoOrdenTrabajo, $EstadoProductoAlmacen, $iniciarBD = true)
    {
        $this->CodigoAlmacen = $CodigoAlmacen;
        $this->CodigoOrdenTrabajo = $CodigoOrdenTrabajo;
        $this->EstadoProductoAlmacen = $EstadoProductoAlmacen;
        if ($iniciarBD) {
            $this->conexion = new conexion();
        }
    }
    public static function Listar()
    {
        $listaAlmacen = [];
        $conexion = new conexion();
        $sql = "CALL listarAlmacen();";
        $stmt = $conexion->prepare($sql);
        $stmt->execute();
        while ($datos = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $Almacen = new almacen(
                $datos["idalmacen"],
                $datos["idordentrabajo"],
                $datos["estado_producto_almacen"],
                false
            );
            array_push($listaAlmacen, $Almacen);
        }
        return $listaAlmacen;
    }
    public function GuardarAlmacen()
    {
        try {
            $CodigoOrdenTrabajo = $this->CodigoOrdenTrabajo;
            $EstadoProductoAlmacen = $this->EstadoProductoAlmacen;
            $sql = "CALL crearAlmacen(?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoOrdenTrabajo, $EstadoProductoAlmacen]);
            $results = [];
            do {
                $results[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());
            return $results;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function EliminarAlmacen()
    {
        try {
            $CodigoAlmacen = $this->CodigoAlmacen;
            $sql = "CALL eliminarAlmacen(?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoAlmacen]);
            $resultados = [];
            do {
                $resultados[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());
            return $resultados;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function ActualizarAlmacen()
    {
        try {
            $CodigoAlmacen = $this->CodigoAlmacen;
            $CodigoOrdenTrabajo = $this->CodigoOrdenTrabajo;
            $EstadoProductoAlmacen = $this->EstadoProductoAlmacen;
            $sql = "CALL actualizarAlmacen(?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoAlmacen, $CodigoOrdenTrabajo, $EstadoProductoAlmacen]);
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
