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
$period = $data['period'] ?? 1;
$membership_type = $_SESSION['membership_type'] ?? 'free';

// Validate inputs
if (!$book_id || !$period) {
    echo json_encode(['success' => false, 'message' => 'Invalid book or period']);
    exit();
}

try {
    // Start transaction
    $db->begin_transaction();

    // Calculate dates
    $borrow_date = date('Y-m-d H:i:s');
    $due_date = date('Y-m-d H:i:s', strtotime("+" . ($period * 7) . " days"));

    // For premium members, check borrowing limits
    if ($membership_type !== 'free') {
        $limit = ($membership_type === 'lite') ? 3 : 10;

        // Count active borrows
        $stmt = $db->prepare("SELECT COUNT(*) as active_books FROM borrowing WHERE user_id = ? AND due_date > UTC_TIMESTAMP()");
        $stmt->bind_param("i", $user_id);
        $stmt->execute();
        $result = $stmt->get_result();
        $active_books = $result->fetch_assoc()['active_books'];

        if ($active_books >= $limit) {
            $db->rollback();
            echo json_encode(['success' => false, 'message' => 'Borrowing limit reached']);
            exit();
        }
    }

    // Insert new borrowing record
    $stmt = $db->prepare("INSERT INTO borrowing (user_id, book_id, borrow_date, due_date) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("iiss", $user_id, $book_id, $borrow_date, $due_date);

    if ($stmt->execute()) {
        $db->commit();
        echo json_encode([
            'success' => true,
            'message' => 'Book borrowed successfully',
            'due_date' => $due_date
        ]);
    } else {
        throw new Exception("Failed to insert borrowing record");
    }

} catch (Exception $e) {
    $db->rollback();
    echo json_encode(['success' => false, 'message' => 'An error occurred']);
}