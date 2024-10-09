<?php
    require_once '../../models/trabajador.php';
    $trabajador = trabajador::Listar();
    echo json_encode($trabajador);