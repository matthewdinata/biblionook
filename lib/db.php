<?php

$host = 'localhost';
$user = 'root';
$password = '';
$database = 'biblionook';

// For lab server, use below credentials:
// $host = 'localhost';
// $user = 'f32ee';
// $password = 'f32ee';
// $database = 'biblionook';

// Connect to the database
$db = new mysqli($host, $user, $password, $database);

if ($db->connect_error) {
    die(json_encode(["error" => "Connection failed: " . $conn->connect_error]));
}