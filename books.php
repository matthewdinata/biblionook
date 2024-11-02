<?php
session_start();

function e($string)
{
    return htmlspecialchars($string, ENT_QUOTES, 'UTF-8');
}

function daysLeft($due_date)
{
    $due = new DateTime($due_date);
    $now = new DateTime();
    $interval = $now->diff($due);
    return $interval->format('%d days left');
}

function isReturned($due_date): bool
{
    $due = new DateTime($due_date);
    $now = new DateTime();
    return $now->diff($due)->days == 0;
}

require_once "lib/db.php";

$sql = "SELECT 
            bk.id as id,
            u.name as borrower_name,
            bk.title as title,
            bk.thumbnail_url as thumbnail_url,
            bk.author,
            bk.genre,
            b.borrow_date,
            b.due_date,
            u.membership_type,
            CASE 
                WHEN r.id IS NOT NULL THEN TRUE 
                ELSE FALSE 
            END as is_reviewed
        FROM Borrowing b
        JOIN User u ON b.user_id = u.id
        JOIN Book bk ON b.book_id = bk.id
        LEFT JOIN Review r ON b.book_id = r.book_id AND b.user_id = r.user_id
        WHERE u.id = {$_SESSION['user_id']}
        ORDER BY b.borrow_date DESC;";
$result = $db->query($sql);

$borrowed_books = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $borrowed_books[] = $row;
    }
}

// Calculate currently reading books
$current_reading_books = array_filter($borrowed_books, function ($book) {
    return !isReturned($book['due_date']);
});

$profileImage = './assets/icons/user_profile.png';
$user_id = $_SESSION['user_id'];
$user_name = $_SESSION['user_name'];
$user_email = $_SESSION['user_email'];

$sql = "SELECT 
            b.title as book_title,
            b.author,
            r.rating,
            r.title as review_title,
            r.content as review_content,
            r.review_date
        FROM Review r
        JOIN Book b ON r.book_id = b.id
        WHERE r.user_id = $user_id
        ORDER BY r.review_date DESC;";

$result = $db->query($sql);

$reviewed_books = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $reviewed_books[] = $row;
    }
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>BiblioNook - Profile</title>
    <link rel="icon" href="assets/logo.svg" type="image/x-icon" />
    <link rel="stylesheet" href="css/globals.css" />
    <link rel="stylesheet" href="css/components.css" />
    <link rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" href="css/books.css" />
</head>

<body>
    <?php
    require_once 'components/render_navbar.php';
    require_once 'components/render_review.php';
    require_once 'components/render_theme_toggle.php';
    $current_page = basename($_SERVER['PHP_SELF']);
    renderNavbar($current_page);
    renderReview('reviewSlideout');
    renderThemeToggle();
    ?>
    <div class="main-content">
        <div class="container">
            <section class="profile-box">
                <img src="<?= $profileImage ?>" alt="Profile Image" />
                <h1><?= $user_name ?></h1>
                <p><?= $user_email ?></p>
                <div class="data">
                    <div class="data-item">
                        <div class="data-number"><?= count($current_reading_books) ?></div>
                        <div class="data-text">Current Read</div>
                    </div>
                    <div class="data-item">
                        <div class="data-number"><?= count($borrowed_books) ?></div>
                        <div class="data-text">Borrowed</div>
                    </div>
                    <div class="data-item">
                        <div class="data-number"><?= count($reviewed_books) ?></div>
                        <div class="data-text">Reviewed</div>
                    </div>
                </div>
            </section>
            <section class="borrowed-books">
                <h3>Borrowed Books</h3>
                <?php if (empty($borrowed_books)): ?>
                    <div class="empty-state">
                        <h4>No Books Borrowed Yet</h4>
                        <p>Explore our collection and start your reading journey today!</p>
                        <a href="./search.php" class="primary-button">Browse Books</a>
                    </div>
                <?php else: ?>
                    <div class="book-table">
                        <table>
                            <thead>
                                <tr>
                                    <th>Title</th>
                                    <th class="author">Author</th>
                                    <th class="genre">Genre</th>
                                    <th class="due-date">Due Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($borrowed_books as $book): ?>
                                    <tr>
                                        <td>
                                            <img src="<?= e($book['thumbnail_url']) ?>" alt="<?= e($book['title']) ?>"
                                                class="book-cover">
                                            <?= e($book['title']) ?>
                                        </td>
                                        <td class="author"><?= e($book['author']) ?></td>
                                        <td class="genre">
                                            <span
                                                class="genre-tag <?= e(strtolower($book['genre'])) ?>"><?= e($book['genre']) ?></span>
                                        </td>
                                        <td class="due-date">
                                            <?php if (isReturned($book['due_date'])): ?>
                                                <span class="returned">Returned</span>
                                            <?php else: ?>
                                                <?= (new DateTime($book['due_date']))->format('d M') ?>
                                                <span class="days-left">(<?= daysLeft($book['due_date']) ?>)</span>
                                            <?php endif; ?>
                                        </td>
                                        <td class="action">
                                            <?php if ($book['is_reviewed']): ?>
                                                <a class="action-button reviewed" data-tooltip="Reviewed">
                                                    <img src="assets/icons/reviewed.svg" alt="Reviewed Icon" width="20" height="20">
                                                </a>
                                            <?php else: ?>
                                                <a class="action-button" data-tooltip="Review"
                                                    onclick="openReview(<?= htmlspecialchars(json_encode($book), ENT_QUOTES, 'UTF-8') ?>)">
                                                    <img src="assets/icons/review.svg" alt="Review Icon" width="20" height="20">
                                                </a>
                                            <?php endif; ?>
                                            <?php if (!isReturned($book['due_date'])): ?>
                                                <a class="action-button" data-tooltip="Read"
                                                    href="./read.php?id=<?= e($book['id']) ?>">
                                                    <img src="assets/icons/read.svg" alt="Read Icon" width="20" height="20">
                                                </a>
                                                <a class="action-button" data-tooltip="Return"
                                                    onclick="returnBook(<?= e($book['id']) ?>, '<?= e($book['title']) ?>')">
                                                    <img src="assets/icons/return.svg" alt="Return Icon" width="20" height="20">
                                                </a>
                                            <?php else: ?>
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                <?php endif; ?>
            </section>
        </div>
    </div>
    <script src='js/components/render_review.js'></script>
    <script src='js/books.js'></script>
</body>

</html>