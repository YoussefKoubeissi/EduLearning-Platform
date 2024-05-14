<?php
require_once("Connection.php");

if (isset($_REQUEST["PartID"])){
    $PartID = $_REQUEST["PartID"];
}

if (isset($_REQUEST["operation"])){
    $operation = $_REQUEST["operation"];
}

switch ($operation) {

    case "PartInfo":
        $query = "select * from Part where PartID = $PartID";
        $data = sqlsrv_query($conn, $query, array(), array("Scrollable" => "static")) or die(print_r(sqlsrv_errors(), true));
        $arr = array();
        while($row = sqlsrv_fetch_Object($data)){
            $arr[] = $row;
    
        }
        echo json_encode($arr);
    
        break;

    default:
        echo json_encode("Invalid operation.");
        break;
}

?>