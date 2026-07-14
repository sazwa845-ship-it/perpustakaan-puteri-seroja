<?php
// config.php
define('DB_HOST', 'localhost');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'perpustakaanpuetriseroja'); //[cite: 2]

// Establish a secure, reusable connection object
$conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

if ($conn->connect_error) {
    http_response_code(500);
    echo json_encode(["error" => "Open-Source Engine Connection Failed: " . $conn->connect_error]);
    exit();
}
?>