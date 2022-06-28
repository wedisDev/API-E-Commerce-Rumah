<?php
 
 require_once "koneksi.php";
 //dalam kurung kotak menyamakan database
$nama_pengguna              = $_POST['tname']; 
$telp_pengguna              = $_POST['tphone']; 
$alamat_pengguna            = $_POST['taddress'];
$email_pengguna              = $_POST['temail'];
$username_pengguna          = $_POST['tusername'];
$pass_pengguna              = $_POST['tpass'];
$status_pengguna            = "Belum Aktif";
$rekening_pengguna          = $_POST['trek'];
$role_pengguna              = $_POST['trole'];

// $nama_pengguna              = "Nina"; 
// $telp_pengguna              = "81295542444"; 
// $alamat_pengguna            = "Rungkut";
// $email_pengguna             = "Nina@msn.com";
// $username_pengguna          = "Ninaninu";
// $pass_pengguna              = "123";
// $status_pengguna            = "Belum Aktif";
// $rekening_pengguna          = "564789312";
// $role_pengguna              = "3";

 
if(!empty($nama_pengguna) && !empty($telp_pengguna) && !empty($alamat_pengguna) && 
!empty($email_pengguna) && !empty($username_pengguna) && !empty($pass_pengguna) && !empty($role_pengguna)){
 
    $sqlCheck = "SELECT COUNT(*) FROM PENGGUNA WHERE username_pengguna='$username_pengguna'";
    $queryCheck = mysqli_query($conn,$sqlCheck);
    $hasilCheck = mysqli_fetch_array($queryCheck);
    $hash = password_hash($pass_pengguna, 
          PASSWORD_DEFAULT);
    if($hasilCheck[0] == 0){
        $sql = "INSERT INTO PENGGUNA (role_pengguna,nama_pengguna,telp_pengguna,alamat_pengguna,email_pengguna,username_pengguna,pass_pengguna,status_pengguna,rekening_pengguna) VALUES
        ('$role_pengguna','$nama_pengguna','$telp_pengguna','$alamat_pengguna','$email_pengguna','$username_pengguna','$hash','$status_pengguna','$rekening_pengguna')";
        
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