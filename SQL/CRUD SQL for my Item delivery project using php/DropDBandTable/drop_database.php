<?php
$sName="mysql:host=localhost;dbname=Item_Project;";
$uName="root";
$pass="";
$dbName="";

try{
 $conn=new PDO($sName,$uName,$pass);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql="DROP DATABASE $dbName";
 $conn->exec($sql);
 echo "Database droped successfully!";
}catch(PDOException $e) {
    $err= $e->getMessage();
    echo $sql."<br/>Connection failed!!! ".$err ;
}

$conn=null;

?>