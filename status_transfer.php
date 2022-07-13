<?php
// SET HEADER
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: PUT");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// INCLUDING DATABASE AND MAKING OBJECT
require 'connect_pdo.php';
// date_default_timezone_set ("Asia/Jakarta");
$db_connection = new Database();
$conn = $db_connection->dbConnection();

$msg['message'] = '';

if(isset($_POST['id']) && isset($_POST['status'])){
	$id = $_POST['id'];
	$status = $_POST['status'];


	$array = explode('.',$_FILES['gambar']['name']);
    $file_ext=strtolower(end($array));         
    $filename = md5(rand()) . '.' . $file_ext;      
    $tempname = $_FILES["gambar"]["tmp_name"];
    $folder = "images/" . $filename;


	$update_query = "UPDATE penjualan SET STATUS_PENJUALAN = '$status' , BUKTI_TRANSFER = '$filename' WHERE ID_RUMAH = '$id'";
    move_uploaded_file($tempname, $folder);
		$update_stmt = $conn->prepare($update_query);
		if($update_stmt->execute()){
			$msg['message'] = 'OK';
    	}else{
    		$msg['message'] = 'Data Not Updated';
    	}
}else{
	$msg['message'] = 'param tidak boleh kosong';
}
echo  json_encode($msg);
?>
