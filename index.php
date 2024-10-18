<!DOCTYPE html>
<html lang="en">

<head>
    <title>BIBLIONOOK</title>
    <link rel="stylesheet" href="css/globals.css" />
    <link rel="stylesheet" href="css/components.css" />
    <link rel="stylesheet" href="css/main.css" />
</head>

<body>
    <?php
    require_once 'components/render_navbar.php';
    $current_page = basename($_SERVER['PHP_SELF']);
    renderNavbar($current_page);
    ?>
    <div class="main-content">
        <h1>Welcome to BiblioNook</h1>
    </div>
</body>

</html>