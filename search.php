<!DOCTYPE html>
<html lang="en">

<head>
    <title>BIBLIONOOK</title>
    <link rel="stylesheet" href="css/globals.css" />
    <link rel="stylesheet" href="css/components.css" />
    <link rel="stylesheet" href="css/main.css" />
</head>

<body>
    <h1>Search</h1>

    <?php
    require_once 'components/render_navbar.php';
    $current_page = basename($_SERVER['PHP_SELF']);
    renderNavbar($current_page);
    ?>
</body>

</html>