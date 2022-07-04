<?php
	require_once "koneksi.php";
	
    // $provinsi            = $_POST['tprov'];

    // $provinsi            = "2";

    // $sql = "SELECT * FROM KELURAHAN JOIN KECAMATAN USING (ID_KECAMATAN) WHERE ID_KECAMATAN ='$provinsi'";
	// $obj_query = mysqli_query($conn,$sql);
	// $data = mysqli_fetch_assoc($obj_query);
    // $result = $conn->query($sql);
    // $kelurahan = [];
    
    // foreach ($result->fetch_all() as $data) {
    //     $kelurahan[] = [
    //         "id_kelurahan" => $data[1],
    //         "id_kecamatan" => $data[0],
    //         "nama_kelurahan" => $data[2],
    //     ];
    // }
    
    // echo json_encode($kelurahan);

    if(isset($_GET['NAMA_KECAMATAN'])){
        $sql = "select ID_KELURAHAN, NAMA_KELURAHAN from KELURAHAN where ID_KECAMATAN=
        (select ID_KECAMATAN from KECAMATAN where NAMA_KECAMATAN='".$_GET['NAMA_KECAMATAN']."')";
        if(!$conn->query($sql)){
            echo "Error in executing query.";
        }else{
            $result = $conn->query($sql);
            if($result->num_rows > 0){
                $return_arr['KELURAHAN'] = array();
                while($row = $result->fetch_array()){
                    array_push($return_arr['KELURAHAN'], array(
                        'ID_KELURAHAN'=>$row['ID_KELURAHAN'],
                        'NAMA_KELURAHAN'=>$row['NAMA_KELURAHAN']
                    ));
                }
                echo json_encode($return_arr);
            }
        }
    }
    ?>