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

$errors = [];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get and sanitize form data
    $email = sanitize_input($_POST['email']);
    $password = $_POST['password']; // Don't sanitize password as it might contain special characters

    // Validate input
    if (empty($email)) {
        $errors[] = "Email is required";
    }
    if (empty($password)) {
        $errors[] = "Password is required";
    }

    // If no validation errors, proceed with login
    if (empty($errors)) {
        try {
            // Prepare SQL statement to prevent SQL injection
            $stmt = $db->prepare("SELECT id, email, password_hash, name, membership_type FROM User WHERE email = ?");
            $stmt->bind_param("s", $email);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows === 1) {
                $user = $result->fetch_assoc();

                // Verify password
                if (password_verify($password, $user['password_hash'])) {
                    // Password is correct, create session
                    $_SESSION['user_id'] = $user['id'];
                    $_SESSION['user_name'] = $user['name'];
                    $_SESSION['user_email'] = $user['email'];
                    $_SESSION['membership_type'] = $user['membership_type'];

                    // Redirect to home page
                    header("Location: ../../index.php");
                    exit();
                } else {
                    $errors[] = "Invalid email or password";
                }
            } else {
                $errors[] = "Invalid email or password";
            }
            $stmt->close();
        } catch (Exception $e) {
            $errors[] = "Login failed: " . $e->getMessage();
        }
    }
}

// If there were errors, store them in session and redirect
if (!empty($errors)) {
    $_SESSION['auth_errors'] = $errors;
    $_SESSION['active_tab'] = 'signin'; // Store the active tab state
    $_SESSION['form_data'] = ['email' => $email];
    header("Location: ../../auth.php");
    exit();
}
