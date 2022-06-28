<?php
	require_once "koneksi.php";
	
    // $sql = "SELECT * FROM PROVINSI";
	// $obj_query = mysqli_query($conn,$sql);
	// $data = mysqli_fetch_assoc($obj_query);
    
    // if(!$conn->query($sql)){
    //     echo 'Gagal';
    // }else{
    //     $result = $conn->query($sql);
           
    //     //  echo json_encode($result->fetch_all());

    //      $json['data'] = $result->fetch_assoc();
    //      echo json_encode($json);
            
    // }



    $sql = "SELECT * FROM PROVINSI";
    if(!$conn->query($sql)){
            echo 'Gagal';
        }else{
            $result = $conn->$query($sql);
            if($result->num_rows > 0){
                $json['data'] = array();
                    while( $row = $result->fetch_array()){
                    
                    array_push($json['data'],array(
                        'id_provinsi' => $row[id_provinsi],
                        'nama_provinsi' => $row[nama_provinsi]
                    ));
                }
            echo json_encode($json);
        }
        }
    
            

?>