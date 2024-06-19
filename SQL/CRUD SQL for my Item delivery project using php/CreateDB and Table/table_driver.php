<?php
$sName="mysql:host=localhost;dbname=item_Project;";
$uName="root";
$pass="";

try{
 $conn=new PDO($sName,$uName,$pass);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

 
 $sql="CREATE TABLE driver(
     driver_ID  INT(5) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
     fName VARCHAR(20) NOT NULL,
     lName VARCHAR(20) NOT NULL,
     sex VARCHAR(1) NOT NULL,
     age INT(2) NOT NULL,
     driver_licence_Id VARCHAR(20) NOT NULL
     
 )";
 $conn->exec($sql);
 echo "Table created successfully!";
}catch(PDOException $e) {
    $err= $e->getMessage();
    echo $sql."<br/>Connection failed!!! ".$err ;
}

$conn=null;

?>