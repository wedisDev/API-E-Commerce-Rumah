<?php
require_once "koneksi.php";

// $sql = "SELECT * FROM PROVINSI";
// $obj_query = mysqli_query($conn, $sql);
// $data = mysqli_fetch_assoc($obj_query);
// $result = $conn->query($sql);
// $provinsi = [];



// foreach ($result->fetch_all() as $data) {
//     $provinsi[] = [
//         "id_provinsi" => $data[0],
//         "nama_provinsi" => $data[1],
//     ];
// }

// echo json_encode($provinsi);


$sql = "select * from KECAMATAN";
if(!$conn->query($sql)){
    echo "Error in connecting to Database.";
}
else{
    $result = $conn->query($sql);
    if($result->num_rows > 0){
        $return_arr['KECAMATAN'] = array();
        while($row = $result->fetch_array()){
            array_push($return_arr['KECAMATAN'], array(
                'ID_KECAMATAN'=>$row['ID_KECAMATAN'],
                'NAMA_KECAMATAN'=>$row['NAMA_KECAMATAN']
            ));
        }
        echo json_encode($return_arr);
    }
}


?>