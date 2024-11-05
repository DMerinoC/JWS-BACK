<?php
require_once '../../config/conexion.php';
class materia
{
    public $CodigoMateriaPrima;
    public $CodigoProveedor;
    public $NombreMateriaPrima;
    public $PrecioMateriaPrima;
    public $CantidadMateriaPrima;
    public $UnidadMateriaPrima;
    public $NombreProveedor;
    public $DescripcionMateriaPrima;
    public $TipoMateria;
    private $conexion;

    function __construct($CodigoMateriaPrima, $CodigoProveedor, $NombreMateriaPrima, $PrecioMateriaPrima, $CantidadMateriaPrima, $UnidadMateriaPrima, $NombreProveedor, $DescripcionMateriaPrima, $TipoMateria, $iniciarBD = true)
    {
        $this->CodigoMateriaPrima = $CodigoMateriaPrima;
        $this->CodigoProveedor = $CodigoProveedor;
        $this->NombreMateriaPrima = $NombreMateriaPrima;
        $this->PrecioMateriaPrima = $PrecioMateriaPrima;
        $this->CantidadMateriaPrima = $CantidadMateriaPrima;
        $this->UnidadMateriaPrima = $UnidadMateriaPrima;
        $this->NombreProveedor = $NombreProveedor;
        $this->DescripcionMateriaPrima = $DescripcionMateriaPrima;
        $this->TipoMateria = $TipoMateria;
        if ($iniciarBD) {
            $this->conexion = new conexion();
        }
    }
    public static function Listar()
    {
        $listarMateria = [];
        $conexion = new conexion();
        $sql = "CALL listarMateriaPrima();";
        $stmt = $conexion->prepare($sql);
        $stmt->execute();
        while ($datos = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $materia = new materia(
                $datos["idmateriaprima"],
                "",
                $datos["nombre_materia"],
                $datos["precio_materia"],
                $datos["cantidad_materia"],
                $datos["unidadmedida"],
                $datos["nombre_proveedor"],
                $datos["descripcion"],
                $datos["tipo_materia"],
                false
            );
            array_push($listarMateria, $materia);
        }
        return $listarMateria;
    }
    public function GuardarMateria()
    {
        try {
            $CodigoProveedor = $this->CodigoProveedor;
            $NombreMateriaPrima = $this->NombreMateriaPrima;
            $PrecioMateriaPrima = $this->PrecioMateriaPrima;
            $CantidadMateriaPrima = $this->CantidadMateriaPrima;
            $UnidadMateriaPrima = $this->UnidadMateriaPrima;
            $DescripcionMateriaPrima = $this->DescripcionMateriaPrima;
            $TipoMateria = $this->TipoMateria;
            $sql = "CALL crearMateriaPrima(?, ?, ?,?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoProveedor, $NombreMateriaPrima, $PrecioMateriaPrima, $CantidadMateriaPrima, $UnidadMateriaPrima, $DescripcionMateriaPrima, $TipoMateria]);
            $results = [];
            do {
                $results[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());
            return $results;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function EliminarMateria()
    {
        try {
            $CodigoMateriaPrima = $this->CodigoMateriaPrima;
            $sql = "CALL eliminarMateriaPrima(?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoMateriaPrima]);
            $resultados = [];
            do {
                $resultados[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());

            return $resultados;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function ActualizarMateria()
    {
        try {
            $CodigoMateriaPrima = $this->CodigoMateriaPrima;
            $CodigoProveedor = $this->CodigoProveedor;
            $NombreMateriaPrima = $this->NombreMateriaPrima;
            $PrecioMateriaPrima = $this->PrecioMateriaPrima;
            $CantidadMateriaPrima = $this->CantidadMateriaPrima;
            $UnidadMateriaPrima = $this->UnidadMateriaPrima;
            $DescripcionMateriaPrima = $this->DescripcionMateriaPrima;
            $TipoMateria = $this->TipoMateria;
            $sql = "CALL actualizarMateriaPrima( ?, ?, ?, ?, ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoMateriaPrima, $CodigoProveedor, $NombreMateriaPrima, $PrecioMateriaPrima, $CantidadMateriaPrima, $UnidadMateriaPrima, $DescripcionMateriaPrima, $TipoMateria]);
            $resultados = [];
            do {
                $resultados[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());

            return $resultados;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function descontarMateriales()
    {

    }

}
