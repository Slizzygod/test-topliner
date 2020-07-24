<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

class GetBrench
{
    private $conn;

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    public function getBrench() {
        $sql = "SELECT `id`, `name` FROM `branch`";
        $statement = $this->conn->prepare($sql);
        $statement->execute();
        $result = $statement->fetchAll(PDO::FETCH_ASSOC);
        return json_encode($result);
    }
}