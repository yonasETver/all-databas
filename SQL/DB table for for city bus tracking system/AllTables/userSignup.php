<?php
$sName="mysql:host=localhost;dbname=project;";
$uName="root";
$pass="";

try{
 $conn=new PDO($sName,$uName,$pass);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql="CREATE TABLE sigh_upUser(
    signId INT(5) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fName VARCHAR (20) NOT NULL,
    lName VARCHAR (20) NOT NULL,
    sex VARCHAR(6) NOT NULL,
    /*Birth day */
    Birth_day INT(2) NOT NULL,
    Birth_month VARCHAR(6) NOT NULL,
    Birth_year INT(4) NOT NULL,
    country VARCHAR(8) NOT NULL,
    region VARCHAR(12) NOT NULL,
    city VARCHAR(12) NOT NULL,
    phon VARCHAR(20) NOT NULL,
    email VARCHAR(30) NOT NULL,
    AcounName VARCHAR(20) NOT NULL,
    pass VARCHAR(20) NOT NULL,
    passConfirm VARCHAR(20) NOT NULL
   
)";
 $conn->exec($sql);
 echo "Table created successfully!";
}catch(PDOException $e) {
    $err= $e->getMessage();
    echo $sql."<br/>Connection failed!!! ".$err ;
}

$conn=null;

?>