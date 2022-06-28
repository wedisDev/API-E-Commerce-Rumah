<?php
	require_once "koneksi.php";
	
    $kota            = $_POST['tkot'];
    // $kota            = "2";

    $sql = "SELECT * FROM KECAMATAN JOIN KOTA USING (ID_KOTA) WHERE ID_KOTA ='$kota'";
	$obj_query = mysqli_query($conn,$sql);
	$data = mysqli_fetch_assoc($obj_query);
    $result = $conn->query($sql);
    $kecamatan = [];
    
    foreach ($result->fetch_all() as $data) {
        $kecamatan[] = [
            "id_kecamatan" => $data[1],
            "id_kota" => $data[0],
            "nama_kecamatan" => $data[2],
        ];
    }
    
    echo json_encode($kecamatan);
    ?>