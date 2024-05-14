<?php
require_once("Connection.php");

require "../../vendor/autoload.php";
use \Firebase\JWT\JWT;


if (!isset($_REQUEST["Email"]) || !isset($_REQUEST["Password"])){
    die(print_r("Email or password cannot be empty"));
}	

$Email = $_REQUEST["Email"];
$Password = $_REQUEST["Password"];
$arr = array();
$query = "select UserID ,  UserFirstName + ' ' + UserLastName as UserFullName, UserType, UserPassword  from Users where UserEmail = ?" ;
$param = [$Email];
$result=sqlsrv_query($conn, $query , $param , array("Scrollable" => 'static')) or  die( print_r( sqlsrv_errors(), true)) ;
if (sqlsrv_num_rows($result) ==  0)  {
    $arr['state'] = 'fail';
	$arr['msg'] = 'invalid user name or password';
				  
}
else {
    sqlsrv_fetch($result);
	$UserID = sqlsrv_get_field($result , 0 );
	$UserFullName = sqlsrv_get_field($result , 1);
	$UserType = sqlsrv_get_field($result , 2);
	$UserPassword = sqlsrv_get_field($result , 3);
	if ($UserPassword != $Password){
        // if (!password_verify($password, $user_password)){
		$arr['state'] = 'fail';
		$arr['msg'] = 'invalid user name or password';

	}
	else{
		if ($UserType == "AD" || $UserType == "EM"){
			$secretKey = "123456"; // add your secret key here
			$issuedAt = time();
			$expirationTime = $issuedAt + 3600 * 1; // 1 hours expiration
			$payload = array(
				"UserID" => $UserID,
				"UserFullName" => $UserFullName,
				"Email" => $Email,
				"UserType" => $UserType,
				"iat" => $issuedAt,
				"exp" => $expirationTime
			);
			$jwt = JWT::encode($payload, $secretKey, 'HS256');
			$arr['state'] = 'success';
			$arr['jwt'] = $jwt;
	
			//setcookie('JWT', serialize($jwt), time() + $expirationTime, '/');
			
		}
		else {
			$arr['state'] = 'fail';
			$arr['msg'] = 'invalid UserType';
		}
	}

}

echo json_encode($arr);	
sqlsrv_close($conn);
	

///////////////////////////////

?>