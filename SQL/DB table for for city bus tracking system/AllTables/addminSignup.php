<?php
$sName="mysql:host=localhost;dbname=project;";
$uName="root";
$pass="";

try{
 $conn=new PDO($sName,$uName,$pass);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql="CREATE TABLE sign_inAdmin(
    aminId INT(5) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    acount VARCHAR (20) NOT NULL,
    pass VARCHAR(20) NOT NULL,
    emp_Id INT(5) UNSIGNED,
    CONSTRAINT fk_emploteeAdmin FOREIGN KEY (emp_Id) REFERENCES employee(emp_Id) ON DELETE CASCADE ON UPDATE CASCADE
)";
 $conn->exec($sql);
 echo "Table created successfully!";
}catch(PDOException $e) {
    $err= $e->getMessage();
    echo $sql."<br/>Connection failed!!! ".$err ;
}

$conn=null;

?>