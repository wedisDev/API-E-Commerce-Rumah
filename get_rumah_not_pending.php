<?php

// SET HEADER
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json; charset=UTF-8");

// INCLUDING DATABASE AND MAKING OBJECT
require 'connect_pdo.php';
$db_connection = new Database();
$conn = $db_connection->dbConnection();
if($_POST['ID_PENGGUNA'] != ''){

    $ID_PENGGUNA = $_POST['ID_PENGGUNA'];

    // MAKE SQL QUERY
    // IF GET POSTS ID, THEN SHOW POSTS BY ID OTHERWISE SHOW ALL POSTS
    $query = "SELECT kelurahan.NAMA_KELURAHAN, 
    pengguna.NAMA_PENGGUNA as penjual,pengguna.ID_PENGGUNA as penjual_id, rumah.id, rumah.judul_rumah, rumah.alamat_rumah, rumah.desc_rumah,rumah.harga_rumah,rumah.gambar, penjualan.STATUS_PENJUALAN as status,penjualan.BUKTI_TRANSFER as transfer, pengguna.EMAIL_PENGGUNA as email_penjual
    FROM rumah
    LEFT JOIN kelurahan ON kelurahan.ID_KELURAHAN = rumah.id_kelurahan
    LEFT JOIN pengguna ON pengguna.ID_PENGGUNA = rumah.id_pengguna
    LEFT JOIN penjualan ON penjualan.ID_RUMAH = rumah.id
  where pengguna.ID_PENGGUNA = '$ID_PENGGUNA' AND penjualan.STATUS_PENJUALAN != 'pending'";

    $stmt = $conn->prepare($query);

    $stmt->execute();

    // $result = array_map("unserialize", array_unique(array_map("serialize", $stmt->fetch(PDO::FETCH_ASSOC))));

    //CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
    if($stmt->rowCount() > 0){
    $array = [];
        
        while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
            
            $data = [
                'id' => $row['id'],
                'kelurahan' => $row['NAMA_KELURAHAN'],
                'judul_rumah' => $row['judul_rumah'],
                'alamat_rumah' => $row['alamat_rumah'],
                'desc_rumah' => $row['desc_rumah'],
                'penjual_id' => $row['penjual_id'],
                'penjual' => $row['penjual'],
                'harga_rumah' => $row['harga_rumah'],
                'gambar' => $row['gambar'],
                'transfer' => $row['transfer'],
                'email_penjual' => $row['email_penjual'],                
                'status' => $row['status'] == null ? "pending" : $row['status'],

            ];
            // PUSH POST DATA IN OUR $posts_array ARRAY
            array_push($array, $data);
        }
        $response['data'] = $array;
        //SHOW POST/POSTS IN JSON FORMAT
        echo json_encode($response);

    }
    else{
        //IF THER IS NO POST IN OUR DATABASE
        echo json_encode(['message'=>'No post found']);
    }
}
?>
