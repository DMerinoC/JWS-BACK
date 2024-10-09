<?php
require_once '../../config/conexion.php';
class cliente
{
    public $CodigoCliente;
    public $NombreCliente;
    public $RucCliente;
    public $TipoRuc;
    public $NivelInteres;
    public $ObservacionCompras;
    public $Email;
    public $Telefono;
    public $Celular;
    private $conexion;

    function __construct($CodigoCliente, $NombreCliente, $RucCliente, $TipoRuc, $NivelInteres, $ObservacionCompras, $Email, $Telefono, $Celular, $iniciarBD = true)
    {
        $this->CodigoCliente = $CodigoCliente;
        $this->NombreCliente = $NombreCliente;
        $this->RucCliente = $RucCliente;
        $this->TipoRuc = $TipoRuc;
        $this->NivelInteres = $NivelInteres;
        $this->ObservacionCompras = $ObservacionCompras;
        $this->Email = $Email;
        $this->Telefono = $Telefono;
        $this->Celular = $Celular;
        if ($iniciarBD) {
            $this->conexion = new conexion();
        }
    }
    public static function Listar()
    {
        $listacliente = [];
        $conexion = new conexion();
        $sql = "CALL listarCliente();";
        $stmt = $conexion->prepare($sql);
        $stmt->execute();

        while ($datos = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $Cliente = new cliente(
                $datos["idcliente"],
                $datos["nombre_cliente"],
                $datos["ruccliente"],
                $datos["tiporuc"],
                $datos["nivel_interes"],
                $datos["observacion_compras"],
                $datos["email_cliente"],
                $datos["telefono_cliente"],
                $datos["celular_cliente"],
                false
            );
            array_push($listacliente, $Cliente);
        }
        return $listacliente;
    }
    public function GuardarCliente()
    {
        try {
            $NombreCliente = $this->NombreCliente;
            $RucCliente = $this->RucCliente;
            $TipoRuc = $this->TipoRuc;
            $NivelInteres = $this->NivelInteres;
            $ObservacionCompras = $this->ObservacionCompras;
            $Email = $this->Email;
            $Telefono = $this->Telefono;
            $Celular = $this->Celular;
            $sql = "CALL crearCliente(?, ?, ?, ?, ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$RucCliente, $TipoRuc, $NombreCliente, $NivelInteres, $ObservacionCompras, $Email, $Telefono, $Celular]);
            $results = [];
            do {
                $results[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());
            return $results;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function EliminarCliente()
    {
        try {
            $CodigoCliente = $this->CodigoCliente;
            $sql = "CALL eliminarCliente(?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoCliente]);
            $resultados = [];
            do {
                $resultados[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());
            return $resultados;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function ActualizarCliente()
    {
        try {
            $CodigoCliente = $this->CodigoCliente;
            $NombreCliente = $this->NombreCliente;
            $RucCliente = $this->RucCliente;
            $TipoRuc = $this->TipoRuc;
            $NivelInteres = $this->NivelInteres;
            $ObservacionCompras = $this->ObservacionCompras;
            $Email = $this->Email;
            $Telefono = $this->Telefono;
            $Celular = $this->Celular;
            $sql = "CALL actualizarCliente(?, ?, ?, ?, ?, ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoCliente, $RucCliente, $TipoRuc, $NombreCliente, $NivelInteres, $ObservacionCompras, $Email, $Telefono, $Celular]);
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
