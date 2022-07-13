<?php
// SET HEADER
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// INCLUDING DATABASE AND MAKING OBJECT
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;


require 'connect_pdo.php';
require 'phpmailer/src/Exception.php';
require 'phpmailer/src/PHPMailer.php';
require 'phpmailer/src/SMTP.php';
$db_connection = new Database();
$conn = $db_connection->dbConnection();
date_default_timezone_set ("Asia/Jakarta");

// GET DATA FORM REQUEST
// $data = json_decode(file_get_contents("php://input"));

//CREATE MESSAGE ARRAY AND SET EMPTY
$msg =[];

if(isset($_POST['ID_PENGGUNA']) && isset($_POST['ID_RUMAH'])){

    if(!empty($_POST['ID_PENGGUNA']) && !empty($_POST['ID_RUMAH'])){

        $ID_RUMAH = $_POST['ID_RUMAH'];
        $ID_PENGGUNA = $_POST['ID_PENGGUNA'];

        $date = date('Y-m-d');
        $status = 'pending';

        $queryCheckUser = "SELECT * from penjualan WHERE ID_RUMAH = '$ID_RUMAH' && ID_PENGGUNA = '$ID_PENGGUNA' " ;
        $stmt = $conn->prepare($queryCheckUser);
        $stmt->execute();

        if($stmt->rowCount() > 0){ 
            $msg['message'] = 'Data is already';
        }else{
          //source send mail (https://www.youtube.com/watch?v=9tD8lA9foxw)    
          $to = $_POST['EMAIL_PENJUAL'];
          $mail = new PHPMailer(true);

          $mail->isSMTP();
          $mail->Host = 'smtp.gmail.com';
          $mail->SMTPAuth = true;
          $mail->Username = 'email'; 
          $mail->Password = 'password'; 
          $mail->SMTPSecure = 'ssl';
          $mail->Port = 465;

          $mail->setFrom('email'); // Your gmail

          $mail->addAddress($to);

          $mail->isHTML(true);

          $mail->Subject = "ada pesanan baru";
          $mail->Body = "---";

          $mail->send();


       $insert_query = "INSERT INTO penjualan (ID_RUMAH, TANGGAL_PENJUALAN,STATUS_PENJUALAN, ID_PENGGUNA) VALUES(:ID_RUMAH,:date,:status,:ID_PENGGUNA)";

        $insert_stmt = $conn->prepare($insert_query);
        // DATA BINDING
        $insert_stmt->bindValue(':ID_RUMAH', htmlspecialchars(strip_tags($ID_RUMAH)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':date', htmlspecialchars(strip_tags($date)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':status', htmlspecialchars(strip_tags($status)),PDO::PARAM_STR);
        $insert_stmt->bindValue(':ID_PENGGUNA', htmlspecialchars(strip_tags($ID_PENGGUNA)),PDO::PARAM_STR);
    
        if($insert_stmt->execute()){
            $msg['message'] = 'OK';  
            }else{
            $msg['message'] = 'Data not Inserted';
        } 
        }
        
    }else{
        $msg['message'] = 'Oops! empty field detected. Please fill all the fields';
    }
}
else{
    $msg['message'] = 'Please fill all the fields';
}
//ECHO DATA IN JSON FORMAT
echo  json_encode($msg);
?>

