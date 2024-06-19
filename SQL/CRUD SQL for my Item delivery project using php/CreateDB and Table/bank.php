<?php
$sName="mysql:host=localhost;dbname=Item_Project;";
$uName="root";
$pass="";

try{
 $conn=new PDO($sName,$uName,$pass);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql="CREATE TABLE bank_Pay (
     bank_ID INT(5) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
     cName VARCHAR(20),
     ordDay DATE,
     bNme VARCHAR(20) NOT NULL,
     refNumber VARCHAR(20) NOT NULL,
     amaPayed FLOAT NOT NULL
 )";
 $conn->exec($sql);
 echo "Table created successfully!";
}catch(PDOException $e) {
    $err= $e->getMessage();
    echo $sql."<br/>Connection failed!!! ".$err ;
}

$conn=null;

?>