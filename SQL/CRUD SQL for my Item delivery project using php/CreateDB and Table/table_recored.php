<?php
$sName="mysql:host=localhost;dbname=Item_Project;";
$uName="root";
$pass="";

try{
 $conn=new PDO($sName,$uName,$pass);
 $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
 $sql="CREATE TABLE recored(
     imp_Id INT(5) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
     comp_Name VARCHAR(20) NOT NULL,
     ord_Date DATE NOT NULL,
     itypeH INT(1),
     sack INT(10),
     tot_Item INT(6) NOT NULL,
     tot_Wight FLOAT NOT NULL,
     item_Location VARCHAR(12) NOT NULL,
     latItemlocgps VARCHAR(12) NOT NULL,
     item_Destination VARCHAR(12) NOT NULL,
     latlItemdelivgps VARCHAR(12) NOT NULL,
     distance FLOAT NOT NULL,
     recive_Date DATE NOT NULL,
     sheep_with_dron INT(1) NULL,
     country VARCHAR(8) NOT NULL,
     gps VARCHAR(14) NOT NULL,
     latgps VARCHAR(14) NOT NULL,
     reg_Id INT(5) UNSIGNED,
     primary_phone VARCHAR(14) NOT NULL,
     seccond_phon VARCHAR(14)  NULL,
     email VARCHAR(20) NOT NULL,
     website VARCHAR(20) NULL,
     sheeped_ID INT(5) UNSIGNED ,
     number_vehicle INT(3) NOT NULL,
     trans_price FLOAT NOT NULL,
     labour_price FLOAT NOT NULL,
     total FLOAT NOT NULL,
     vat FLOAT NOT NULL,
     net_total FLOAT NOT NULL,
     emp_Id INT(5) UNSIGNED,
     comment VARCHAR(1000) NULL,
     ubdate_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     CONSTRAINT fk_regiones FOREIGN KEY (reg_Id) REFERENCES region_ID(reg_Id) ON DELETE CASCADE ON UPDATE CASCADE,
     CONSTRAINT fk_sheeped FOREIGN KEY (sheeped_ID) REFERENCES vehicle(sheeped_ID) ON DELETE CASCADE ON UPDATE CASCADE,
     CONSTRAINT fk_emplotee FOREIGN KEY (emp_Id) REFERENCES employee(emp_Id) ON DELETE CASCADE ON UPDATE CASCADE

 )";
 $conn->exec($sql);
 echo "Table created successfully!";
}catch(PDOException $e) {
    $err= $e->getMessage();
    echo $sql."<br/>Connection failed!!! ".$err ;
}

$conn=null;

?>