<?php
session_start();
require_once "../../lib/db.php";

$errors = [];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get and sanitize form data
    $new_plan = sanitize_input($_POST['selected-plan']);

    // Validate input
    if (empty($new_plan)) {
        $errors[] = "Plan selection is required";
    }

    // If no validation errors, proceed with plan upgrade/downgrade
    if (empty($errors)) {
        try {
            // Get user ID from session
            $user_id = $_SESSION['user_id'];
            $to = "f32ee@localhost";
            $subject = "BiblioNook: Plan Change Confirmation";

            $headers = 'From: f32ee@localhost' . "\r\n" .
                'Reply-To: f32ee@localhost' . "\r\n" .
                'X-Mailer: PHP/' . phpversion();
            $headers .= "MIME-Version: 1.0" . "\r\n";
            $headers .= "Content-type: text/html; charset=UTF-8" . "\r\n";

            $message = "Welcome to BiblioNook! \n";
            $message .= "Your plan has been upgraded to $new_plan\n";
            $message .= "Enjoy Reading! \n";
            $message = rtrim($message, "\n");

            mail($to, $subject, $message, $headers);

            // Prepare SQL statement to prevent SQL injection
            $stmt = $db->prepare("UPDATE User SET membership_type = ? WHERE id = ?");
            $stmt->bind_param("si", $new_plan, $user_id);
            $stmt->execute();

            if ($stmt->affected_rows === 1) {
                // Update session with new membership type
                $_SESSION['membership_type'] = $new_plan;

                echo json_encode(['success' => true]);
                exit();
            } else {
                $errors[] = "Failed to change plan";
            }
            $stmt->close();
        } catch (Exception $e) {
            $errors[] = "Plan change failed: " . $e->getMessage();
        }
    }
}

// If there were errors, return them as JSON
if (!empty($errors)) {
    echo json_encode(['success' => false, 'errors' => $errors]);
    exit();
}

function sanitize_input($data)
{
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}
