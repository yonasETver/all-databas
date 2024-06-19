<?php
$sName="mysql:host=localhost;dbname=project;";
$uName="root";
$pass="";

try{
 $conn=new PDO($sName,$uName,$pass);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql="CREATE TABLE busTrackingTWO(
    carTrackingId INT(5) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    dire VARCHAR(5),
    currentPos FLOAT(3) NOT NULL,
    averageKM_hou FLOAT(3) NOT NULL,
    year int NOT NULL,
    month int NOT NULL,
    date_ int NOT NULL, 
    time_ int NOT NULL,
    minitue int NOT NULL,
    carId INT(5) UNSIGNED,
    root_ID VARCHAR(10),
    CONSTRAINT fk_caridTWO FOREIGN KEY (carId) REFERENCES bus(carId) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_rootIDforTrackingTWO FOREIGN KEY (root_ID) REFERENCES roots(root_ID) ON DELETE CASCADE ON UPDATE CASCADE
    
    
   
)";
 $conn->exec($sql);
 echo "Table created successfully!";
}catch(PDOException $e) {
    $err= $e->getMessage();
    echo $sql."<br/>Connection failed!!! ".$err ;
}

$conn=null;

?>