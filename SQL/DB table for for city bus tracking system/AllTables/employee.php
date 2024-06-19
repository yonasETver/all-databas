<?php
$sName="mysql:host=localhost;dbname=project;";
$uName="root";
$pass="";

try{
 $conn=new PDO($sName,$uName,$pass);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql="CREATE TABLE employee(
     emp_Id INT(5) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
     fName VARCHAR(20),
     lName VARCHAR(20),
     Birth_day INT(2) NOT NULL,
     Birth_month VARCHAR(6) NOT NULL,
     Birth_year INT(4) NOT NULL,
     sex VARCHAR(6),
     nation VARCHAR(20),
     background VARCHAR(30),
     WorkExpriInYear INT(2),
     job_Discription VARCHAR(20),
     Higered_day INT(2) NOT NULL,
     Higered_month VARCHAR(6) NOT NULL,
     Higered_year INT(4) NOT NULL

 )";
 $conn->exec($sql);
 echo "Table created successfully!";
}catch(PDOException $e) {
    $err= $e->getMessage();
    echo $sql."<br/>Connection failed!!! ".$err ;
}

$conn=null;

?>