<?php
session_start();

// Function to safely escape output
function e($string)
{
    return htmlspecialchars($string, ENT_QUOTES, 'UTF-8');
}

require_once "lib/db.php";

$sql = "SELECT * FROM Book WHERE is_featured = 1 LIMIT 5";
$result = $db->query($sql);

$recommended_books = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $recommended_books[] = $row;
    }
}

$sql = "SELECT * FROM Book ORDER BY date_added LIMIT 8";
$result = $db->query($sql);

$new_arrivals = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $new_arrivals[] = $row;
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>BiblioNook - Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <link rel="icon" href="assets/logo.svg" type="image/x-icon" />
    <link rel="stylesheet" href="css/globals.css" />
    <link rel="stylesheet" href="css/components.css" />
    <link rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" href="css/index.css" />
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
        <div class="search-bar">
            <form action="search.php" method="GET">
                <input type="text" id="search-input" name="query" placeholder="Search your favorite books..." />
                <div id="suggestions" class="suggestions"></div>
            </form>
        </div>

        <section class="recommended-section">
            <h3>Recommended For You</h3>
            <div class="book-grid">
                <?php foreach ($recommended_books as $book): ?>
                    <a href='details.php?id=<?= e($book['id']) ?>'>
                        <div class="book-card">
                            <img src="<?= e($book['thumbnail_url']) ?>" alt="<?= e($book['title']) ?>" />
                        </div>
                    </a>
                <?php endforeach; ?>
            </div>
            <div class="carousel">
                <div class="group">
                    <?php foreach ($recommended_books as $book): ?>
                        <a href='details.php?id=<?= e($book['id']) ?>'>
                            <div class="book-card card">
                                <img src="<?= e($book['thumbnail_url']) ?>" alt="<?= e($book['title']) ?>" />
                            </div>
                        </a>
                    <?php endforeach; ?>
                </div>
                <div aria-hidden class="group">
                    <?php foreach ($recommended_books as $book): ?>
                        <a href='details.php?id=<?= e($book['id']) ?>'>
                            <div class="book-card card">
                                <img src="<?= e($book['thumbnail_url']) ?>" alt="<?= e($book['title']) ?>" />
                            </div>
                        </a>
                    <?php endforeach; ?>
                </div>
                <div aria-hidden class="group">
                    <?php foreach ($recommended_books as $book): ?>
                        <a href='details.php?id=<?= e($book['id']) ?>'>
                            <div class="book-card card">
                                <img src="<?= e($book['thumbnail_url']) ?>" alt="<?= e($book['title']) ?>" />
                            </div>
                        </a>
                    <?php endforeach; ?>
                </div>
            </div>
        </section>

        <section class="new-arrivals">
            <h3>New Arrivals</h3>
            <div class="book-table">
                <table>
                    <thead>
                        <tr>
                            <th>Title</th>
                            <th class="author">Author</th>
                            <th class="genre">Genre</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($new_arrivals as $book): ?>
                            <tr>
                                <td>
                                    <img src="<?= e($book['thumbnail_url']) ?>" alt="<?= e($book['title']) ?>"
                                         class="book-cover">
                                    <?= e($book['title']) ?>
                                </td>
                                <td class="author"><?= e($book['author']) ?></td>
                                <td class="genre"><span
                                          class="genre-tag <?= e(strtolower($book['genre'])) ?>"><?= e($book['genre']) ?></span>
                                </td>
                                <td>
                                    <a href='details.php?id=<?= e($book['id']) ?>' class="action-button">View Details</a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
        </section>
    </div>
    <script src="js/index.js"></script>
    <script>
        // Load theme from localStorage
        const savedTheme = localStorage.getItem('theme') || 'light';
        if (savedTheme === 'dark') {
            document.body.classList.add('dark-mode');
            document.documentElement.setAttribute('data-theme', 'dark');
        }

        function toggleTheme() {
            const body = document.body;
            const isDark = body.classList.toggle('dark-mode');
            const theme = isDark ? 'dark' : 'light';

            document.documentElement.setAttribute('data-theme', theme);
            localStorage.setItem('theme', theme);
        }
    </script>
</body>

</html>