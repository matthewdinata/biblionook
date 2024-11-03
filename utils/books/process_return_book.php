<?php
session_start();
require_once "../../lib/db.php";

header('Content-Type: application/json');

if ($_SERVER["REQUEST_METHOD"] != "POST") {
    echo json_encode(['success' => false, 'message' => 'Invalid request method']);
    exit();
}

// Get the JSON data
$json = file_get_contents('php://input');
$data = json_decode($json, true);

date_default_timezone_set('UTC');

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'message' => 'User not authenticated']);
    exit();
}

$user_id = $_SESSION['user_id'];
$book_id = $data['book_id'] ?? 0;

// Validate inputs
if (!$book_id) {
    echo json_encode(['success' => false, 'message' => 'Invalid book ID']);
    exit();
}

try {
    // Start transaction
    $db->begin_transaction();

    // Update the due date to UTC_TIMESTAMP()
    $stmt = $db->prepare("UPDATE borrowing SET due_date = UTC_TIMESTAMP() WHERE user_id = ? AND book_id = ?");
    $stmt->bind_param("ii", $user_id, $book_id);

    if ($stmt->execute()) {
        $db->commit();
        echo json_encode(['success' => true, 'message' => 'Book returned successfully']);
    } else {
        throw new Exception("Failed to update borrowing record");
    }

} catch (Exception $e) {
    $db->rollback();
    echo json_encode(['success' => false, 'message' => 'An error occurred']);
}
