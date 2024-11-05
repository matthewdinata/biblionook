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

$sql = "SELECT * FROM Book ORDER BY date_added LIMIT 6";
$result = $db->query($sql);

$new_arrivals = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $book_id = $row['id'];
        $reviews_per_page = 5;
        $offset = 0;
        $sql_reviews = "SELECT r.*, u.name 
                        FROM Review r 
                        LEFT JOIN User u ON r.user_id = u.id 
                        WHERE r.book_id = ? 
                        ORDER BY r.review_date DESC 
                        LIMIT ? OFFSET ?";
        $stmt = $db->prepare($sql_reviews);
        $stmt->bind_param("iii", $book_id, $reviews_per_page, $offset);
        $stmt->execute();
        $result_reviews = $stmt->get_result();
        $reviews = $result_reviews->fetch_all(MYSQLI_ASSOC);
        $stmt->close();

        $row['reviews'] = $reviews;
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
        <div class="background-accent">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 800" preserveAspectRatio="xMinYMin slice">
                <path d="M0,0 L1000,0 Q1000,0 1000,80 L1000,720 Q1000,800 920,800 L80,800 Q0,800 0,720 L0,0 Z"
                      fill="#E5DDD5" fill-opacity="0.7" class="main-accent" />
                <path d="M400,0 L1000,0 L1000,800 L400,800 L400,0" fill="#c7c0a5" fill-opacity="0.25"
                      class="edge-shadow" />
            </svg>
        </div>
        <div class="search-bar">
            <form action="search.php" method="GET">
                <input type="text" id="search-input" name="query" placeholder="Search your favorite books..." />
                <div id="suggestions" class="suggestions"></div>
            </form>
        </div>

        <section class="book-banner">
            <div class="banner-text">
                <?php if (isset($_SESSION["user_name"])): ?>
                    <?php $name_parts = explode(' ', $_SESSION["user_name"]); ?>
                    <h1>Happy Reading, <?= e($name_parts[0]) ?></h1>
                <?php else: ?>
                    <h1>Happy Reading, <br /> BiblioNookers</h1>
                <?php endif; ?>
                <p>
                    Explore our vast collection of books and find your next favorite read.
                    Start your reading journey with BiblioNook today.
                </p>
            </div>
            <dotlottie-player src="https://lottie.host/70c03e01-0a85-4d76-b52a-c97f761a934d/H8bOp7gG3q.json"
                              class="lottie-book" background="transparent" speed="0.3" loop autoplay>
            </dotlottie-player>
        </section>

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
            <div class="book-cards">
                <?php foreach ($new_arrivals as $book): ?>
                    <a href='details.php?id=<?= e($book['id']) ?>'>
                        <div class="book-card-horizontal <?= e(strtolower($book['genre'])) ?>">
                            <div class="book-image">
                                <img src="<?= e($book['thumbnail_url']) ?>" alt="<?= e($book['title']) ?>" />
                            </div>
                            <div class="book-info">
                                <h4><?= e($book['title']) ?></h4>
                                <p class="author">by <?= e($book['author']) ?></p>
                                <div class="genre-badge <?= e(strtolower($book['genre'])) ?>"><?= e($book['genre']) ?></div>
                                <div class="rating">
                                    <?php
                                    $rating = 0;
                                    $review_count = count($book['reviews']);
                                    if ($review_count > 0) {
                                        $total_rating = array_sum(array_column($book['reviews'], 'rating'));
                                        $rating = $total_rating / $review_count;
                                    }
                                    for ($i = 1; $i <= 5; $i++) {
                                        if ($i <= floor($rating)) {
                                            echo '<img src="assets/icons/star-filled.svg" alt="Filled Star" class="star">';
                                        } elseif ($i - $rating <= 0.5) {
                                            echo '<img src="assets/icons/star-half-filled.svg" alt="Half Filled Star" class="star">';
                                        } else {
                                            echo '<img src="assets/icons/star-empty.svg" alt="Empty Star" class="star">';
                                        }
                                    }
                                    ?>
                                </div>
                            </div>
                        </div>
                    </a>
                <?php endforeach; ?>
            </div>
        </section>
    </div>
    <script src="https://unpkg.com/@dotlottie/player-component@2.7.12/dist/dotlottie-player.mjs" type="module"></script>
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