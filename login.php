<?php
	require_once "koneksi.php";
	
	
	#data yang diperoleh dari method POST
	$username         = $_POST['usernameKey'];
	$pass             = $_POST['passwordKey'];


	// $username         = "Nggaw";
	// $pass             = "123";
	
	#query utk menampilkan data penjual
	$sql = "SELECT * FROM PENGGUNA 	WHERE username_pengguna = '$username' 
			AND pass_pengguna = '$pass'";
	$obj_query = mysqli_query($conn,$sql);
	$data = mysqli_fetch_row($obj_query);
	
	// var_dump($data);
	
	if($data == null){
		echo json_encode([
			'status' => "Gagal"
		]);
	} else {
		if($data[0] != 0 ){
			$json = array(
				'status' => "Berhasil",
				"data" => [
					'idPengguna' => $data[0],
					'userPengguna' => $data[7],
					'passPengguna' => $data[8],
					'role' => $data[2]
				]
			);
		}
		
		echo json_encode($json);
	}

?>