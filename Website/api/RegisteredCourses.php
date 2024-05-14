<?php
require_once("Connection.php");

if (isset($_REQUEST["UserID"]) && isset($_REQUEST["CourseID"])){
    $UserID = $_REQUEST["UserID"];
    $CourseID = $_REQUEST["CourseID"];

    $query = "select RegistrationID from RegisteredCourses where UserID = '$UserID' and CourseID = '$CourseID'";
    $data = sqlsrv_query($conn, $query, array(), array("Scrollable" => "static")) or die(print_r(sqlsrv_errors(), true));

    if ($data && sqlsrv_has_rows($data)) {
        // User found, retrieve UserID
        $row = sqlsrv_fetch_array($data, SQLSRV_FETCH_ASSOC);
        $RegistrationID = $row['RegistrationID'];
        //echo $RegistrationID;
        
        // Respond with success
        echo json_encode("True");
    } else {
        // Login failed
        echo json_encode("False");
    }

}

?>