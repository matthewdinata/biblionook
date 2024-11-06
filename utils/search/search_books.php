<?php
header('Content-Type: application/json');
require_once "../../lib/db.php";

function sanitizeInput($input)
{
    return htmlspecialchars(trim($input), ENT_QUOTES, 'UTF-8');
}

// Get search parameters
$searchType = isset($_GET['type']) ? sanitizeInput($_GET['type']) : 'title';
$searchQuery = isset($_GET['query']) ? sanitizeInput($_GET['query']) : '';
$page = isset($_GET['page']) ? (int) $_GET['page'] : 1;
$itemsPerPage = 10;
$offset = ($page - 1) * $itemsPerPage;

// Get filter parameters
$genres = !empty($_GET['genres']) ? explode(',', $_GET['genres']) : [];
$authorRanges = !empty($_GET['authorRanges']) ? explode(',', $_GET['authorRanges']) : [];
$titleRanges = !empty($_GET['titleRanges']) ? explode(',', $_GET['titleRanges']) : [];

// Base query
$baseQuery = "SELECT id, title, author, isbn, genre, thumbnail_url, date_added FROM Book";
$countQuery = "SELECT COUNT(*) as total FROM Book";
$whereConditions = [];

$params = [];
$types = "";

// Add search conditions based on search type
if ($searchQuery !== '') {
    switch ($searchType) {
        case 'author':
            $whereConditions[] = "author LIKE ?";
            $params[] = "%{$searchQuery}%";
            $types .= "s";
            break;
        case 'title':
            $whereConditions[] = "title LIKE ?";
            $params[] = "%{$searchQuery}%";
            $types .= "s";
            break;
        case 'isbn':
            $whereConditions[] = "isbn LIKE ?";
            $params[] = "%{$searchQuery}%";
            $types .= "s";
            break;
    }
}

// Add genre filters
if (!empty($genres)) {
    $genrePlaceholders = str_repeat('?,', count($genres) - 1) . '?';
    $whereConditions[] = "genre IN ($genrePlaceholders)";
    foreach ($genres as $genre) {
        $params[] = $genre;
        $types .= "s";
    }
}

// Add author range filters
if (!empty($authorRanges)) {
    $authorConditions = [];
    foreach ($authorRanges as $range) {
        switch ($range) {
            case '1':
                $authorConditions[] = "(author >= 'A' AND author <= 'E')";
                break;
            case '2':
                $authorConditions[] = "(author >= 'F' AND author <= 'L')";
                break;
            case '3':
                $authorConditions[] = "(author >= 'M' AND author <= 'S')";
                break;
            case '4':
                $authorConditions[] = "(author >= 'T' AND author <= 'Z')";
                break;
        }
    }
    if (!empty($authorConditions)) {
        $whereConditions[] = "(" . implode(" OR ", $authorConditions) . ")";
    }
}

// Add title range filters
if (!empty($titleRanges)) {
    $titleConditions = [];
    foreach ($titleRanges as $range) {
        switch ($range) {
            case '1':
                $titleConditions[] = "(title >= 'A' AND title <= 'E')";
                break;
            case '2':
                $titleConditions[] = "(title >= 'F' AND title <= 'L')";
                break;
            case '3':
                $titleConditions[] = "(title >= 'M' AND title <= 'S')";
                break;
            case '4':
                $titleConditions[] = "(title >= 'T' AND title <= 'Z')";
                break;
        }
    }
    if (!empty($titleConditions)) {
        $whereConditions[] = "(" . implode(" OR ", $titleConditions) . ")";
    }
}

// Combine all conditions
$whereClause = !empty($whereConditions) ? " WHERE " . implode(" AND ", $whereConditions) : "";

$sortOrder = isset($_GET['sort']) ? sanitizeInput($_GET['sort']) : 'none';
$orderClause = "";
if ($sortOrder !== 'none') {
    $orderClause = " ORDER BY date_added " . ($sortOrder === 'asc' ? 'ASC' : 'DESC');
}

// Add pagination
$query = $baseQuery . $whereClause . $orderClause . " LIMIT ? OFFSET ?";
$params[] = $itemsPerPage;
$params[] = $offset;
$types .= "ii";

// Prepare and execute the main query
$stmt = $db->prepare($query);
if (!empty($params)) {
    $stmt->bind_param($types, ...$params);
}
$stmt->execute();
$result = $stmt->get_result();

// Get total count for pagination
$countStmt = $db->prepare($countQuery . $whereClause);
if (!empty($params)) {
    // Remove the last two parameters (LIMIT and OFFSET)
    array_splice($params, -2);
    $countStmt->bind_param(substr($types, 0, -2), ...$params);
}
$countStmt->execute();
$totalCount = $countStmt->get_result()->fetch_assoc()['total'];

// Format results
$books = [];
while ($row = $result->fetch_assoc()) {
    $books[] = [
        'id' => $row['id'],
        'title' => $row['title'],
        'author' => $row['author'],
        'isbn' => $row['isbn'],
        'genre' => $row['genre'],
        'thumbnail_url' => $row['thumbnail_url']
    ];
}

// Return response
echo json_encode([
    'books' => $books,
    'total' => $totalCount,
    'totalPages' => ceil($totalCount / $itemsPerPage),
    'currentPage' => $page
]);

$stmt->close();
$countStmt->close();
$db->close();