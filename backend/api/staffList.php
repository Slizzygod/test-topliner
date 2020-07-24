<?php
    include_once '../config/Database.php';
    include_once '../product/GetStaff.php';

    if($_SERVER['REQUEST_METHOD'] == 'GET'){
        $id = htmlspecialchars($_GET['id']);

        $db = new Database();
        $conn = $db->getConnection();
        $read = new GetStaff($conn);

        if(!empty($id)){
            header('HTTP/1.1 200 Success');
            echo $read->GetStaff($id);
        }else{
            header("HTTP/1.1 404 Not Found");
            echo "Page is not found";
        }
    }else{
        header("HTTP/1.1 404 Not Found");
        echo "Page is not found";
    }
?>
