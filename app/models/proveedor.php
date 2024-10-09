<?php
require_once '../../config/conexion.php';
class proveedor
{
    public $CodigoProveedor;
    public $NombreProveedor;
    public $RucProveedor;
    public $TipoRucProveedor;
    public $DireccionProveedor;
    public $ContactoProveedor;
    public $UrlProveedor;
    public $CargoCompras;
    private $conexion;

    function __construct($CodigoProveedor, $NombreProveedor, $RucProveedor, $TipoRucProveedor, $DireccionProveedor, $ContactoProveedor, $UrlProveedor, $CargoCompras, $iniciarBD = true)
    {
        $this->CodigoProveedor = $CodigoProveedor;
        $this->NombreProveedor = $NombreProveedor;
        $this->RucProveedor = $RucProveedor;
        $this->TipoRucProveedor = $TipoRucProveedor;
        $this->DireccionProveedor = $DireccionProveedor;
        $this->ContactoProveedor = $ContactoProveedor;
        $this->UrlProveedor = $UrlProveedor;
        $this->CargoCompras = $CargoCompras;
        if ($iniciarBD) {
            $this->conexion = new conexion();
        }
    }
    public static function Listar()
    {
        $listarProveedor = [];
        $conexion = new conexion();
        $sql = "CALL listarProveedor();";
        $stmt = $conexion->prepare($sql);
        $stmt->execute();
        while ($datos = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $Proveedor = new proveedor(
                $datos["idproveedor"],
                $datos["nombre_proveedor"],
                $datos["rucproveedor"],
                $datos["tiporuc"],
                $datos["direccion_proveedor"],
                $datos["contacto_proveedor"],
                $datos["url"],
                $datos["cargo_compras"],
                false
            );
            array_push($listarProveedor, $Proveedor);
        }
        return $listarProveedor;
    }
    public function GuardarProveedor()
    {
        try {
            $NombreProveedor = $this->NombreProveedor;
            $RucProveedor = $this->RucProveedor;
            $TipoRucProveedor = $this->TipoRucProveedor;
            $DireccionProveedor = $this->DireccionProveedor;
            $ContactoProveedor = $this->ContactoProveedor;
            $UrlProveedor = $this->UrlProveedor;
            $CargoCompras = $this->CargoCompras;
            $sql = "CALL crearProveedor(?, ?, ?, ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$RucProveedor, $TipoRucProveedor, $NombreProveedor, $UrlProveedor, $CargoCompras, $DireccionProveedor, $ContactoProveedor]);
            $results = [];
            do {
                $results[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());
            return $results;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function EliminarProveedor()
    {
        try {
            $CodigoProveedor = $this->CodigoProveedor;
            $sql = "CALL eliminarProveedor(?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoProveedor]);
            $resultados = [];
            do {
                $resultados[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());
            return $resultados;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function ActualizarProveedor()
    {
        try {
            $CodigoProveedor = $this->CodigoProveedor;
            $NombreProveedor = $this->NombreProveedor;
            $RucProveedor = $this->RucProveedor;
            $TipoRucProveedor = $this->TipoRucProveedor;
            $DireccionProveedor = $this->DireccionProveedor;
            $ContactoProveedor = $this->ContactoProveedor;
            $UrlProveedor = $this->UrlProveedor;
            $CargoCompras = $this->CargoCompras;
            $sql = "CALL actualizarProveedor(?, ?, ?, ?, ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoProveedor, $RucProveedor, $TipoRucProveedor, $NombreProveedor, $UrlProveedor, $CargoCompras, $DireccionProveedor, $ContactoProveedor]);
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
