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

    // MAKE SQL QUERY
    // IF GET POSTS ID, THEN SHOW POSTS BY ID OTHERWISE SHOW ALL POSTS
    $query = "SELECT a.NAMA_KELURAHAN, 
    b.NAMA_PENGGUNA as penjual,b.ID_PENGGUNA as penjual_id, rumah.id, rumah.judul_rumah, rumah.alamat_rumah, rumah.desc_rumah,rumah.harga_rumah,rumah.gambar, c.STATUS_PENJUALAN as status,c.BUKTI_TRANSFER as transfer, b.EMAIL_PENGGUNA as email_penjual, rumah.tgl as tgl, d.NAMA_PENGGUNA as nama_pembeli, d.ID_PENGGUNA as id_pembeli 
    FROM rumah
    LEFT JOIN kelurahan a ON a.ID_KELURAHAN = rumah.id_kelurahan
    LEFT JOIN pengguna b ON b.ID_PENGGUNA = rumah.id_pengguna
    LEFT JOIN penjualan c ON c.ID_RUMAH = rumah.id 
    LEFT JOIN pengguna d ON d.ID_PENGGUNA = c.ID_PENGGUNA"; 

    $stmt = $conn->prepare($query);

    $stmt->execute();

    //CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
    if($stmt->rowCount() > 0){
        
        // CREATE POSTS ARRAY
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
                'id_pembeli' =>$row['id_pembeli'],
                'pembeli' =>$row['nama_pembeli'],
                'status' =>$row['status']

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

?>
