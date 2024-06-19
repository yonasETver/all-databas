<?php
$sName="mysql:host=localhost;dbname=project;";
$uName="root";
$pass="";

try{
 $conn=new PDO($sName,$uName,$pass);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql="CREATE TABLE stationKm(
     
     stationOneKM float(2) NOT NULL,
     stationTWOKM float(2) NOT NULL,
     stationThreeKM float(2) NOT NULL,
     stationFourKM float(2) NOT NULL,
     stationFiveKM float(2) NOT NULL,
     stationSixKM float(2) NOT NULL,
     stationSevenKM float(2) NOT NULL,
     stationEightKM float(2) NOT NULL,
     stationNineKM float(2) NOT NULL,
     stationTenKM float(2) NOT NULL,
     stationElevenKM float(2) NOT NULL,
     stationTwowelvKM float(2) NOT NULL,
     stationThrteenKM float(2) NOT NULL,
     root_ID VARCHAR(10),
     CONSTRAINT fk_rootIDforKm FOREIGN KEY (root_ID) REFERENCES roots(root_ID) ON DELETE CASCADE ON UPDATE CASCADE
 )";
 $conn->exec($sql);
 echo "Table created successfully!";
}catch(PDOException $e) {
    $err= $e->getMessage();
    echo $sql."<br/>Connection failed!!! ".$err ;
}

$conn=null;

?>