<?php
// // Establish database connection
// $db = new PDO("mysql:host=localhost;dbname=your_database", "username", "password");

// Function to safely escape output
function e($string)
{
    return htmlspecialchars($string, ENT_QUOTES, 'UTF-8');
}

// // Fetch recommended books
// $stmt = $db->query("SELECT title, image_path FROM books WHERE recommended = 1 LIMIT 4");
// $recommended_books = $stmt->fetchAll(PDO::FETCH_ASSOC);

// // Fetch new arrivals
// $stmt = $db->query("SELECT title, author, genre FROM books ORDER BY release_date DESC LIMIT 3");
// $new_arrivals = $stmt->fetchAll(PDO::FETCH_ASSOC);
$recommended_books = [
    ['title' => '1000 Black Umbrella', 'image' => 'https://bookcoverarchive.com/wp-content/uploads/2016/08/SquareSpace6.jpg'],
    ['title' => 'The Everlasting', 'image' => 'https://bookcoverarchive.com/wp-content/uploads/2020/07/The-Everlasting-final-cover.jpg'],
    ['title' => 'The Visible Man: A Novel', 'image' => 'https://bookcoverarchive.com/wp-content/uploads/2015/10/visible-man.jpg'],
    ['title' => 'Alena: A Novel', 'image' => 'https://bookcoverarchive.com/wp-content/uploads/2015/12/alena.jpg'],
];

$new_arrivals = [
    [
        'id' => 1,
        'title' => 'The Lovely Bones',
        'author' => 'Alice Sebold',
        'cover_path' => 'https://bookcoverarchive.com/wp-content/uploads/2016/08/SquareSpace6.jpg',
        'genre' => 'Biographic',
    ],
    [
        'id' => 2,
        'title' => 'The Girl in Red',
        'author' => 'Cristina Henry',
        'cover_path' => 'https://bookcoverarchive.com/wp-content/uploads/2020/07/The-Everlasting-final-cover.jpg',
        'genre' => 'Mystery',
    ],
    [
        'id' => 3,
        'title' => 'The Bees',
        'author' => 'Laline Paull',
        'cover_path' => 'https://bookcoverarchive.com/wp-content/uploads/2015/10/visible-man.jpg',
        'genre' => 'Fiction',
    ],
];
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>BIBLIONOOK</title>
    <link rel="stylesheet" href="css/globals.css" />
    <link rel="stylesheet" href="css/components.css" />
    <link rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" href="css/index.css" />
</head>

<body>
    <?php
    require_once 'components/render_navbar.php';
    $current_page = basename($_SERVER['PHP_SELF']);
    renderNavbar($current_page);
    ?>
    <div class="main-content">
        <div class="search-bar">
            <form action="search.php" method="GET" class="input-box">
                <input type="text" name="query" placeholder="Search your favorite books..." />
            </form>
        </div>

        <section class="recommended-section">
            <h3>Recommended For You</h3>
            <div class="book-grid">
                <?php foreach ($recommended_books as $book): ?>
                    <div class="book-card">
                        <img src="<?= e($book['image']) ?>" alt="<?= e($book['title']) ?>" />
                    </div>
                <?php endforeach; ?>
            </div>
            <div class="carousel">
                <div class="group">
                    <?php foreach ($recommended_books as $book): ?>
                        <div class="book-card card">
                            <img src="<?= e($book['image']) ?>" alt="<?= e($book['title']) ?>" />
                        </div>
                    <?php endforeach; ?>
                </div>
                <div aria-hidden class="group">
                    <?php foreach ($recommended_books as $book): ?>
                        <div class="book-card card">
                            <img src="<?= e($book['image']) ?>" alt="<?= e($book['title']) ?>" />
                        </div>
                    <?php endforeach; ?>
                </div>
                <div aria-hidden class="group">
                    <?php foreach ($recommended_books as $book): ?>
                        <div class="book-card card">
                            <img src="<?= e($book['image']) ?>" alt="<?= e($book['title']) ?>" />
                        </div>
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
                                    <img src="<?= e($book['cover_path']) ?>" alt="<?= e($book['title']) ?>"
                                        class="book-cover">
                                    <?= e($book['title']) ?>
                                </td>
                                <td class="author"><?= e($book['author']) ?></td>
                                <td class="genre"><span
                                        class="genre-tag <?= e(strtolower($book['genre'])) ?>"><?= e($book['genre']) ?></span>
                                </td>
                                <td>
                                    <a href="" class="action-button">View Details</a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
        </section>
    </div>

</html>