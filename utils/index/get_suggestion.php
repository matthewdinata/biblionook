<?php
require_once "../../lib/db.php";

// Get the search query
$query = isset($_GET['query']) ? $_GET['query'] : '';

if (strlen($query) >= 2) {
    // Prepare the SQL statement
    $sql = "SELECT * FROM Book WHERE title LIKE ? LIMIT 5";
    $stmt = $db->prepare($sql);

    // Execute the query
    $stmt->execute(["%$query%"]);

    // Fetch the results
    $suggestion = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

    // Return the results as JSON
    header('Content-Type: application/json');
    echo json_encode($suggestion);
} else {
    // Return an empty array if the query is too short
    echo json_encode([]);
}