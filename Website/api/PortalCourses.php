<?php
require_once("Connection.php");

if (isset($_REQUEST["operation"])){
    $operation = $_REQUEST["operation"];
}
else{
    $operation = "Default";
}

switch ($operation) {

    case "SelectPortals":
        //echo "Performing SelectAll operation...";
        // Add your code for SelectAll here
        $query = "select * from PortalsView";
        $data = sqlsrv_query($conn, $query, array(), array("Scrollable" => "static")) or die(print_r(sqlsrv_errors(), true));
        $arr = array();
        while($row = sqlsrv_fetch_Object($data)){
            $arr[] = $row;

        }
        echo json_encode($arr);
        //echo " SelectAll operation Done...";

        break;

    default:
        echo json_encode("Invalid operation.");
        // Add default code for handling invalid operations
        break;
}

?>