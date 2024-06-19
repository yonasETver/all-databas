<?php
$sName="mysql:host=localhost;dbname=project;";
$uName="root";
$pass="";

try{
 $conn=new PDO($sName,$uName,$pass);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql="CREATE TABLE gps(
     
     curGpsLat float NOT NULL,
     curGpsLon float NOT NULL,
     altiti float NOT NULL,
     root_ID VARCHAR(10) ,
     CONSTRAINT fk_rootIDforAlti FOREIGN KEY (root_ID) REFERENCES roots(root_ID) ON DELETE CASCADE ON UPDATE CASCADE
 )";
 $conn->exec($sql);
 echo "Table created successfully!";
}catch(PDOException $e) {
    $err= $e->getMessage();
    echo $sql."<br/>Connection failed!!! ".$err ;
}

$conn=null;

?>