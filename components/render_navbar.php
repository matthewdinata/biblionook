<?php
function renderNavbar($currentPage)
{
    $menu_items = [
        'Home' => 'index.php',
        'Search' => 'search.php',
        'Your Books' => 'books.php',
        'Pricing' => 'pricing.php',
    ];

    echo '<nav><ul>';

    foreach ($menu_items as $title => $url) {
        $class = ($currentPage === $url) ? ' class="active"' : '';
        echo "<a href=\"$url\"$class><li>$title</li></a>";
    }
    echo '</ul></nav>';
}
