<?php
// api.php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    exit(0);
}

require_once 'config.php';

$method = $_SERVER['REQUEST_METHOD'];
$entity = isset($_GET['entity']) ? $_GET['entity'] : 'book';

// Basic security whitelist for open-source safety
$allowed_entities = ['book', 'borrow', 'fine', 'genre', 'library_staff', 'member_user', 'supplier'];
if (!in_array($entity, $allowed_entities)) {
    // Gracefully map frontend table names back to SQL names containing characters like slashes
    if ($entity === 'member_user') {
        $table = '`member/user`'; //[cite: 2]
    } else {
        http_response_code(400);
        echo json_encode(["error" => "Invalid entity request."]);
        exit();
    }
} else {
    $table = $entity;
}

// Dynamically resolve Primary Key columns depending on target entity schemas
$pk_map = [
    'book' => 'Item_ID', 'borrow' => 'Borrow_ID', 'fine' => 'Fine_ID',
    'genre' => 'Genre_ID', 'library_staff' => 'Staff_ID', 
    'member_user' => 'Member_ID', 'supplier' => 'Supplier_ID'
]; //[cite: 1, 2]
$pk_field = $pk_map[$entity];

switch ($method) {
    case 'GET':
        $result = $conn->query("SELECT * FROM $table");
        $records = [];
        while ($row = $result->fetch_assoc()) {
            $records[] = $row;
        }
        echo json_encode($records);
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"), true);
        if (!$data) {
            echo json_encode(["success" => false, "error" => "No input payload provided"]);
            exit();
        }

        $is_update = isset($data['__is_update']) && $data['__is_update'] === true;
        unset($data['__is_update']); // Clean internal flags

        $fields = [];
        $values = [];
        $updates = [];
        $pk_value = $conn->real_escape_string($data[$pk_field]);

        foreach ($data as $key => $val) {
            $escaped_val = ($val === null || $val === '') ? "NULL" : "'" . $conn->real_escape_string($val) . "'";
            $fields[] = "`$key`";
            $values[] = $escaped_val;
            if ($key !== $pk_field) {
                $updates[] = "`$key`" . " = " . $escaped_val;
            }
        }

        if ($is_update) {
            // Edit the record dynamically in phpMyAdmin
            $sql = "UPDATE $table SET " . implode(', ', $updates) . " WHERE `$pk_field` = '$pk_value'";
        } else {
            // Create a completely new entry record
            $sql = "INSERT INTO $table (" . implode(', ', $fields) . ") VALUES (" . implode(', ', $values) . ")";
        }

        if ($conn->query($sql)) {
            echo json_encode(["success" => true]);
        } else {
            echo json_encode(["success" => false, "error" => $conn->error]);
        }
        break;

    case 'DELETE':
        $data = json_decode(file_get_contents("php://input"), true);
        $pk_value = $conn->real_escape_string($data[$pk_field]);

        $sql = "DELETE FROM $table WHERE `$pk_field` = '$pk_value'";
        if ($conn->query($sql)) {
            echo json_encode(["success" => true]);
        } else {
            echo json_encode(["success" => false, "error" => $conn->error]);
        }
        break;
}

$conn->close();
?>