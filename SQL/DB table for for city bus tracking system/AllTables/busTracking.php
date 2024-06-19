<?php
$sName="mysql:host=localhost;dbname=project;";
$uName="root";
$pass="";

try{
 $conn=new PDO($sName,$uName,$pass);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql="CREATE TABLE busTracking(
    carTrackingId INT(5) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    curGpsLat float(7) NOT NULL,
    curGpsLon float(7) NOT NULL,
    alltitiuid float(5) NOT NULL,
    currentPos FLOAT(3) NOT NULL,
    averageKM_hou FLOAT(3) NOT NULL,
    record_time time NOT NULL,
    carId INT(5) UNSIGNED,
    root_ID VARCHAR(10),
    CONSTRAINT fk_carid FOREIGN KEY (carId) REFERENCES bus(carId) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_rootIDforTracking FOREIGN KEY (root_ID) REFERENCES roots(root_ID) ON DELETE CASCADE ON UPDATE CASCADE
    
    
   
)";
 $conn->exec($sql);
 echo "Table created successfully!";
}catch(PDOException $e) {
    $err= $e->getMessage();
    echo $sql."<br/>Connection failed!!! ".$err ;
}

$conn=null;

?>