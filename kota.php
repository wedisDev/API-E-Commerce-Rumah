<?php
	require_once "koneksi.php";
	
    $provinsi            = $_POST['tprov'];

    // $provinsi            = "2";

    $sql = "SELECT * FROM KOTA JOIN PROVINSI USING (ID_PROVINSI) WHERE ID_PROVINSI ='$provinsi'";
	$obj_query = mysqli_query($conn,$sql);
	$data = mysqli_fetch_assoc($obj_query);
    $result = $conn->query($sql);
    $kota = [];
    
    foreach ($result->fetch_all() as $data) {
        $kota[] = [
            "id_kota" => $data[1],
            "id_provinsi" => $data[0],
            "nama_kota" => $data[2],
        ];
    }
    
    echo json_encode($kota);
    ?>