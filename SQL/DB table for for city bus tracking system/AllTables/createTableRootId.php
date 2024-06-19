<?php
$sName="mysql:host=localhost;dbname=project;";
$uName="root";
$pass="";

try{
 $conn=new PDO($sName,$uName,$pass);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql="CREATE TABLE roots(
     root_ID VARCHAR(10) PRIMARY KEY,
     stationOne VARCHAR(10) NOT NULL,
     stationTWO VARCHAR(10) NOT NULL,
     stationThree VARCHAR(10) NOT NULL,
     stationFour VARCHAR(10) NOT NULL,
     stationFive VARCHAR(10) NOT NULL,
     stationSix VARCHAR(10) NOT NULL,
     stationSeven VARCHAR(10) NOT NULL,
     stationEight VARCHAR(10) NOT NULL,
     stationNine VARCHAR(10) NOT NULL,
     stationTen VARCHAR(10) NOT NULL,
     stationEleven VARCHAR(10) NOT NULL,
     stationTwowelv VARCHAR(10) NOT NULL,
     stationThrteen VARCHAR(10) NOT NULL,
     numberOfbus INT(2) NOT NULL
 )";
 $conn->exec($sql);
 echo "Table created successfully!";
}catch(PDOException $e) {
    $err= $e->getMessage();
    echo $sql."<br/>Connection failed!!! ".$err ;
}

$conn=null;

?>