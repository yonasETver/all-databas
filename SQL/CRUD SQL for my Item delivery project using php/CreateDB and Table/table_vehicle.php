<?php
$sName="mysql:host=localhost;dbname=Item_Project;";
$uName="root";
$pass="";

try{
 $conn=new PDO($sName,$uName,$pass);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql="CREATE TABLE vehicle(
     sheeped_ID INT(5) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
     car_type VARCHAR(10) NOT NULL,
     plate_ID INT(5) UNSIGNED, 
     CONSTRAINT fk_vehicle FOREIGN KEY ( plate_ID) REFERENCES plate( plate_ID) ON DELETE CASCADE ON UPDATE CASCADE
 )";
 $conn->exec($sql);
 echo "Table created successfully!";
}catch(PDOException $e) {
    $err= $e->getMessage();
    echo $sql."<br/>Connection failed!!! ".$err ;
}

$conn=null;

?>