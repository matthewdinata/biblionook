<?php

// Function to safely escape output
function e($string)
{
    return htmlspecialchars($string, ENT_QUOTES, 'UTF-8');
}

// TODO: fix logic
require_once "lib/db.php";

$book_id = isset($_GET['id']) ? intval($_GET['id']) : 0;

if ($book_id > 0) {
    $sql = "SELECT title, thumbnail_url, author, summary, isbn FROM Book WHERE id = ?";
    $stmt = $db->prepare($sql);
    $stmt->bind_param("i", $book_id);
    $stmt->execute();
    $result = $stmt->get_result();

    $book = null;
    if ($result->num_rows > 0) {
        $book = $result->fetch_assoc();
    }
    $stmt->close();
} else {
    // Handle invalid book ID
    $book = null;
}

?>


<!DOCTYPE html>
<html lang="en">

<head>
    <title>BiblioNook - Book Details</title>
    <link rel="icon" href="assets/logo.svg" type="image/x-icon" />
    <link rel="stylesheet" href="css/globals.css" />
    <link rel="stylesheet" href="css/components.css" />
    <link rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" href="css/details.css" />
</head>

<body>

    <?php
    require_once 'components/render_navbar.php';
    $current_page = basename($_SERVER['PHP_SELF']);
    renderNavbar($current_page);
    ?>


    <div class="main-content">
        <div class="main-container">

            <div class="book-details">
                <div class="book-cover">
                    <img src="<?= e($book['thumbnail_url'] ?? 'assets/placeholder-cover.png') ?>"
                         alt="<?= e($book['title'] ?? 'Book cover') ?>" class="cover-image">
                    <p class="isbn">ISBN: <?= e($book['isbn'] ?? '978-3-16-148410-0') ?></p>
                </div>

                <div class="book-info">
                    <div class="book-header">
                        <h1 class="book-title"><?= e($book['title'] ?? 'Book Title') ?></h1>
                        <p class="book-meta">
                            by <span class="author"><?= e($book['author'] ?? 'Author') ?></span> |
                            Published: <span class="publish-date"><?= e($book['publish_date'] ?? 'Jan 2009') ?></span>
                        </p>
                    </div>

                    <div class="rating">
                        <?php
                        $rating = 4.5;
                        for ($i = 1; $i <= 5; $i++) {
                            if ($i <= floor($rating)) {
                                echo '<span class="star filled"></span>';
                            } elseif ($i - $rating <= 0.5) {
                                echo '<span class="star half"></span>';
                            } else {
                                echo '<span class="star empty"></span>';
                            }
                        }
                        ?>
                    </div>

                    <div class="borrow-section">
                        <div class="borrowing-info">
                            <div class="period">
                                <select class="period-select">
                                    <option data-display="Borrowing Period: 7 days" value="1">7 days</option>
                                    <option data-display="Borrowing Period: 14 days" value="2">14 days</option>
                                    <option data-display="Borrowing Period: 21 days" value="3">21 days</option>
                                    <option data-display="Borrowing Period: 28 days" value="4">28 days</option>
                                </select>
                            </div>
                            <div class="price">
                                <span class="amount">$<?= number_format($book['price'] ?? 2.0, 2) ?></span>
                                <span class="period">/ <?= e($book['borrow_period'] ?? '7') ?> days</span>
                            </div>
                        </div>
                        <div class="borrowing-cta">
                            <button class="borrow-button">Borrow Book</button>

                            <div class="membership-prompt">
                                <p>Not a member? 😊</p>
                                <span> <a href="join.php" class="join-link">Join now</a> for unlimited borrowing!</span>

                            </div>



                        </div>

                    </div>

                    <section class="book-summary">
                        <h2>BOOK SUMMARY</h2>
                        <p><?= e($book['summary'] ?? 'Book summary placeholder text...') ?></p>
                    </section>

                    <section class="user-reviews">
                        <h2>USER REVIEWS</h2>
                        <?php if (!empty($reviews)): ?>
                            <?php foreach ($reviews as $review): ?>
                                <div class="review">
                                    <div class="review-header">
                                        <h3 class="review-title"><?= e($review['title']) ?></h3>
                                        <div class="review-rating">
                                            <?php for ($i = 1; $i <= 5; $i++): ?>
                                                <span class="star <?= $i <= $review['rating'] ? 'filled' : 'empty' ?>"></span>
                                            <?php endfor; ?>
                                        </div>
                                    </div>
                                    <p class="review-content"><?= e($review['content']) ?></p>
                                    <p class="review-meta">- <?= e($review['user_name']) ?>, <?= e($review['year']) ?></p>
                                </div>
                            <?php endforeach; ?>
                        <?php endif; ?>

                        <div class="pagination">
                            <span>&lt;</span>
                            <span>1 of 2</span>
                            <span>&gt;</span>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
    <script src="js/details.js"></script>
</body>

</html>