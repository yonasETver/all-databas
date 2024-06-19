<?php
$sName="mysql:host=localhost;dbname=project;";
$uName="root";
$pass="";

try{
 $conn=new PDO($sName,$uName,$pass);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql="CREATE TABLE stationName(
     
     stationOneName VARCHAR(30) NOT NULL,
     stationTWOName VARCHAR(30) NOT NULL,
     stationThreeName VARCHAR(30) NOT NULL,
     stationFourName VARCHAR(30) NOT NULL,
     stationFiveName VARCHAR(30) NOT NULL,
     stationSixName VARCHAR(30) NOT NULL,
     stationSevenName VARCHAR(30) NOT NULL,
     stationEightName VARCHAR(30) NOT NULL,
     stationNineName VARCHAR(30) NOT NULL,
     stationTenName VARCHAR(30) NOT NULL,
     stationElevenName VARCHAR(30) NOT NULL,
     stationTwowelvName VARCHAR(30) NOT NULL,
     stationThrteenName VARCHAR(30) NOT NULL,
     root_ID VARCHAR(10) ,
     CONSTRAINT fk_rootID FOREIGN KEY (root_ID) REFERENCES roots(root_ID) ON DELETE CASCADE ON UPDATE CASCADE
 )";
 $conn->exec($sql);
 echo "Table created successfully!";
}catch(PDOException $e) {
    $err= $e->getMessage();
    echo $sql."<br/>Connection failed!!! ".$err ;
}

$conn=null;

?>