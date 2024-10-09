<?php
require_once '../../config/conexion.php';
class producto
{
    public $CodigoProducto;
    public $NombreProducto;
    public $PrecioProducto;
    public $CantidadProducto;
    public $ObservacionProducto;
    public $ListaPredeterminado;
    private $conexion;

    function __construct($CodigoProducto, $NombreProducto, $PrecioProducto, $CantidadProducto, $ObservacionProducto, $ListaPredeterminado, $iniciarBD = true)
    {
        $this->CodigoProducto = $CodigoProducto;
        $this->NombreProducto = $NombreProducto;
        $this->PrecioProducto = $PrecioProducto;
        $this->CantidadProducto = $CantidadProducto;
        $this->ObservacionProducto = $ObservacionProducto;
        $this->ListaPredeterminado = $ListaPredeterminado;
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
                $datos["cantidad_producto"],
                $datos["observacion_producto"],
                $datos["lista_predeterminado"],
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
            $CantidadProducto = $this->CantidadProducto;
            $ObservacionProducto = $this->ObservacionProducto;
            $ListaPredeterminado = $this->ListaPredeterminado;
            $sql = "CALL crearProducto(?, ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$NombreProducto, $PrecioProducto, $CantidadProducto, $ObservacionProducto, $ListaPredeterminado]);
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
            $CantidadProducto = $this->CantidadProducto;
            $ObservacionProducto = $this->ObservacionProducto;
            $ListaPredeterminado = $this->ListaPredeterminado;
            $sql = "CALL actualizarProducto(?, ?, ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoProducto, $NombreProducto, $PrecioProducto, $CantidadProducto, $ObservacionProducto, $ListaPredeterminado]);
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
