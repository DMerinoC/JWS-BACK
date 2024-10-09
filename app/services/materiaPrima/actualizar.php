<?php
require_once '../../models/materiaPrima.php';
if (isset($_POST["CodigoMateriaPrima"], $_POST["NombreMateriaPrima"], $_POST["PrecioMateriaPrima"], $_POST["CantidadMateriaPrima"], $_POST["UnidadMateriaPrima"], $_POST["CodigoProveedor"], $_POST["DescripcionMateriaPrima"], $_POST["ListaPredeMateriaPrima"])) {
    $CodigoMateriaPrima = $_POST["CodigoMateriaPrima"];
    $NombreMateriaPrima = $_POST["NombreMateriaPrima"];
    $PrecioMateriaPrima = $_POST["PrecioMateriaPrima"];
    $CantidadMateriaPrima = $_POST["CantidadMateriaPrima"];
    $UnidadMateriaPrima = $_POST["UnidadMateriaPrima"];
    $CodigoProveedor = $_POST["CodigoProveedor"];
    $DescripcionMateriaPrima = $_POST["DescripcionMateriaPrima"];
    $ListaPredeMateriaPrima = $_POST["ListaPredeMateriaPrima"];

    if (!empty($CodigoMateriaPrima) && !empty($NombreMateriaPrima) && !empty($PrecioMateriaPrima) && !empty($CantidadMateriaPrima) && !empty($UnidadMateriaPrima) && !empty($CodigoProveedor) && !empty($DescripcionMateriaPrima) && !empty($ListaPredeMateriaPrima)) {
        $materia = new materia($CodigoMateriaPrima, $NombreMateriaPrima, $PrecioMateriaPrima, $CantidadMateriaPrima, $UnidadMateriaPrima, $CodigoProveedor, "", $DescripcionMateriaPrima, $ListaPredeMateriaPrima);
        $resultado = $materia->ActualizarMateria();
        if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'La materia prima ya existe') {
            echo json_encode(['mensaje' => 'La materia prima ya existe']);
        } else if (is_array($resultado) && count($resultado) > 0 && isset($resultado[0]['mensaje']) && $resultado[0]['mensaje'] == 'Materia prima actualizada correctamente') {
            echo json_encode(['mensaje' => 'Materia prima actualizada correctamente']);
        }
    } else {
        echo json_encode(['mensaje' => 'Rellene los campos vacios']);
    }
} else {
    echo json_encode(['mensaje' => 'Ocurrió un error, inténtelo de nuevo más tarde']);
}