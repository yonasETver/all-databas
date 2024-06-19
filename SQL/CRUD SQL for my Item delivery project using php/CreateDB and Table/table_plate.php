<?php
$sName="mysql:host=localhost;dbname=Item_Project;";
$uName="root";
$pass="";

try{
 $conn=new PDO($sName,$uName,$pass);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql="CREATE TABLE plate(
     plate_ID INT(5) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
     car_Model VARCHAR(20),
     car_Color VARCHAR(10),
     load_Capacity FLOAT NOT NULL,
     driver_ID INT(5) UNSIGNED, 
     
     CONSTRAINT fk_plate FOREIGN KEY (driver_ID) REFERENCES driver(driver_ID) ON DELETE CASCADE ON UPDATE CASCADE 
 )";
 $conn->exec($sql);
 echo "Table created successfully!";
}catch(PDOException $e) {
    $err= $e->getMessage();
    echo $sql."<br/>Connection failed!!! ".$err ;
}

$conn=null;

?>