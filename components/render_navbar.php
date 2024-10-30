<?php
function renderNavbar($currentPage)
{
    session_start();
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

    // Add menu toggle button
    echo '<button id="menuToggle" class="menu-toggle">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <line x1="3" y1="12" x2="21" y2="12"></line>
                <line x1="3" y1="6" x2="21" y2="6"></line>
                <line x1="3" y1="18" x2="21" y2="18"></line>
            </svg>
          </button>';

    echo '<nav id="navbar">';

    // Add close button inside nav
    echo '<button id="closeMenu" class="close-menu">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <line x1="18" y1="6" x2="6" y2="18"></line>
                <line x1="6" y1="6" x2="18" y2="18"></line>
            </svg>
          </button>';

    echo '<ul>';

    echo "<li class='logo'>
            <img src='$logo_src' alt='BiblioNook Logo'/>
            <span>BiblioNook</span>
        </li>";

    foreach ($menu_items as $title => $item) {
        $url = $item['url'];
        $img_src = $item['img'];
        $class = ($currentPage === $url) ? ' class="active"' : '';
        echo "<a href=\"$url\"$class>
            <li><img class=\"nav-icon\" src=\"$img_src\" alt=\"$title icon\" /> $title</li>
        </a>";
    }
    echo '</ul>';

    if (isset($_SESSION["user_email"]) && isset($_SESSION["user_name"])) {
        $name = $_SESSION["user_name"];
        $name_parts = explode(' ', $name);
        $first_two_words = implode(' ', array_slice($name_parts, 0, 2));

        $email = $_SESSION["user_email"];
        $max_email_length = 25; // Set the maximum length for the email
        if (strlen($email) > $max_email_length) {
            $email = substr($email, 0, $max_email_length) . '...';
        }
        echo "
                <li class='profile'>
                    <a class='profile-link'>
                        <div class='profile-left'>
                            <img src='$user' alt='People Logo'/>
                            <div class='text'>
                                <span class='name'>" . htmlspecialchars($first_two_words, ENT_QUOTES, 'UTF-8') . "</span>
                                <span class='email'>{$email}</span>
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

    // Add JavaScript for menu toggle
    echo "
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const navbar = document.getElementById('navbar');
            const menuToggle = document.getElementById('menuToggle');
            const closeMenu = document.getElementById('closeMenu');
            const logoutBtn = document.querySelector('.logout');

            function toggleMenu() {
                navbar.classList.toggle('nav-active');
                document.body.classList.toggle('nav-open');
            }

            menuToggle.addEventListener('click', toggleMenu);
            closeMenu.addEventListener('click', toggleMenu);

            // Close menu when clicking outside
            document.addEventListener('click', function(e) {
                if (navbar.classList.contains('nav-active') &&
                    !navbar.contains(e.target) &&
                    !menuToggle.contains(e.target)) {
                    toggleMenu();
                }
            });

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