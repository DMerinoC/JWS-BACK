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
$ordenes = json_decode(file_get_contents('http://localhost/app/services/orden/listar.php'), true);

// Cargar la imagen de plantilla
$imagen = imagecreatefromjpeg('../../src/img/orden.jpg');

// Definir color y fuente
$colorTexto = imagecolorallocate($imagen, 0, 0, 0);
$fuente = '../../src/fonts/Roboto/Roboto-Black.ttf'; // Ruta a la fuente TrueType

// DETALLE COTIZACION
$y = 612;
$sum = 0;
for ($i = 0; $i <= count($data); $i++) {
    if ($i != count($data)) {
        imagettftext($imagen, 16, 0, 158, $y, $colorTexto, $fuente, $data[$i]['CantidadDetalleCotizacion']);
        imagettftext($imagen, 16, 0, 200, $y, $colorTexto, $fuente, $data[$i]['NombreProducto']);
        imagettftext($imagen, 16, 0, 1290, $y, $colorTexto, $fuente, $data[$i]['PrecioProducto']);
        $total = $data[$i]['CantidadDetalleCotizacion'] * $data[$i]['PrecioProducto'];
        imagettftext($imagen, 16, 0, 1430, $y, $colorTexto, $fuente, $total);
        $y += 27;
        $sum += $total;
    }
}

imagettftext($imagen, 16, 0, 1470, 1142, $colorTexto, $fuente, $sum);

foreach ($ordenes as $orden) {
    $originalDate = $orden['FechaEmisionOrden'];
    $newDate = date("d/m/Y", strtotime($originalDate));
    if ($orden['CodigoCotizacion'] == $data[0]['CodigoCotizacion']) {
        imagettftext($imagen, 16, 0, 1470, 209, $colorTexto, $fuente, $orden['CodigoOrdenTrabajo']);
        imagettftext($imagen, 16, 0, 180, 209, $colorTexto, $fuente, 'Corp S.A.C.');
        imagettftext($imagen, 16, 0, 180, 236, $colorTexto, $fuente, $orden['NombreTrabajador']);
        imagettftext($imagen, 16, 0, 180, 263, $colorTexto, $fuente, $newDate);
    }
}

// Guardar la imagen temporalmente
$imagePath = 'cotizacion_temp.jpg';
imagejpeg($imagen, $imagePath);
imagedestroy($imagen);

// Crear el PDF con FPDF y agregar la imagen
$pdf = new FPDF();
$pdf->AddPage();
$pdf->Image($imagePath, 10, 10, 190);

// Eliminar la imagen temporal
unlink($imagePath);

// Configurar las cabeceras para descargar el PDF directamente
$pdfOutputPath = "orden_$idCotizacion.pdf";
header('Content-Type: application/pdf');
header('Content-Disposition: inline; filename="' . $pdfOutputPath . '"');
$pdf->Output('I');