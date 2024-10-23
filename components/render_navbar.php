<?php

function renderNavbar($currentPage)
{
    session_start();
    // echo session id
    $id = session_id();
    $logo_src = './assets/logo.svg';
    $signin = './assets/icons/sign-in.svg';
    $user = './assets/icons/user.svg';
    $menu_items = [
        'Home' => ['url' => 'index.php', 'img' => './assets/icons/home.svg'],
        'Search' => ['url' => 'search.php', 'img' => './assets/icons/search.svg'],
        'Your Books' => ['url' => 'books.php', 'img' => './assets/icons/books.svg'],
        'Pricing' => ['url' => 'pricing.php', 'img' => './assets/icons/pricing.svg'],
    ];

    echo '<nav><ul>';

    echo "<li class='logo'>
            <img src='$logo_src' alt='BiblioNook Logo'/>
            <span>BiblioNook</span>
        </li>";

    foreach ($menu_items as $title => $item) {
        $url = $item['url'];
        $img_src = $item['img'];
        $class = ($currentPage === $url) ? ' class="active"' : '';
        echo "<a href=\"$url\"$class>
            <li><img src=\"$img_src\" alt=\"$title icon\" /> $title</li>
        </a>";
    }
    echo '</ul>';

    if (isset($_SESSION["user_email"]) && isset($_SESSION["user_name"])) {
        $name = $_SESSION["user_name"];
        $name_parts = explode(' ', $name);
        $first_two_words = implode(' ', array_slice($name_parts, 0, 2));
        echo "
                <li class='profile'>
                    <a href='profile.php' class='profile-link'>
                        <div class='profile-left'>
                            <img src='$user' alt='People Logo'/>
                            <div class='text'>
                                <span class='name'>" . htmlspecialchars($first_two_words, ENT_QUOTES, 'UTF-8') . "</span>
                                <span class='email'>{$_SESSION["user_email"]}</span>
                            </div>
                        </div>
                    </a>
                    <a class='logout'>
                        <img src='$signin' alt='Log Out Logo'/>
                    </a>
                </li>
        ";
    } else {
        echo "<a href='auth.php' class='sign-in-link'>
                <li class='sign-in'>
                    <img src='$signin' alt='Sign In Logo'/>
                    <span>Sign In</span>
                </li>
            </a>";
    }


    echo '</nav>';
    echo "
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const logoutBtn = document.querySelector('.logout');
            if (logoutBtn) {
                logoutBtn.addEventListener('click', function(e) {
                    e.preventDefault();
                    
                    if (confirm('Are you sure you want to log out?')) {
                        window.location.href = './utils/auth/logout.php';
                    }
                });
            }
        });
    </script>
    ";
}
