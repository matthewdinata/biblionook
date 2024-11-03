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
    $name = sanitize_input($_POST['name']);
    $email = sanitize_input($_POST['email']);
    $password = $_POST['password'];
    $confirm_password = $_POST['confirm_password'];
}

$stmt = $db->prepare("SELECT id FROM User WHERE email = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();
if ($result->num_rows > 0) {
    $errors[] = "Email already registered";
}
$stmt->close();

if (empty($errors)) {
    try {
        // Hash password
        $password_hash = password_hash($password, PASSWORD_DEFAULT);
        echo json_encode(array($password_hash));

        // Prepare SQL statement
        $stmt = $db->prepare("INSERT INTO User (email, password_hash, name, created_at, membership_type) VALUES (?, ?, ?, UTC_TIMESTAMP(), 'free')");
        $stmt->bind_param("sss", $email, $password_hash, $name);

        if ($stmt->execute()) {
            // Registration successful
            $_SESSION['user_id'] = $stmt->insert_id;
            $_SESSION['user_name'] = $name;
            $_SESSION['user_email'] = $email;
            $_SESSION['membership_type'] = 'free';

            // Redirect to home page
            header("Location: ../../index.php");
            exit();
        } else {
            $errors[] = "Registration failed: " . $db->error;
        }
        $stmt->close();
    } catch (Exception $e) {
        $errors[] = "Registration failed: " . $e->getMessage();
    }
}

// If there were errors, redirect back with error messages
if (!empty($errors)) {
    $_SESSION['login_errors'] = $errors;
    header("Location: ../../auth.php");
    exit();
}