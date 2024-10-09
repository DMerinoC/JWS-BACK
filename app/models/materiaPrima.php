<?php
require_once '../../config/conexion.php';
class materia
{
    public $CodigoMateriaPrima;
    public $NombreMateriaPrima;
    public $PrecioMateriaPrima;
    public $CantidadMateriaPrima;
    public $UnidadMateriaPrima;
    public $CodigoProveedor;
    public $NombreProveedor;
    public $DescripcionMateriaPrima;
    public $ListaPredeMateriaPrima;
    private $conexion;

    function __construct($CodigoMateriaPrima, $NombreMateriaPrima, $PrecioMateriaPrima, $CantidadMateriaPrima, $UnidadMateriaPrima, $CodigoProveedor, $NombreProveedor, $DescripcionMateriaPrima, $ListaPredeMateriaPrima, $iniciarBD = true)
    {
        $this->CodigoMateriaPrima = $CodigoMateriaPrima;
        $this->NombreMateriaPrima = $NombreMateriaPrima;
        $this->PrecioMateriaPrima = $PrecioMateriaPrima;
        $this->CantidadMateriaPrima = $CantidadMateriaPrima;
        $this->UnidadMateriaPrima = $UnidadMateriaPrima;
        $this->CodigoProveedor = $CodigoProveedor;
        $this->NombreProveedor = $NombreProveedor;
        $this->DescripcionMateriaPrima = $DescripcionMateriaPrima;
        $this->ListaPredeMateriaPrima = $ListaPredeMateriaPrima;
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
                $datos["nombre_materia"],
                $datos["precio_materia"],
                $datos["cantidad_materia"],
                $datos["unidadmedida"],
                "",
                $datos["nombre_proveedor"],
                $datos["descripcion"],
                $datos["lista_predeterminado"],
                false
            );
            array_push($listarMateria, $materia);
        }
        return $listarMateria;
    }
    public function GuardarMateria()
    {
        try {
            $NombreMateriaPrima = $this->NombreMateriaPrima;
            $PrecioMateriaPrima = $this->PrecioMateriaPrima;
            $CantidadMateriaPrima = $this->CantidadMateriaPrima;
            $UnidadMateriaPrima = $this->UnidadMateriaPrima;
            $CodigoProveedor = $this->CodigoProveedor;
            $DescripcionMateriaPrima = $this->DescripcionMateriaPrima;
            $ListaPredeMateriaPrima = $this->ListaPredeMateriaPrima;
            $sql = "CALL crearMateriaPrima(?, ?, ?,?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoProveedor, $NombreMateriaPrima, $PrecioMateriaPrima, $CantidadMateriaPrima, $UnidadMateriaPrima, $DescripcionMateriaPrima, $ListaPredeMateriaPrima]);
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
            $NombreMateriaPrima = $this->NombreMateriaPrima;
            $PrecioMateriaPrima = $this->PrecioMateriaPrima;
            $CantidadMateriaPrima = $this->CantidadMateriaPrima;
            $UnidadMateriaPrima = $this->UnidadMateriaPrima;
            $CodigoProveedor = $this->CodigoProveedor;
            $DescripcionMateriaPrima = $this->DescripcionMateriaPrima;
            $ListaPredeMateriaPrima = $this->ListaPredeMateriaPrima;
            $sql = "CALL actualizarMateriaPrima( ?, ?, ?, ?, ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoMateriaPrima, $CodigoProveedor, $NombreMateriaPrima, $PrecioMateriaPrima, $CantidadMateriaPrima, $UnidadMateriaPrima, $DescripcionMateriaPrima, $ListaPredeMateriaPrima]);
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
