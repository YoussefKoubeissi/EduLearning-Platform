<?php 
     $serverName ="Your server name"; 
     $password = ""; 
     $userId ="";
     $database = "your database name";
     $connectionInfo = array( "Database"=>$database, "UID"=> $userId,  "PWD"=>$password,"CharacterSet" => "UTF-8"); 
     $conn = sqlsrv_connect( $serverName, $connectionInfo);
     if( ! $conn ) { 
          die( print_r( sqlsrv_errors(), true)); 
     }
     /*else {
          echo "Connected successfully."; 
     }*/
?>