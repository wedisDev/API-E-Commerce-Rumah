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

if($_POST['id'] != ''){    
    $id = $_POST['id'];

    // MAKE SQL QUERY
    // IF GET POSTS ID, THEN SHOW POSTS BY ID OTHERWISE SHOW ALL POSTS
    $query = "SELECT * FROM pengguna where ID_PENGGUNA = '$id'";

    $stmt = $conn->prepare($query);

    $stmt->execute();
    $row = $stmt->fetch();

    //CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
    if($stmt->rowCount() > 0){

        $msg['message'] = 'Data ditemukan';
        $msg['data'] = [
             'id' => $row['ID_PENGGUNA'],
                'nama' => $row['NAMA_PENGGUNA'],
                'alamat' => $row['ALAMAT_PENGGUNA'],
                'telp' => $row['TELP_PENGGUNA'],
                'email' => $row['EMAIL_PENGGUNA'],
                'username' => $row['USERNAME_PENGGUNA'],
                'pass' => $row['PASS_PENGGUNA'],
                'rekening' => $row['REKENING_PENGGUNA']
        ];

    }
    else{
        $msg['message'] = 'Data tidak ditemukan';

        //IF THER IS NO POST IN OUR DATABASE
    }
    echo  json_encode($msg);


}
?>
