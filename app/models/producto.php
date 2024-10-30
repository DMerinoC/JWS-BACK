<?php
require_once '../../config/conexion.php';
class producto
{
    public $CodigoProducto;
    public $NombreProducto;
    public $PrecioProducto;
    public $ObservacionProducto;
    private $conexion;

    function __construct($CodigoProducto, $NombreProducto, $PrecioProducto, $ObservacionProducto, $iniciarBD = true)
    {
        $this->CodigoProducto = $CodigoProducto;
        $this->NombreProducto = $NombreProducto;
        $this->PrecioProducto = $PrecioProducto;
        $this->ObservacionProducto = $ObservacionProducto;
        if ($iniciarBD) {
            $this->conexion = new conexion();
        }
    }
    public static function Listar()
    {
        $listarProducto = [];
        $conexion = new conexion();
        $sql = "CALL listarProducto();";
        $stmt = $conexion->prepare($sql);
        $stmt->execute();
        while ($datos = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $producto = new producto(
                $datos["idproducto"],
                $datos["nombre_producto"],
                $datos["precio_producto"],
                $datos["observacion_producto"],
                false
            );
            array_push($listarProducto, $producto);
        }
        return $listarProducto;
    }
    public function GuardarProducto()
    {
        try {
            $NombreProducto = $this->NombreProducto;
            $PrecioProducto = $this->PrecioProducto;
            $ObservacionProducto = $this->ObservacionProducto;
            $sql = "CALL crearProducto(?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$NombreProducto, $PrecioProducto, $ObservacionProducto]);
            $results = [];
            do {
                $results[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());
            return $results;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function EliminarProducto()
    {
        try {
            $CodigoProducto = $this->CodigoProducto;
            $sql = "CALL eliminarProducto(?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoProducto]);
            $resultados = [];
            do {
                $resultados[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());

            return $resultados;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function ActualizarProducto()
    {
        try {
            $CodigoProducto = $this->CodigoProducto;
            $NombreProducto = $this->NombreProducto;
            $PrecioProducto = $this->PrecioProducto;
            $ObservacionProducto = $this->ObservacionProducto;
            $sql = "CALL actualizarProducto(?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoProducto, $NombreProducto, $PrecioProducto, $ObservacionProducto]);
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
