<?php
function renderNavbar($currentPage)
{
    $menu_items = [
        'Home' => ['url' => 'index.php', 'img' => './assets/icons/home.svg'],
        'Search' => ['url' => 'search.php', 'img' => './assets/icons/search.svg'],
        'Your Books' => ['url' => 'books.php', 'img' => './assets/icons/books.svg'],
        'Pricing' => ['url' => 'pricing.php', 'img' => './assets/icons/pricing.svg'],
    ];

    echo '<nav><ul>';

    foreach ($menu_items as $title => $item) {
        $url = $item['url'];
        $img_src = $item['img'];
        $class = ($currentPage === $url) ? ' class="active"' : '';
        echo "<a href=\"$url\"$class>
            <li><img src=\"$img_src\" alt=\"$title icon\" /> $title</li>
        </a>";
    }
    echo '</ul></nav>';
}
