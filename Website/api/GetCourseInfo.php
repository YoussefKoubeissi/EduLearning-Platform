<?php
require_once("Connection.php");

if (isset($_REQUEST["CourseID"])){
    $CourseID = $_REQUEST["CourseID"];
}

if (isset($_REQUEST["operation"])){
    $operation = $_REQUEST["operation"];
}

switch ($operation) {

    case "CourseHead":
        $query = "select * from CourseInfo where CourseID= $CourseID";
        $data = sqlsrv_query($conn, $query, array(), array("Scrollable" => "static")) or die(print_r(sqlsrv_errors(), true));
        $arr = array();
        while($row = sqlsrv_fetch_Object($data)){
            $arr[] = $row;

        }
        echo json_encode($arr);

        break;

    case "CourseChapters":
        $query = "select * from CourseChapters where CourseID = $CourseID";
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