<?php
	require_once "koneksi.php";
	
    // $kecamatan            = $_POST['tkec'];
    $kecamatan            = "2";

    $sql = "SELECT * FROM KECAMATAN JOIN KOTA USING (ID_KOTA) WHERE ID_KOTA ='$kecamatan'";
	$obj_query = mysqli_query($conn,$sql);
	$data = mysqli_fetch_assoc($obj_query);
   
    if(!$conn->query($sql)){
        echo 'Gagal';
    }else{
        $result = $conn->query($sql);
        // var_dump($result->fetch_all());
        // while( $row = $result->fetch_all()){
        //     if($result->num_rows > 0){
                // $json['data'] = array();
                //     while( $row = $result->fetch_array()){
                        
                    // array_push($json['data'],array(
                    //     'id_provinsi' => $data[0],
                    //     'nama_provinsi' => $data[1]
                    // ));
                // }
                
                echo json_encode($result->fetch_all());
        //     }
        // }
    }



?>