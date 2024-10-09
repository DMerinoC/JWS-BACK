<?php
    require_once '../../models/materiaPrima.php';
    $materia = materia::Listar();
    echo json_encode($materia);