<?php
require_once '../../config/conexion.php';
class receta
{
    public $CodigoReceta;
    public $CodigoProducto;
    public $CodigoMateria;
    public $NombreProducto;
    public $NombreMateria;
    public $CantidadMateria;
    public $PrecioMateriaCantidad;
    private $conexion;

    function __construct($CodigoReceta, $CodigoProducto, $CodigoMateria, $NombreProducto, $NombreMateria, $CantidadMateria, $PrecioMateriaCantidad, $iniciarBD = true)
    {
        $this->CodigoReceta = $CodigoReceta;
        $this->CodigoProducto = $CodigoProducto;
        $this->CodigoMateria = $CodigoMateria;
        $this->NombreProducto = $NombreProducto;
        $this->NombreMateria = $NombreMateria;
        $this->CantidadMateria = $CantidadMateria;
        $this->PrecioMateriaCantidad = $PrecioMateriaCantidad;
        if ($iniciarBD) {
            $this->conexion = new conexion();
        }
    }
    public static function Listar($idproducto)
    {
        $listarReceta = [];
        $conexion = new conexion();
        $sql = "CALL listarReceta(:idproducto);";
        $stmt = $conexion->prepare($sql);
        $stmt->bindParam(':idproducto', $idproducto, PDO::PARAM_INT);
        $stmt->execute();
        while ($datos = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $receta = new receta(
                $datos["idreceta"],
                $datos["idproducto"],
                $datos["idmateriaprima"],
                $datos["nombre_producto"],
                $datos["nombre_materia"],
                $datos["cantidadmateria"],
                $datos["preciomateriacantidad"],
                false
            );
            array_push($listarReceta, $receta);
        }
        return $listarReceta;
    }
    public function GuardarReceta()
    {
        try {
            $CodigoProducto = $this->CodigoProducto;
            $CodigoMateria = $this->CodigoMateria;
            $CantidadMateria = $this->CantidadMateria;
            $PrecioMateriaCantidad = $this->PrecioMateriaCantidad;
            $sql = "CALL crearReceta(?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoProducto, $CodigoMateria, $CantidadMateria, $PrecioMateriaCantidad]);
            $results = [];
            do {
                $results[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());
            return $results;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function EliminarReceta()
    {
        try {
            $CodigoReceta = $this->CodigoReceta;
            $sql = "CALL eliminarReceta(?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoReceta]);
            $resultados = [];
            do {
                $resultados[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());
            return $resultados;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function ActualizarReceta()
    {
        try {
            $CodigoReceta = $this->CodigoReceta;
            $CodigoProducto = $this->CodigoProducto;
            $CodigoMateria = $this->CodigoMateria;
            $CantidadMateria = $this->CantidadMateria;
            $PrecioMateriaCantidad = $this->PrecioMateriaCantidad;
            $sql = "CALL actualizarReceta( ?, ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoReceta, $CodigoProducto, $CodigoMateria, $CantidadMateria, $PrecioMateriaCantidad]);
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
