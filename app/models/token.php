<?php
    require_once '../../config/tokenJWT.php';
    use \Firebase\JWT\JWT;
    use \Firebase\JWT\Key;
    class token{
        public $NombreUsuario;
        public $token;
        function __construct($NombreUsuario, $token){
            $this->NombreUsuario = $NombreUsuario;
            $this->token = $token;
        }
        public static function Validar($NombreUsuario_, $token_){
            $resultado = false;
            global $key_;
            try {
                $jwt = new JWT();
                $key = new key($key_, "HS256");
                $tokenResuelto = $jwt->decode($token_, $key);
                if ($tokenResuelto->usuario->NombreUsuario == $NombreUsuario_)
                {
                    $resultado = true;
                }
            } catch (\Throwable $th) {
                $resultado = false;
            }
            return $resultado;
        }
    }
