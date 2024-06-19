<?php

echo "<style>th{
  border: solid 3px pink;
  background-color:aqua;
 
} table{border-collapse: collapse; } </style>";

echo "<table style='border: solid 3px green;'>";
echo "<tr>
      <th>ID</th>
      <th>comp_Name</th>
      <th>ord_Date</th>
      <th>tot_Item</th>
      <th>tot_Wight</th>
      <th>item_Location</th>
      <th>item_Destination</th>
      <th>distance</th>
      <th>recive_Date</th>
      <th>sheep_with_dron</th>
      <th>country</th>
      <th>gps</th>
      <th>reg_Id</th>
      <th>primary_phone</th>
      <th>seccond_phon</th>
      <th>email</th>
      <th>website</th>
      <th>sheeped_ID</th>
      <th>number_vehicle</th>
      <th>trans_price</th>
      <th>labour_price</th>
      <th>total</th>
      <th>vat</th>
      <th>net_total</th>
      <th>emp_Id</th>
      <th>comment</th>
      <th>TimeStamp</th>
      </tr>";

class TableRows extends RecursiveIteratorIterator {
  function __construct($it) {
    parent::__construct($it, self::LEAVES_ONLY);
  }

  function current() {
    return "<td style='width:150px;border:1px solid black;'>" . parent::current(). "</td>";
  }

  function beginChildren() {
    echo "<tr>";
  }

  function endChildren() {
    echo "</tr>" . "\n";
  }
}

$sName="mysql:host=localhost;dbname=item_Project;";
$uName="root";
$pass="";

try{
$conn=new PDO($sName,$uName,$pass);
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
$stmt = $conn->prepare("SELECT *FROM recored");
  $stmt->execute();

  // set the resulting array to associative
  $result = $stmt->setFetchMode(PDO::FETCH_ASSOC);
  foreach(new TableRows(new RecursiveArrayIterator($stmt->fetchAll())) as $k=>$v) {
    echo $v;
  }
}catch(PDOException $e) {
    $err= $e->getMessage();
    echo $sql."<br/>Connection failed!!! ".$err ;
}

$conn=null;
echo "</table>";

?>
