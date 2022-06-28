<?php
 
 require_once "koneksi.php";
 //dalam kurung kotak menyamakan database
// $nama_pembeli           = $_POST['tname']; 
// $nomor_pembeli          = $_POST['tphone']; 
// $alamat_pembeli         = $_POST['taddress'];
// $email_pembeli          = $_POST['temail'];
// $username_pembeli       = $_POST['tusername'];
// $password_pembeli       = $_POST['tpass'];
// $status_pembeli         = "Belum Aktif";

$nama_pembeli           = "vreag"; 
$nomor_pembeli          = "252"; 
$email_pembeli          = "cdcd";
$alamat_pembeli         = "dddf";
$username_pembeli       = "sdf";
$password_pembeli       = "sfe";
$status_pembeli         = "Belum Aktif";

 
if(!empty($nama_pembeli) && !empty($nomor_pembeli) && !empty($email_pembeli) && 
!empty($alamat_pembeli) && !empty($username_pembeli) && !empty($password_pembeli)){
 
    $sqlCheck = "SELECT COUNT(*) FROM pembeli WHERE username_pembeli='$username_pembeli' OR email_pembeli='$email_pembeli'";
    $queryCheck = mysqli_query($conn,$sqlCheck);
    $hasilCheck = mysqli_fetch_array($queryCheck);
    if($hasilCheck[0] == 0){
        $sql = "INSERT INTO pembeli (nama_pembeli,nomor_pembeli,email_pembeli,alamat_pembeli,status_pembeli,username_pembeli,password_pembeli) VALUES
        ('$nama_pembeli','$nomor_pembeli','$email_pembeli','$alamat_pembeli','$status_pembeli','$username_pembeli','$password_pembeli')";
 
        echo $sql;
        try {
            $query = mysqli_query($conn,$sql);
            if(mysqli_affected_rows($conn) > 0){
                $data['status'] = true;
                $data['result'] = "Berhasil";
            }else{
                $data['status'] = false;
                $data['result'] = "Gagal";
            }
        } catch (\Throwable $th) {
            $data['status'] = false;
            $data['result'] = "Error : ".$th->getMessage();
        }
        
 
        
    }else{
        $data['status'] = false;
        $data['result'] = "Gagal, Data Sudah Ada";
    }
 
     
 
}
else{
    $data['status'] = false;
    $data['result'] = "Gagal,  tidak boleh kosong!";
}
 
echo json_encode($data);
// print_r(json_encode($data));
 
 
 
 
?>