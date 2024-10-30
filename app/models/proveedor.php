<?php
require_once '../../config/conexion.php';
class proveedor
{
    public $CodigoProveedor;
    public $RucProveedor;
    public $NombreProveedor;
    public $ContactoProveedor;
    public $DireccionProveedor;
    public $EmailProveedor;
    public $CelularProveedor;
    private $conexion;

    function __construct($CodigoProveedor, $RucProveedor, $NombreProveedor, $ContactoProveedor, $DireccionProveedor, $EmailProveedor, $CelularProveedor, $iniciarBD = true)
    {
        $this->CodigoProveedor = $CodigoProveedor;
        $this->RucProveedor = $RucProveedor;
        $this->NombreProveedor = $NombreProveedor;
        $this->ContactoProveedor = $ContactoProveedor;
        $this->DireccionProveedor = $DireccionProveedor;
        $this->EmailProveedor = $EmailProveedor;
        $this->CelularProveedor = $CelularProveedor;
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
                $datos["rucproveedor"],
                $datos["nombre_proveedor"],
                $datos["contacto_proveedor"],
                $datos["direccion_proveedor"],
                $datos["email_proveedor"],
                $datos["celular_proveedor"],
                false
            );
            array_push($listarProveedor, $Proveedor);
        }
        return $listarProveedor;
    }
    public function GuardarProveedor()
    {
        try {
            $RucProveedor = $this->RucProveedor;
            $NombreProveedor = $this->NombreProveedor;
            $ContactoProveedor = $this->ContactoProveedor;
            $DireccionProveedor = $this->DireccionProveedor;
            $EmailProveedor = $this->EmailProveedor;
            $CelularProveedor = $this->CelularProveedor;
            $sql = "CALL crearProveedor(?, ?, ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$RucProveedor, $NombreProveedor, $ContactoProveedor, $DireccionProveedor, $EmailProveedor, $CelularProveedor]);
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
            $RucProveedor = $this->RucProveedor;
            $NombreProveedor = $this->NombreProveedor;
            $ContactoProveedor = $this->ContactoProveedor;
            $DireccionProveedor = $this->DireccionProveedor;
            $EmailProveedor = $this->EmailProveedor;
            $CelularProveedor = $this->CelularProveedor;
            $sql = "CALL actualizarProveedor(?, ?, ?, ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoProveedor, $RucProveedor, $NombreProveedor, $ContactoProveedor, $DireccionProveedor, $EmailProveedor, $CelularProveedor]);
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
