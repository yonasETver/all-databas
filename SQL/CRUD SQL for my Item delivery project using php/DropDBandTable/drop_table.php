<?php
$sName="mysql:host=localhost;dbname=item_Project";
$uName="root";
$pass="";
$tname="";
try{
 $conn=new PDO($sName,$uName,$pass);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql="DROP TABLE $tname";
 $conn->exec($sql);
 echo "Table droped successfully!";
}catch(PDOException $e) {
    $err= $e->getMessage();
    echo $sql."<br/>Connection failed!!! ".$err ;
}

$conn=null;

?>