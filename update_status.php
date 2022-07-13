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

	$update_query = "UPDATE penjualan SET STATUS_PENJUALAN = '$status' WHERE ID_RUMAH = '$id'";

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
