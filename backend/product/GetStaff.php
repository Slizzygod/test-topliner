<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

class GetStaff
{
    private $conn;

    public function __construct($conn)
    {
        $this->conn = $conn;
    }

    public function getStaff($id)
    {
        $sql = "SELECT * FROM `branch`, `staff` WHERE branch.id =:id AND staff.id_branch = :id ORDER BY staff.fio";
        $statement = $this->conn->prepare($sql);
        $statement->bindValue(':id', $id);
        $statement->execute();
        $result = $statement->fetchAll(PDO::FETCH_ASSOC);
        return json_encode($result);
    }
}