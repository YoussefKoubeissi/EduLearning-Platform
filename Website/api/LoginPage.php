<?php
require_once("Connection.php");

/////////////////////////////////////////////////////////////

// require_once("../../vendor/autoload.php"); // Include JWT library

// use Firebase\JWT\JWT;

// session_start();

// if (isset($_REQUEST["Email"]) && isset($_REQUEST["Password"])){
//     $Email = $_REQUEST["Email"];
//     $Password = $_REQUEST["Password"];

//     $query = "select UserID from Users where UserEmail = N'$Email' and UserPassword = N'$Password'";
//     $data = sqlsrv_query($conn, $query, array(), array("Scrollable" => "static")) or die(print_r(sqlsrv_errors(), true));

//     if ($data && sqlsrv_has_rows($data)) {
//         // User found, retrieve UserID
//         $row = sqlsrv_fetch_array($data, SQLSRV_FETCH_ASSOC);
//         $UserID = $row['UserID'];
        
//         // Generate JWT
//         $payload = array(
//             "UserID" => $UserID,
//             // Add more claims as needed
//         );
//         $key = "your_secret_key";
//         $algorithm = "HS256";
//         $jwt = JWT::encode($payload, $key, $algorithm);

//         // Respond with JWT
//         echo json_encode(array("token" => $jwt));

//         // Store UserID in cookie (serialize it)
//         setcookie('token', $jwt, time() + 5000, '/');
        
//         // Respond with success
//         echo json_encode("True");
//     } else {
//         // Login failed
//         echo json_encode("False");
//     }
// }

//////////////////////////////////////////////////////////////////////////////////

session_start();

if (isset($_REQUEST["Email"]) && isset($_REQUEST["Password"])){
    $Email = $_REQUEST["Email"];
    $Password = $_REQUEST["Password"];

    $query = "select UserID from Users where UserEmail = N'$Email' and UserPassword = N'$Password'";
    $data = sqlsrv_query($conn, $query, array(), array("Scrollable" => "static")) or die(print_r(sqlsrv_errors(), true));

    if ($data && sqlsrv_has_rows($data)) {
        // User found, retrieve UserID
        $row = sqlsrv_fetch_array($data, SQLSRV_FETCH_ASSOC);
        $UserID = $row['UserID'];
        
        // Store UserID in session
        $_SESSION['UserID'] = $UserID;

        // Store UserID in cookie (serialize it)
        setcookie('UserID', serialize($UserID), time() + 5000, '/');
        
        // Respond with success
        echo json_encode("True");
    } else {
        // Login failed
        echo json_encode("False");
    }

    //////////////////////////////////////////////////////////////////////////////

    // $arr = array();
    // while($row = sqlsrv_fetch_Object($data)){
    //     $arr[] = $row;

    // }
    // //echo json_encode($arr);
    // if (count($arr) > 0){

    //     echo json_encode($arr);

    //     $_SESSION['UserID'] = $arr;

    //     setcookie('UserID', $_SESSION['UserID'], time() + (86400 * 1), '/'); 

    //     echo json_encode("True");
    // }
    // else{
    //     // Login failed
    //     //echo json_encode("Email or Password is incorrect.");
    //     echo json_encode("False");
    // }
}

?>