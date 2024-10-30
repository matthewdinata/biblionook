<?php
session_start();
require_once "../../lib/db.php";

function sanitize_input($data)
{
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

// Set JSON response headers
header('Content-Type: application/json');

// Initialize response array
$response = [
    'success' => false,
    'message' => '',
    'review_id' => null
];

$errors = [];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Check if user is logged in
    if (!isset($_SESSION['user_id'])) {
        $errors[] = "You must be logged in to submit a review";
    } else {
        // Get and sanitize form data
        $rating = isset($_POST['rating']) ? (int) $_POST['rating'] : 0;
        $title = isset($_POST['reviewTitle']) ? sanitize_input($_POST['reviewTitle']) : '';
        $content = isset($_POST['reviewContent']) ? sanitize_input($_POST['reviewContent']) : '';
        $book_id = isset($_POST['book_id']) ? (int) $_POST['book_id'] : 0;
        $user_id = $_SESSION['user_id'];

        // Validate rating (1-5 stars)
        if (!$rating || $rating < 1 || $rating > 5) {
            $errors[] = "Please select a rating";
        }

        // Validate review title
        if (empty($title)) {
            $errors[] = "Review title is required";
        } elseif (strlen($title) < 3) {
            $errors[] = "Title must be at least 3 characters long";
        } elseif (strlen($title) > 100) {
            $errors[] = "Title must be less than 100 characters";
        }

        // Validate review content
        if (empty($content)) {
            $errors[] = "Review content is required";
        } elseif (strlen($content) < 10) {
            $errors[] = "Review must be at least 10 characters long";
        } elseif (strlen($content) > 1000) {
            $errors[] = "Review must be less than 1000 characters";
        }

        // Validate book_id
        if ($book_id <= 0) {
            $errors[] = "Invalid book selected";
        }

        // If no validation errors, proceed with review submission
        if (empty($errors)) {
            try {
                // Check if user has already reviewed this book
                $check_stmt = $db->prepare("SELECT id FROM Review WHERE user_id = ? AND book_id = ?");
                $check_stmt->bind_param("ii", $user_id, $book_id);
                $check_stmt->execute();
                $existing_review = $check_stmt->get_result();

                if ($existing_review->num_rows > 0) {
                    $errors[] = "You have already reviewed this book";
                } else {
                    // Check if user has borrowed the book
                    $borrow_stmt = $db->prepare("SELECT id FROM Borrowing WHERE user_id = ? AND book_id = ?");
                    $borrow_stmt->bind_param("ii", $user_id, $book_id);
                    $borrow_stmt->execute();
                    $borrow_result = $borrow_stmt->get_result();

                    if ($borrow_result->num_rows === 0) {
                        $errors[] = "You can only review books you have borrowed";
                    } else {
                        // Insert the review
                        $stmt = $db->prepare("
                            INSERT INTO Review (
                                user_id, 
                                book_id, 
                                rating, 
                                title, 
                                content, 
                                review_date
                            ) VALUES (?, ?, ?, ?, ?, NOW())
                        ");

                        $stmt->bind_param(
                            "iiiss",
                            $user_id,
                            $book_id,
                            $rating,
                            $title,
                            $content
                        );

                        if ($stmt->execute()) {
                            $response['success'] = true;
                            $response['message'] = 'Review submitted successfully';
                            $response['review_id'] = $stmt->insert_id;
                        } else {
                            $errors[] = "Failed to submit review. Please try again.";
                        }
                        $stmt->close();
                    }
                    $borrow_stmt->close();
                }
                $check_stmt->close();
            } catch (Exception $e) {
                $errors[] = "An error occurred while submitting your review. Please try again.";
                error_log("Review submission error: " . $e->getMessage());
            }
        }
    }
}

// If there were errors, add them to response
if (!empty($errors)) {
    http_response_code(400);
    $response['message'] = implode(', ', $errors);
}

// Send JSON response
echo json_encode($response);
exit();