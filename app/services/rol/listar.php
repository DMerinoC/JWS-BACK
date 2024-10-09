<?php
    require_once '../../models/rol.php';
    $rol = rol::Listar();
    echo json_encode($rol);