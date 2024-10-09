<?php
require_once '../../config/conexion.php';

class trabajador
{
    public $CodigoTrabajador;
    public $CodigoRol;
    public $NombreTrabajador;
    public $CorreoTrabajador;
    public $UsuarioTrabajador;
    public $ClaveTrabajador;
    public $SueldoTrabajador;
    public $tokenVerificador;
    public $token;
    private $conexion;

    function __construct($CodigoTrabajador, $CodigoRol, $NombreTrabajador, $CorreoTrabajador, $UsuarioTrabajador, $ClaveTrabajador, $SueldoTrabajador, $tokenVerificador, $iniciarBD = true)
    {
        $this->CodigoTrabajador = $CodigoTrabajador;
        $this->CodigoRol = $CodigoRol;
        $this->NombreTrabajador = $NombreTrabajador;
        $this->CorreoTrabajador = $CorreoTrabajador;
        $this->UsuarioTrabajador = $UsuarioTrabajador;
        $this->ClaveTrabajador = $ClaveTrabajador;
        $this->SueldoTrabajador = $SueldoTrabajador;
        $this->tokenVerificador = $tokenVerificador;
        if ($iniciarBD) {
            $this->conexion = new conexion();
        }
    }
    public static function Listar()
    {
        $listatrabajador = [];
        $conexion = new conexion();
        $sql = "CALL listartrabajador();";
        $stmt = $conexion->prepare($sql);
        $stmt->execute();

        while ($datos = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $trabajador = new trabajador(
                $datos["idtrabajador"],
                $datos["rol"],
                $datos["nombre_trabajador"],
                $datos["correo_trabajador"],
                $datos["usuario_trabajador"],
                $datos["clave_trabajador"],
                $datos["sueldo_trabajador"],
                "",
                false
            );
            array_push($listatrabajador, $trabajador);
        }
        return $listatrabajador;
    }
    public function GuardarTrabajador()
    {
        try {
            $CodigoRol = $this->CodigoRol;
            $NombreTrabajador = $this->NombreTrabajador;
            $CorreoTrabajador = $this->CorreoTrabajador;
            $UsuarioTrabajador = $this->UsuarioTrabajador;
            $ClaveTrabajador = $this->ClaveTrabajador;
            $SueldoTrabajador = $this->SueldoTrabajador;
            $sql = "CALL crearTrabajador(?, ?, ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoRol, $NombreTrabajador, $CorreoTrabajador, $UsuarioTrabajador, $ClaveTrabajador, $SueldoTrabajador]);
            $results = [];
            do {
                $results[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());
            return $results;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function EliminarTrabajador()
    {
        try {
            $CodigoTrabajador = $this->CodigoTrabajador;
            $sql = "CALL eliminarTrabajador(?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoTrabajador]);
            $resultados = [];
            do {
                $resultados[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());

            return $resultados;
        } catch (PDOException $e) {
            return false;
        }
    }
    public function ActualizarTrabajador()
    {
        try {
            $CodigoTrabajador = $this->CodigoTrabajador;
            $CodigoRol = $this->CodigoRol;
            $NombreTrabajador = $this->NombreTrabajador;
            $CorreoTrabajador = $this->CorreoTrabajador;
            $UsuarioTrabajador = $this->UsuarioTrabajador;
            $ClaveTrabajador = $this->ClaveTrabajador;
            $SueldoTrabajador = $this->SueldoTrabajador;
            $sql = "CALL actualizarTrabajador(?, ?, ?, ?, ?, ?, ?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$CodigoTrabajador, $CodigoRol, $NombreTrabajador, $CorreoTrabajador, $UsuarioTrabajador, $ClaveTrabajador, $SueldoTrabajador]);
            $resultados = [];
            do {
                $resultados[] = $stmt->fetch(PDO::FETCH_ASSOC);
            } while ($stmt->nextRowset());

            return $resultados;
        } catch (PDOException $e) {
            return false;
        }
    }
    function Validar()
    {
        try {
            $UsuarioTrabajador = $this->UsuarioTrabajador;
            $ClaveTrabajador = $this->ClaveTrabajador;
            $sql = "call ValidarUsuario(?);";
            $stmt = $this->conexion->prepare($sql);
            $stmt->execute([$UsuarioTrabajador]);
            $this->UsuarioTrabajador = "";
            $this->ClaveTrabajador = "";
            if ($datos = $stmt->fetch(PDO::FETCH_ASSOC)) {
                if (password_verify($ClaveTrabajador, $datos["clave_trabajador"])) {
                    $this->CodigoTrabajador = $datos["idtrabajador"];
                    $this->UsuarioTrabajador = $datos["usuario_trabajador"];
                    $this->NombreTrabajador = $datos["nombre_trabajador"];
                    $this->CorreoTrabajador = $datos["correo_trabajador"];
                    $this->CodigoRol = $datos["rol"];
                    return $this;
                } else {
                    $this->CodigoTrabajador = 0;
                    return $this;
                }
            } else {
                $this->CodigoTrabajador = 0;
                return $this;
            }
        } catch (PDOException $e) {
            $this->CodigoTrabajador = 0;
            return $this;
        }
    }

}
