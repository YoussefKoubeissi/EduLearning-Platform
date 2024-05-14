<?php
require("Connection.php");

$Operation = $_REQUEST["Operation"];
$UserType = $_REQUEST["UserType"];
//$File = $_REQUEST["file"];
//$ImagePath = $_REQUEST["Photo"];

	if ($Operation == 'rmvImg'){
		$id = $_REQUEST["id"];
		$query = "select Photo from TB_User where UserID = $id";
		$result=  sqlsrv_query($conn, $query , array() , array("Scrollable" => "static")) or  die( print_r( sqlsrv_errors(), true)) ; 
		sqlsrv_fetch($result);
        $fileToDelete = sqlsrv_get_field($result , 0);
		if($fileToDelete){
			$query = "update TB_User set Photo = null where UserID = $id";
			$result=  sqlsrv_query($conn, $query , array() , array("Scrollable" => "static")) or  die( print_r( sqlsrv_errors(), true)) ; 
			if (file_exists($fileToDelete)) {
				// Attempt to delete the file
				if (unlink($fileToDelete)) {
					$msg = "File deleted successfully.";
				} else {
					$msg = "Error deleting the file.";
				}
			} else {
				$msg = "File does not exist.";
			}
		}else{
			$msg = "No file to delete";
		}
		echo json_encode($msg);
		return;
	}
	
	if($UserType == "TR"){
		$target_dir = "FolderonServerForImages/TrainersImages/";
	}elseif ($UserType == "TE") {
		$target_dir = "FolderonServerForImages/TraineesImages/";
	}
	
	
	if ($Operation == "New"){
		$arr = [];

		if (($_FILES["file"]["name"]!="")){

			$file = $_FILES["file"]["name"];
			$path = pathinfo($file);
			$filename = $path["filename"];
			$ext = $path["extension"];
			$temp_name = $_FILES["file"]["tmp_name"];
			$path_filename_ext = $target_dir.$filename.".".$ext;

			echo json_encode($temp_name);
			echo json_encode($path_filename_ext);
			
			if (file_exists($path_filename_ext)) {
				$arr['msg'] = "Sorry, file already exists.";
			}
			else{
				move_uploaded_file($temp_name,$path_filename_ext);
				$arr['msg'] = "File Uploaded Successfully";
			}
		}

		echo json_encode($arr);
		// echo json_encode($path_filename_ext);
		
		// $query = "insert into Users (Fields list)  values (values list, ...,  '$path_filename_ext');select SCOPE_IDENTITY()";
			
		// $result = sqlsrv_query($conn, $query , array() , array("Scrollable" => "static")) or  die( print_r( sqlsrv_errors(), true)) ; 
		// sqlsrv_next_result($result);
		// sqlsrv_fetch($result);
        // $id = sqlsrv_get_field($result , 0);
		// $arr['UserID'] = $id;
		// echo json_encode($arr);
		// return;
	}
	else {
        $arr['msg'] = "No file uploaded.";
    }
				
	if ($Operation == "update"){ 
		$arr = [];
		$id = $_REQUEST["id"];

			if (($_FILES["Photo"]["name"]!="")){
				
				$file = $_FILES["Photo"]["name"];
				$path = pathinfo($file);
				$filename = $path["filename"];
				$ext = $path["extension"];
				$temp_name = $_FILES["Photo"]["tmp_name"];
				$path_filename_ext = $target_dir.$filename.".".$ext;
			
				if (file_exists($path_filename_ext)) {
						$arr['msg'] = "Sorry, file already exists.";
				}else{
						move_uploaded_file($temp_name,$path_filename_ext);
						$arr['msg'] = "File Uploaded Successfully";
				}
			}
			if ($path_filename_ext!= ""){
				$query = "update TB_User set ....,  Photo='$path_filename_ext' where UserID = $id";
			}
			else
			{
				$query = "update TB_User set ... where UserID = $id";
			}
		
		$arr['success'] = true;
		sqlsrv_query($conn, $query , array() , array("Scrollable" => "static")) or  die( print_r( sqlsrv_errors(), true)) ; 
		echo json_encode($arr);
	}
					
?>