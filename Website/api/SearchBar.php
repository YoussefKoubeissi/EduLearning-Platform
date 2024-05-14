<?php
require_once("Connection.php");

if (isset($_REQUEST["SearchValue"])) {
    $SearchValue = $_REQUEST["SearchValue"];
    
    $query = "select * from Portal where PortalName = N'$SearchValue'";
    $data = sqlsrv_query($conn, $query, array(), array("Scrollable" => "static")) or die(print_r(sqlsrv_errors(), true));
    $arr = array();
    while($row = sqlsrv_fetch_Object($data)){
        $arr[] = $row;

    }
    echo json_encode($arr);
}

?>