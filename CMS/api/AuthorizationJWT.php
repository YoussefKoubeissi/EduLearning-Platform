<?php
require_once("Connection.php");

require "../../vendor/autoload.php";

use \Firebase\JWT\JWT;
use Firebase\JWT\Key;


function validateJWT($jwt) {
    $secretKey = "123456"; // Replace with your secret key
    try {
        $decoded = JWT::decode($jwt, new Key($secretKey, 'HS256'));
        return $decoded;
    } catch (Exception $e) {
        return false; // Token validation failed
    }
}

// Assuming you have the JWT from the Authorization header
$receivedJWT = null;
$headers = apache_request_headers();
if (isset($headers['Authorization'])) {
    $receivedJWT = trim(str_replace('Bearer', '', $headers['Authorization']));
}
// $receivedJWT = isset(apache_request_headers()['Authorization']) ? apache_request_headers()['Authorization'] : null;

$decodedToken = validateJWT($receivedJWT);
// Access the payload
$payload = $decodedToken->data ?? $decodedToken; // Try accessing 'data' attribute, fallback to the entire decoded object
// $payload = $decodedToken;

if ($decodedToken) {
    // JWT is valid, proceed with editing the user profile
    // $decodedToken contains the decoded claims
    // Access individual claims in the payload
    $UserID = $payload->UserID ?? null;
    $Email = $payload->Email ?? null;
    $UserFullName = $payload->UserFullName ?? null;
    $arr['state'] = 'success';
	$arr['msg'] = 'Authenticated';
    $arr['UserID'] = $UserID;
    $arr['Email'] = $Email;
    $arr['UserFullName'] = $UserFullName;
} else {
    // Invalid JWT, handle unauthorized access
    $arr['state'] = 'fail';
	$arr['msg'] = 'invalid user name or password';
    
}
echo json_encode($arr);
sqlsrv_close($conn);

?>