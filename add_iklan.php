<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require 'connect_pdo.php';
$db_connection = new Database();
$conn = $db_connection->dbConnection();
date_default_timezone_set ("Asia/Jakarta");

$msg =[];

if(isset($_POST['id_kelurahan']) && isset($_POST['id_kelurahan']) && isset($_POST['judul_rumah'])){
    if(!empty($_POST['id_kelurahan']) && !empty($_POST['id_kelurahan']) ){


        $array = explode('.',$_FILES['gambar']['name']);
        $file_ext=strtolower(end($array));         
        $filename = md5(rand()) . '.' . $file_ext;      
        $tempname = $_FILES["gambar"]["tmp_name"];


        $folder = "images/" . $filename;
        $tgl = date('Y-m-d');
        $id_kelurahan = $_POST['id_kelurahan'];
        $id_pengguna = $_POST['id_pengguna'];
        $judul_rumah = $_POST['judul_rumah'];
        $alamat_rumah = $_POST['alamat_rumah'];
        $desc_rumah = $_POST['desc_rumah'];
        $harga_rumah = $_POST['harga_rumah'];

        $insert_query = "INSERT INTO rumah (id_kelurahan,id_pengguna,judul_rumah,gambar,alamat_rumah,desc_rumah,harga_rumah,tgl) VALUES(:id_kelurahan,:id_pengguna,:judul_rumah,:gambar,:alamat_rumah,:desc_rumah,:harga_rumah,:tgl)";
        
        $stmt = $conn->prepare($insert_query);

        $stmt->bindValue(":id_kelurahan",$id_kelurahan,  PDO::PARAM_INT);
        $stmt->bindValue(":id_pengguna",$id_pengguna,  PDO::PARAM_INT);
        $stmt->bindValue(":judul_rumah",$judul_rumah);
        $stmt->bindValue(":gambar",$filename);
        $stmt->bindValue(":alamat_rumah",$alamat_rumah);
        $stmt->bindValue(":desc_rumah",$desc_rumah);
        $stmt->bindValue(":harga_rumah",$harga_rumah);
        $stmt->bindValue(":tgl",$tgl);

        move_uploaded_file($tempname, $folder);


        $run=$stmt->execute();

        if($run){
            $msg['message'] = 'Data Inserted Successfully';
            $msg['success'] = true;
        }
        else{
            $msg['message'] = 'Data not Inserted';
        } 
        
    }else{
        $msg['message'] = 'Oops! empty field detected. Please fill all the fields';
    }
}
else{
    $msg['message'] = 'Please fill all the fields';
}

echo  json_encode($msg);
?>
