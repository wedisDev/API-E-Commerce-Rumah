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

if(isset($_POST['ID_PENGGUNA'])){
	$ID_PENGGUNA = $_POST['ID_PENGGUNA'];
	$NAMA_PENGGUNA = $_POST['NAMA_PENGGUNA'];
	$ALAMAT_PENGGUNA = $_POST['ALAMAT_PENGGUNA'];
	$TELP_PENGGUNA = $_POST['TELP_PENGGUNA'];
	$EMAIL_PENGGUNA = $_POST['EMAIL_PENGGUNA'];
	$USERNAME_PENGGUNA = $_POST['USERNAME_PENGGUNA'];
	$PASS_PENGGUNA = $_POST['PASS_PENGGUNA'];
	$REKENING_PENGGUNA = $_POST['REKENING_PENGGUNA'];

	$update_query = "UPDATE pengguna SET NAMA_PENGGUNA = '$NAMA_PENGGUNA',ALAMAT_PENGGUNA = '$ALAMAT_PENGGUNA',TELP_PENGGUNA = '$TELP_PENGGUNA',EMAIL_PENGGUNA = '$EMAIL_PENGGUNA',USERNAME_PENGGUNA = '$USERNAME_PENGGUNA',PASS_PENGGUNA = '$PASS_PENGGUNA',REKENING_PENGGUNA = '$REKENING_PENGGUNA' WHERE ID_PENGGUNA = '$ID_PENGGUNA'";

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
