<?php
	require_once "koneksi.php";
	
    $kecamatan            = $_POST['tkec'];
    // $kecamatan            = "7";

    $sql = "SELECT * FROM KELURAHAN JOIN KECAMATAN USING (ID_KECAMATAN) WHERE ID_KECAMATAN ='$kecamatan'";
	$obj_query = mysqli_query($conn,$sql);
	$data = mysqli_fetch_assoc($obj_query);
    $result = $conn->query($sql);
    $kelurahan = [];
    
    foreach ($result->fetch_all() as $data) {
        $kelurahan[] = [
            "id_kelurahan" => $data[1],
            "id_kecamatan" => $data[0],
            "nama_kelurahan" => $data[2],
        ];
    }
    
    echo json_encode($kelurahan);
    ?>