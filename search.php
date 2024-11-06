<?php
session_start();

// Function to safely escape output
function e($string)
{
    return htmlspecialchars($string, ENT_QUOTES, 'UTF-8');
}

require_once "lib/db.php";

$sql = "SELECT id, title, thumbnail_url, author FROM Book WHERE is_featured = 1 LIMIT 5";
$result = $db->query($sql);

$recommended_books = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $recommended_books[] = $row;
    }
}
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <title>BiblioNook - Search</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <link rel="icon" href="assets/logo.svg" type="image/x-icon" />
    <link rel="stylesheet" href="css/globals.css" />
    <link rel="stylesheet" href="css/components.css" />
    <link rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" href="css/search.css" />
</head>

<body>

    <?php
    require_once 'components/render_navbar.php';
    require_once 'components/render_theme_toggle.php';
    $current_page = basename($_SERVER['PHP_SELF']);
    renderNavbar($current_page);
    renderThemeToggle();
    ?>


    <div class="main-content">
        <div class='main-container'>
            <h2 class="page-title">Explore Books</h2>

            <div class="search-container">
                <div class="search-bar">
                    <div class="input-group">
                        <select class="search-select">
                            <option value="title">Title</option>
                            <option value="author">Author</option>
                            <option value="isbn">ISBN</option>
                        </select>
                        <input type="text" class="search-input" placeholder="Search...">
                    </div>

                    <div class="search-button" />
                </div>
            </div>

            <div class="content-grid">
                <aside class="filters">
                    <div class="filter-section">
                        <details open>
                            <summary class="filter-title">GENRES</summary>
                            <div class="filter-list">
                                <?php
                                $genres = [
                                    'fiction' => 'Fiction',
                                    'mystery' => 'Mystery',
                                    'biographic' => 'Biographic',
                                    'romance' => 'Romance',
                                    'classic' => 'Classic',
                                    'action' => 'Action',
                                    'fantasy' => 'Fantasy',
                                    'thriller' => 'Thriller',
                                    'dystopian' => 'Dystopian',
                                    'horror' => 'Horror'
                                ];

                                foreach ($genres as $value => $label): ?>
                                    <label class="filter-item">
                                        <input type="checkbox" value="<?= e($value) ?>">
                                        <span><?= e($label) ?></span>
                                    </label>
                                <?php endforeach; ?>
                            </div>
                        </details>
                    </div>

                    <div class="filter-section">
                        <details>
                            <summary class="filter-title">AUTHOR</summary>
                            <div class="filter-list">
                                <?php
                                $alphabetical_filters = [
                                    '1' => 'A-E',
                                    '2' => 'F-L',
                                    '3' => 'M-S',
                                    '4' => 'T-Z',
                                ];

                                foreach ($alphabetical_filters as $value => $label): ?>
                                    <label class="filter-item">
                                        <input type="checkbox" value="<?= e($value) ?>">
                                        <span><?= e($label) ?></span>
                                    </label>
                                <?php endforeach; ?>
                            </div>
                        </details>
                    </div>

                    <div class="filter-section">
                        <details>
                            <summary class="filter-title">TITLE</summary>
                            <div class="filter-list">
                                <?php
                                $alphabetical_filters = [
                                    '1' => 'A-E',
                                    '2' => 'F-L',
                                    '3' => 'M-S',
                                    '4' => 'T-Z',
                                ];

                                foreach ($alphabetical_filters as $value => $label): ?>
                                    <label class="filter-item">
                                        <input type="checkbox" value="<?= e($value) ?>">
                                        <span><?= e($label) ?></span>
                                    </label>
                                <?php endforeach; ?>
                            </div>
                        </details>
                    </div>
                </aside>

                <section class="results">
                    <div class="results-header">
                        <button class="sort-button" data-sort="none">
                            DATE
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round" class="sort-icon">
                                <path d="M6 9l6 6 6-6" />
                            </svg>
                        </button>
                    </div>

                    <div class="books-grid">
                        <?php foreach ($recommended_books as $book): ?>
                            <a class="book-card featured" href='details.php?id=<?= e($book['id']) ?>'>
                                <div class="book-cover">
                                    <img src="<?= e($book['thumbnail_url']) ?>" alt="<?= e($book['title']) ?>" />
                                </div>
                                <h3 class="book-title"><?= e($book['title']) ?></h3>
                                <p class="book-author"><?= e($book['author']) ?></p>
                            </a>
                        <?php endforeach; ?>
                    </div>

                    <div class="pagination">
                        <button class="pagination-button" disabled>&lt;</button>
                        <span class="pagination-text">1 of 1</span>
                        <button class="pagination-button" disabled>&gt;</button>
                    </div>
                </section>
            </div>
        </div>
    </div>
    <script src="js/search.js"></script>
</body>

</html>