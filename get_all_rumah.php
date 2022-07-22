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

if(isset($_POST['q'])){
    
    $q = $_POST['q'];

    // MAKE SQL QUERY
    // IF GET POSTS ID, THEN SHOW POSTS BY ID OTHERWISE SHOW ALL POSTS
    $query = "SELECT kelurahan.NAMA_KELURAHAN, pengguna.EMAIL_PENGGUNA as email_penjual,
    pengguna.NAMA_PENGGUNA as penjual,pengguna.ID_PENGGUNA as penjual_id, rumah.id, rumah.judul_rumah, rumah.tgl as tgl, rumah.alamat_rumah, rumah.desc_rumah,rumah.harga_rumah,rumah.gambar, penjualan.STATUS_PENJUALAN as status,penjualan.BUKTI_TRANSFER as transfer, pengguna.REKENING_PENGGUNA as rekening_penjual
    FROM rumah
    LEFT JOIN kelurahan ON kelurahan.ID_KELURAHAN = rumah.id_kelurahan
    LEFT JOIN pengguna ON pengguna.ID_PENGGUNA = rumah.id_pengguna
    LEFT JOIN penjualan ON penjualan.ID_RUMAH = rumah.id
    where rumah.judul_rumah LIKE '%$q%' "; 

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
                'rekening_penjual' => $row['rekening_penjual'],
                'status' => $row['status'] == null ? "pending" : $row['status'],
                'tgl' => $row['tgl'] == null ? "null" : $row['tgl'],
                'email_penjual' => $row['email_penjual']

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
