<?php
// Incluir la biblioteca FPDF
require('../../../vendor/setasign/fpdf/fpdf.php');

// Verificar si se recibe el parámetro idcotizacion
if (!isset($_GET['idcotizacion']) || empty($_GET['idcotizacion'])) {
    http_response_code(400);
    echo "Error: Falta el parámetro 'idcotizacion'.";
    exit;
}

$idCotizacion = intval($_GET['idcotizacion']);

// Cargar datos de la API
$data = json_decode(file_get_contents("http://localhost/app/services/detalle/listar.php?idcotizacion=$idCotizacion"), true);
$cotiza = json_decode(file_get_contents('http://localhost/app/services/cotizacion/listar.php'), true);

// Cargar la imagen de plantilla
$imagen = imagecreatefromjpeg('../../src/img/cot.jpg');

// Definir color y fuente
$colorTexto = imagecolorallocate($imagen, 0, 0, 0);
$fuente = '../../src/fonts/Roboto/Roboto-Black.ttf'; // Ruta a la fuente TrueType

// DETALLE COTIZACION
$y = 530;
for ($i = 0; $i <= count($data); $i++) {
    if ($i != count($data)) {
        imagettftext($imagen, 20, 0, 350, $y, $colorTexto, $fuente, $data[$i]['NombreProducto']);
        imagettftext($imagen, 20, 0, 810, $y, $colorTexto, $fuente, $data[$i]['CantidadDetalleCotizacion']);
        imagettftext($imagen, 20, 0, 910, $y, $colorTexto, $fuente, $data[$i]['PrecioProducto']);
        $y += 40;
    }
}

foreach ($cotiza as $uno) {
    $originalDate = $uno['FechaEmision'];
    $newDate = date("d/m/Y", strtotime($originalDate));
    if ($uno['CodigoCotizacion'] == $data[0]['CodigoCotizacion']) {
        imagettftext($imagen, 20, 0, 500, 315, $colorTexto, $fuente, $uno['NombreCliente']);
        imagettftext($imagen, 20, 0, 500, 280, $colorTexto, $fuente, $newDate);
    }
}

// Guardar la imagen temporalmente
$imagePath = 'cotizacion_temp.jpg';
imagejpeg($imagen, $imagePath);
imagedestroy($imagen);

// Crear el PDF con FPDF y agregar la imagen
$pdf = new FPDF();
$pdf->AddPage();
$pdf->Image($imagePath, 10, 10, 190); // Posicionar la imagen en el PDF

// Configurar las cabeceras para descargar el PDF directamente
$pdfOutputPath = "cotizacion$idCotizacion.pdf";
header('Content-Type: application/pdf');
header('Content-Disposition: inline; filename="' . $pdfOutputPath . '"');
$pdf->Output('I');

// Eliminar la imagen temporal
unlink($imagePath);