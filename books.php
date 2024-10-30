<?php
session_start();

function e($string)
{
    return htmlspecialchars($string, ENT_QUOTES, 'UTF-8');
}

require_once "lib/db.php";

$sql = "SELECT * FROM Book ORDER BY date_added LIMIT 8";
$result = $db->query($sql);

$new_arrivals = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $new_arrivals[] = $row;
    }
}
$profileImage = './assets/icons/user_profile.png';
$user_id = $_SESSION['user_id'];
$user_name = $_SESSION['user_name'];
$user_email = $_SESSION['user_email'];
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>BiblioNook - Profile</title>
    <link rel="icon" href="assets/logo.svg" type="image/x-icon" />
    <link rel="stylesheet" href="css/globals.css" />
    <link rel="stylesheet" href="css/components.css" />
    <link rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" href="css/profile.css" />
</head>

<body>
    <?php
    require_once 'components/render_navbar.php';
    require_once 'components/render_review.php';
    $current_page = basename($_SERVER['PHP_SELF']);
    renderNavbar($current_page);
    renderReview('reviewSlideout');
    ?>
    <div class="main-content">
        <div class="container">
            <section class="profile-box">
                <img src="<?= $profileImage ?>" alt="Profile Image" />
                <h1><?= $user_name ?></h1>
                <p><?= $user_email ?></p>
                <div class="data">
                    <div class="data-item">
                        <div class="data-number">205</div>
                        <div class="data-text">Borrowed</div>
                    </div>
                    <div class="data-item">
                        <div class="data-number">178</div>
                        <div class="data-text">Reviewed</div>
                    </div>
                </div>
            </section>
            <section class="borrowed-books">
                <h3>Borrowed Books</h3>
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
                                    <td class="genre">
                                        <span
                                              class="genre-tag <?= e(strtolower($book['genre'])) ?>"><?= e($book['genre']) ?></span>
                                    </td>
                                    <td>
                                        <a class="action-button"
                                           onclick="openReview(<?= htmlspecialchars(json_encode($book), ENT_QUOTES, 'UTF-8') ?>)">
                                            Review Book
                                        </a>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
            </section>
        </div>
    </div>
    <script src='js/components/render_review.js'></script>
</body>

</html>