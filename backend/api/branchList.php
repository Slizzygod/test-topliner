<?php
    include_once '../config/Database.php';
    include_once '../product/GetBrench.php';

    if($_SERVER['REQUEST_METHOD'] == 'GET') {
        $db = new Database();
        $conn = $db->getConnection();
        $read = new GetBrench($conn);
        echo $read->getBrench();
    }else{
        header("HTTP/1.1 404 Not Found");
        echo "Page is not found";
    }
?>
