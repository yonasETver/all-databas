<?php
$sName="mysql:host=localhost;dbname=Item_Project;";
$uName="root";
$pass="";

try{
 $conn=new PDO($sName,$uName,$pass);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql="CREATE TABLE employee(
     emp_Id INT(5) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
     fName VARCHAR(20),
     lName VARCHAR(20),
     job_Discription VARCHAR(20),
     date_Higered DATE

 )";
 $conn->exec($sql);
 echo "Table created successfully!";
}catch(PDOException $e) {
    $err= $e->getMessage();
    echo $sql."<br/>Connection failed!!! ".$err ;
}

$conn=null;

?>