<?php

class Database {

    // указываю свои учетные данные БД
    private $host = "localhost";
    private $db_name = "test_arvis";
    private $username = "root";
    private $password = "root";
    public $conn;

    // получаю соединение с БД
    public function getConnection(){

        $this->conn = null;

        try {
            $this->conn = new PDO("mysql:host=" . $this->host . ";dbname=" . $this->db_name, $this->username, $this->password);
            $this->conn->exec("set names utf8");
        } catch(PDOException $exception){
            echo "Connection error: " . $exception->getMessage();
        }

        return $this->conn;
    }
}
?>