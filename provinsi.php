<?php
require_once "koneksi.php";

$sql = "SELECT * FROM PROVINSI";
$obj_query = mysqli_query($conn, $sql);
$data = mysqli_fetch_assoc($obj_query);
$result = $conn->query($sql);
$provinsi = [];

foreach ($result->fetch_all() as $data) {
    $provinsi[] = [
        "id_provinsi" => $data[0],
        "nama_provinsi" => $data[1],
    ];
}

echo json_encode($provinsi);
?>