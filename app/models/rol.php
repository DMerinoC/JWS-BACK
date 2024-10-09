<?php
require_once '../../config/conexion.php';
class rol
{
    public $CodigoRol;
    public $NombreRol;
    private $conexion;
    function __construct($CodigoRol, $NombreRol, $iniciarBD = true)
    {
        $this->CodigoRol = $CodigoRol;
        $this->NombreRol = $NombreRol;
        if ($iniciarBD) {
            $this->conexion = new conexion();
        }
    }
    public static function Listar()
    {
        $listarRol = [];
        $conexion = new conexion();
        $sql = "CALL listarRol();";
        $stmt = $conexion->prepare($sql);
        $stmt->execute();
        while ($datos = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $Rol = new rol(
                $datos["idrol"],
                $datos["rol"],
                false
            );
            array_push($listarRol, $Rol);
        }
        return $listarRol;
    }
}
