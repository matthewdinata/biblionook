<?php
function renderNavbar($currentPage)
{
    $logo_src = './assets/logo.svg';
    $signin = './assets/icons/sign-in.svg';
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

    echo "<a href='auth.php' class='sign-in-link'>
        <li class='sign-in'>
            <img src='$signin' alt='Sign In Logo'/>
            <span>Sign In</span>
        </li>
    </a>";

    echo '</nav>';
}
