
<?php
    require('./fpdf/fpdf.php');
    include('includes/dbconnection.php');

    $cid=$_GET['vid'];

    //$ret=mysqli_query($con,"select RegistrationNumber, OwnerName from tblvehicle where ID='$cid'");
    //$cnt=1;

    //$row=mysqli_fetch_array($ret);

    $sql = "SELECT ID, RegistrationNumber, OwnerContactNumber from tblvehicle where ID='$cid'";
    $result=mysqli_query($con, $sql);

    class PDF extends FPDF{

        // Cabecera de página
        function Header(){

            $this->Ln(20);

            $this->Image('./images/circulo.png',30,-10,40,40);
            // Logo
            $this->Image('./images/logoEUV2.png',25,35,52,32);
            
             //Fecha
             $this->Ln(25);
             $this->Cell(60);
             $this->SetFont('Arial','B',8);
             $this->Cell(10, 10,'Fecha:', 0,0,'');
             $this->SetFont('Arial','',8);
             $this->Cell(20, 10,date('d/m/Y'), 0,1,'');
             $this->Ln(1);

    
            // Arial bold 15
            $this->SetFont('Arial','B',16);
    
            // Movernos a la derecha
            $this->Cell(8);
    
            // Título
            $this->Cell(70,10,'Universidad Veracruzana',0,0,'C');
    
            // Salto de línea
    
            //Dirección
            $this->Ln();
            $this->SetFont('Arial','',14);
            $this->Cell(-2);
            $this->Cell(30, 5,'Facultad de contaduria y administración', 0,1,'');
            $this->Ln(5);
           
    
    
        }
    
        // Pie de página
        function Footer(){
    
            // Posición: a 1,5 cm del final
            $this->SetY(-15);
            // Arial italic 8
            $this->SetFont('Arial','I',8);
            
    
        }
    }
    
        // Creación del objeto de la clase heredada
    
        $pdf = new PDF('P', 'mm', array(100,150), true);
        $pdf->AliasNbPages();
        $pdf->AddPage();
    
        $pdf->SetFillColor(255,255,255);
        $pdf->SetFont('Arial','B',50);
    
        $pdf->Ln();
        
        while($row = $result->fetch_assoc())
        {
            $pdf->Cell(30);
            $pdf->Cell(20,6,utf8_decode($row['ID']),0,1,'C');
            $pdf->Ln();

            $pdf->SetFont('Arial','B',15);
            $pdf->Cell(20,6,'Placa:',0,1,'C',1);      
            $pdf->SetFont('Arial','',14);
            $pdf->Cell(60,6,utf8_decode($row['RegistrationNumber']),0,1,'C');
            

            $pdf->SetFont('Arial','B',15);
            $pdf->Cell(28,6,'Teléfono:',0,1,'C',1);
            $pdf->SetFont('Arial','',14);
            $pdf->Cell(60,6,utf8_decode($row['OwnerContactNumber']),0,1,'C');

            $pdf->Ln();
            $pdf->Image('http://localhost/estacionateUV/vpms/codigoQR.php', 70, 120, 30, 30, "png");
            
        }
        $pdf->Output();
    
    


?>
