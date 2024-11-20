<?php
require_once '../../config/conexion.php';
class cliente
{

    public $CodigoCliente;
    public $Tipo;
    public $NumeroDocumento;
    public $NombreCliente;
    public $Email;
    public $Celular;
    private $conexion;

    function __construct($CodigoCliente, $Tipo, $NumeroDocumento, $NombreCliente, $Email, $Celular, $iniciarBD = true)
    {
        $this->CodigoCliente = $CodigoCliente;
        $this->Tipo = $Tipo;
        $this->NumeroDocumento = $NumeroDocumento;
        $this->NombreCliente = $NombreCliente;
        $this->Email = $Email;
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
                $datos["tipo"],
                $datos["numerodocumento"],
                $datos["nombre_cliente"],
                $datos["email_cliente"],
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
            $Tipo = $this->Tipo;
            $NumeroDocumento = $this->NumeroDocumento;
            $NombreCliente = $this->NombreCliente;
            $Email = $this->Email;
            $Celular = $this->Celular;
            $sql = "CALL crearCliente(?, ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$Tipo, $NumeroDocumento, $NombreCliente, $Email, $Celular]);
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
            $Tipo = $this->Tipo;
            $NumeroDocumento = $this->NumeroDocumento;
            $NombreCliente = $this->NombreCliente;
            $Email = $this->Email;
            $Celular = $this->Celular;
            $sql = "CALL actualizarCliente(?, ?, ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoCliente, $Tipo, $NumeroDocumento, $NombreCliente, $Email, $Celular]);
            $resultados = [];
            do {
                $resultados[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());

            return $resultados;
        } catch (PDOException $e) {
            return false;
        }
    }
    public static function ListarHistorial($idcliente)
    {
        $listarHistorial = [];
        $conexion = new conexion();
        $sql = "CALL listarHistorialCotizacion(:idcliente);";
        $stmt = $conexion->prepare($sql);
        $stmt->bindParam(':idcliente', $idcliente, PDO::PARAM_INT);
        $stmt->execute();

        while ($datos = $stmt->fetch(PDO::FETCH_ASSOC)) {
            // Crear un objeto stdClass para almacenar los datos
            $historial = new stdClass();
            $historial->CodigoCliente = $datos["idcliente"];
            $historial->CodigoCotizacion = $datos["idcotizacion"];
            $historial->FechaEmision = $datos["fecha_emision"];
            $historial->Cantidad = $datos["cantidad"];

            // Agregar el objeto stdClass al array
            array_push($listarHistorial, $historial);
        }

        return $listarHistorial;
    }

}
