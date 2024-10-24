<?php
session_start();
function e($string)
{
    return htmlspecialchars($string, ENT_QUOTES, 'UTF-8');
}
$new_arrivals = [
    [
        'id' => 1,
        'title' => 'The Lovely Bones',
        'author' => 'Alice Sebold',
        'thumbnail_url' => 'https://bookcoverarchive.com/wp-content/uploads/2016/08/SquareSpace6.jpg',
        'genre' => 'Biographic',
    ],
    [
        'id' => 2,
        'title' => 'The Girl in Red',
        'author' => 'Cristina Henry',
        'thumbnail_url' => 'https://bookcoverarchive.com/wp-content/uploads/2020/07/The-Everlasting-final-cover.jpg',
        'genre' => 'Mystery',
    ],
    [
        'id' => 3,
        'title' => 'The Bees',
        'author' => 'Laline Paull',
        'thumbnail_url' => 'https://bookcoverarchive.com/wp-content/uploads/2015/10/visible-man.jpg',
        'genre' => 'Fiction',
    ],
];
$profileImage = './assets/icons/user_profile.png';
$user_id = $_SESSION['user_id'];
$user_name = $_SESSION['user_name'];
$user_email = $_SESSION['user_email'];
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>BiblioNook - Profile</title>
    <link rel="stylesheet" href="css/globals.css" />
    <link rel="stylesheet" href="css/components.css" />
    <link rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" href="css/profile.css" />
</head>

<body>
    <?php
    require_once 'components/render_navbar.php';
    $current_page = basename($_SERVER['PHP_SELF']);
    renderNavbar($current_page);
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
                                    <td class="genre"><span
                                              class="genre-tag <?= e(strtolower($book['genre'])) ?>"><?= e($book['genre']) ?></span>
                                    </td>
                                    <td>
                                        <a href="" class="action-button">Review Book</a>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
            </section>
        </div>
    </div>
</body>

</html>