<?php
// Incluir la biblioteca FPDF
require('../../vendor/setasign/fpdf/fpdf.php');


// Cargar datos de la API
$data = json_decode(file_get_contents('http://localhost/app/services/detalle/listar.php?idcotizacion=1'), true);
$cotiza = json_decode(file_get_contents('http://localhost/app/services/cotizacion/listar.php'), true);
// $cliente = json_decode(file_get_contents('http://localhost/app/services/cliente/listar.php'), true);

// Cargar la imagen de plantilla
$imagen = imagecreatefromjpeg('../src/img/cot.jpg');

// Definir color y fuente
$colorTexto = imagecolorallocate($imagen, 0, 0, 0);
$fuente = '../src/fonts/Roboto/Roboto-Black.ttf'; // Ruta a la fuente TrueType

// DETALLE COTIZACION
$y = 530;
for ($i = 0; $i < count($data); $i++) {
    imagettftext(
        $imagen,
        20,
        0,
        350,
        $y,
        $colorTexto,
        $fuente,
        $data[$i]['NombreProducto']
    );
    imagettftext(
        $imagen,
        20,
        0,
        810,
        $y,
        $colorTexto,
        $fuente,
        $data[$i]['CantidadDetalleCotizacion']
    );
    imagettftext(
        $imagen,
        20,
        0,
        910,
        $y,
        $colorTexto,
        $fuente,
        $data[$i]['PrecioProducto']
    );
    $y += 40;
}


foreach ($cotiza as $uno) {
    $originalDate = $uno['FechaEmision'];
    $newDate = date("d/m/Y", strtotime($originalDate));
    if ($uno['CodigoCotizacion'] == $data[0]['CodigoCotizacion']) {
        imagettftext($imagen, 20, 0, 500, 315, $colorTexto, $fuente, $uno['NombreCliente']);
        imagettftext($imagen, 20, 0, 500, 280, $colorTexto, $fuente, $newDate);
    }
}

// foreach ($data as $item) {
//     imagettftext($imagen, 12, 0, 150, 100, $colorTexto, $fuente, $item['NombreProducto']);
//     imagettftext($imagen, 12, 0, 150, 120, $colorTexto, $fuente, $item['PrecioProducto']);
//     imagettftext($imagen, 12, 0, 150, 140, $colorTexto, $fuente, $item['FechaEmisionCotizacion']);
// }


// Guardar la imagen temporalmente
$imagePath = 'cotizacion_temp.jpg';
imagejpeg($imagen, $imagePath);
imagedestroy($imagen);

// Crear el PDF con FPDF y agregar la imagen
$pdf = new FPDF();
$pdf->AddPage();
$pdf->Image($imagePath, 10, 10, 190); // Posicionar la imagen en el PDF

// Guardar o mostrar el PDF
$pdfOutputPath = 'cotizacion_final.pdf';
$pdf->Output('F', $pdfOutputPath);

// Eliminar la imagen temporal
unlink($imagePath);

echo "PDF generado exitosamente: <a href='$pdfOutputPath'>Descargar PDF</a>";
// print_r($data);