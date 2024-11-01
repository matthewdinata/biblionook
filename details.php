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
    $sql = "SELECT title, thumbnail_url, author, summary, isbn, publication_date, fee FROM Book WHERE id = ?";
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
    require_once 'components/render_slideout_menu.php';
    require_once 'components/render_theme_toggle.php';
    $current_page = basename($_SERVER['PHP_SELF']);
    renderNavbar($current_page);
    renderThemeToggle();


    // Payment form content
    $paymentContent = <<<HTML
    <div class="payment-form">
        <p class="text-center mb-4">
            Your chosen book: <strong>{$book['title']}</strong><br>
            Just one more page to turn before you can dive into your book of choice!
        </p>
        
        <div class="form-section">
            <div class="purchase-details mb-6">
                <h3>Payment due</h3>
                <div class="price-display">
                    <span class="amount">$<?= $book[fee] ?></span>
                    <span class="period">/7 days</span>
                </div>
            </div>
        </div>
    </div>
HTML;

    // Render the slideout menu
    renderSlideoutMenu('paymentSlideout', 'Complete your Payment', $paymentContent);
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
                            Published: <span
                                  class="publish-date"><?= e(date('M Y', strtotime($book['publication_date'] ?? '2009-01-01'))) ?></span>
                        </p>
                        <div class="rating">
                            <?php
                            $rating = 4.5;
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


                    <?php if (isset($_SESSION['user_id'])): ?>
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
                                    <span class="amount">$<?= number_format($book['fee'], 2) ?></span>
                                    <span class="period"></span>
                                </div>
                            </div>
                            <div class="borrowing-cta">
                                <button onclick="slideoutMenu.open('paymentSlideout')" class="borrow-button">Borrow
                                    Book</button>

                                <div class="membership-prompt">
                                    <p>Not a member? 😊</p>
                                    <span> <a href="join.php" class="join-link">Join now</a> for unlimited borrowing!</span>

                                </div>
                            </div>

                        </div>
                    <?php endif; ?>



                    <section class="book-summary">
                        <h2>BOOK SUMMARY</h2>
                        <p><?= e($book['summary'] ?? 'Book summary placeholder text...') ?></p>
                    </section>

                    <section class="user-reviews">
                        <h2>USER REVIEWS</h2>
                        <?php
                        $reviews = [
                            [
                                'title' => 'Amazing Book!',
                                'rating' => 5,
                                'content' => 'I absolutely loved this book. The story was captivating and the characters were well-developed.',
                                'name' => 'John Doe',
                                'review_date' => '2023-10-01'
                            ],
                            [
                                'title' => 'Good Read',
                                'rating' => 4,
                                'content' => 'A very good read, although it had some slow parts. Overall, I enjoyed it.',
                                'name' => 'Jane Smith',
                                'review_date' => '2023-09-15'
                            ],
                            [
                                'title' => 'Not my cup of tea',
                                'rating' => 2,
                                'content' => 'I found the book to be quite boring and couldn\'t finish it.',
                                'name' => 'Alice Johnson',
                                'review_date' => '2023-08-20'
                            ],
                            [
                                'title' => 'Fantastic!',
                                'rating' => 5,
                                'content' => 'One of the best books I have read this year. Highly recommend!',
                                'name' => 'Bob Brown',
                                'review_date' => '2023-07-10'
                            ],
                            [
                                'title' => 'Mediocre',
                                'rating' => 3,
                                'content' => 'The book was okay, but I expected more from the plot.',
                                'name' => 'Charlie Davis',
                                'review_date' => '2023-06-05'
                            ]
                        ];
                        ?>

                        <?php
                        // Pagination logic
                        $reviews_per_page = 3;
                        $total_reviews = count($reviews);
                        $total_pages = ceil($total_reviews / $reviews_per_page);
                        $current_page = isset($_GET['page']) ? intval($_GET['page']) : 1;
                        $current_page = max(1, min($total_pages, $current_page));
                        $start_index = ($current_page - 1) * $reviews_per_page;
                        $end_index = min($start_index + $reviews_per_page, $total_reviews);
                        ?>

                        <?php if (!empty($reviews)): ?>
                            <?php for ($i = $start_index; $i < $end_index; $i++): ?>
                                <?php $review = $reviews[$i]; ?>
                                <article class="review">
                                    <div class="review-header">
                                        <h3 class="review-title"><?= e($review['title']) ?></h3>
                                        <div class="review-rating">
                                            <?php
                                            $review_rating = $review['rating'];
                                            for ($j = 1; $j <= 5; $j++) {
                                                if ($j <= floor($review_rating)) {
                                                    echo '<img src="assets/icons/star-filled.svg" alt="Filled Star" class="star">';
                                                } elseif ($j - $review_rating <= 0.5) {
                                                    echo '<img src="assets/icons/star-half-filled.svg" alt="Half Filled Star" class="star">';
                                                } else {
                                                    echo '<img src="assets/icons/star-empty.svg" alt="Empty Star" class="star">';
                                                }
                                            }
                                            ?>

                                        </div>
                                    </div>
                                    <p class="review-content"><?= e($review['content']) ?></p>
                                    <p class="review-meta">- <?= e($review['name']) ?>,
                                        <?= e(date('Y', strtotime($review['review_date']))) ?>
                                    </p>
                                </article>
                            <?php endfor; ?>
                        <?php endif; ?>

                        <div class="pagination">
                            <?php if ($current_page > 1): ?>
                                <a href="?id=<?= $book_id ?>&page=<?= $current_page - 1 ?>">&lt;</a>
                            <?php else: ?>
                                <span>&lt;</span>
                            <?php endif; ?>
                            <span><?= $current_page ?> of <?= $total_pages ?></span>
                            <?php if ($current_page < $total_pages): ?>
                                <a href="?id=<?= $book_id ?>&page=<?= $current_page + 1 ?>">&gt;</a>
                            <?php else: ?>
                                <span>&gt;</span>
                            <?php endif; ?>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
    <script src='js/components/render_slideout_menu.js'></script>
    <script src="js/details.js"></script>
</body>

</html>