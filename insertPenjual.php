<?php
 
 require_once "koneksi.php";
 //dalam kurung kotak menyamakan database
$nama_penjual           = $_POST['tname']; 
$nomor_penjual          = $_POST['tphone']; 
$email_penjual          = $_POST['temail'];
$alamat_penjual         = $_POST['taddress'];
$username_penjual       = $_POST['tusername'];
$password_penjual       = $_POST['tpass'];
$status_penjual         = "Belum Aktif";

// $nama_penjual       = "nadya"; 
// $nomor_penjual      = "252"; 
// $email_penjual      = "cdcd";
// $alamat_penjual    = "dddf";
// $username_penjual       = "sdf";
// $password_penjual       = "sfe";

 
if(!empty($nama_penjual) && !empty($nomor_penjual) && !empty($email_penjual) && 
!empty($alamat_penjual) && !empty($username_penjual) && !empty($password_penjual)){
 
    $sqlCheck = "SELECT COUNT(*) FROM penjual WHERE username_penjual='$username_penjual' OR email_penjual='$email_penjual'";
    $queryCheck = mysqli_query($conn,$sqlCheck);
    $hasilCheck = mysqli_fetch_array($queryCheck);
    if($hasilCheck[0] == 0){
        $sql = "INSERT INTO penjual (nama_penjual,nomor_penjual,email_penjual,alamat_penjual,status_penjual,username_penjual,password_penjual) VALUES
        ('$nama_penjual','$nomor_penjual','$email_penjual','$alamat_penjual','$status_penjual','$username_penjual','$password_penjual')";
 
        $query = mysqli_query($conn,$sql);
 
        if(mysqli_affected_rows($conn) > 0){
            $data['status'] = true;
            $data['result'] = "Berhasil";
        }else{
            $data['status'] = false;
            $data['result'] = "Gagal";
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
 
 
print_r(json_encode($data));
 
 
 
 
?>