<?php
// Function to safely escape output
function e($string)
{
    return htmlspecialchars($string, ENT_QUOTES, 'UTF-8');
}

// Define plan configurations
$plans = [
    'free' => [
        'name' => 'Free plan',
        'price' => 0,
        'features' => [
            'Pay-per-borrow basis',
            'Basic Support'
        ],
        'is_premium' => false
    ],
    'lite' => [
        'name' => 'Lite plan',
        'price' => 9.9,
        'features' => [
            'Borrow up to 3 books at a time',
            'Basic Support'
        ],
        'is_premium' => false
    ],
    'plus' => [
        'name' => 'Plus plan',
        'price' => 19.9,
        'features' => [
            'Everything on Lite plan',
            'Borrow up to 10 books at a time',
            'Advanced Search Functionality',
            'Early access to new releases',
            'Premium Support'
        ],
        'is_premium' => true
    ]
];

// Function to render plan features
function renderFeatures($features, $isPremium = false)
{
    $html = '<div class="plan-features">';
    foreach ($features as $feature) {
        $iconSrc = $isPremium ? 'assets/icons/check-white.png' : 'assets/icons/check.png';
        $html .= <<<HTML
            <div class="feature">
                <img src="{$iconSrc}" alt="check">
                <span>{$feature}</span>
            </div>
        HTML;
    }
    $html .= '</div>';
    return $html;
}

// Function to render button based on plan type
function renderButton($planKey)
{
    if ($planKey === 'free') {
        return '<button class="current-plan">Current Plan</button>';
    }

    return <<<HTML
        <button class="plan-button" onclick="openPaymentSlideout('{$planKey}')">
            Upgrade to {$planKey} plan
            <img src="assets/icons/arrow-right.png" alt="arrow-right">
        </button>
    HTML;
}

// Function to generate payment content based on selected plan
function generatePaymentContent($plan)
{
    $html = <<<HTML
        <div class="plan-header">
            <div class="price">
                <span class="amount">\${$plan['price']}</span>
                <span class="period">/mon</span>
            </div>
            <h2>{$plan['name']}</h2>
        </div>
    HTML;

    $html .= renderFeatures($plan['features'], false);
    return $html;
}

// Function to render a plan card
function renderPlanCard($planKey, $plan)
{
    $premiumClass = $plan['is_premium'] ? 'premium' : '';
    $features = renderFeatures($plan['features'], $plan['is_premium']);
    $button = renderButton($planKey);

    return <<<HTML
        <div class="plan-card {$premiumClass}">
            <div class="plan-header">
                <div class="price">
                    <span class="amount">\${$plan['price']}</span>
                    <span class="period">/mon</span>
                </div>
                <h2>{$plan['name']}</h2>
            </div>
            {$features}
            {$button}
        </div>
    HTML;
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>BiblioNook - Pricing</title>
    <link rel="icon" href="assets/logo.svg" type="image/x-icon" />
    <link rel="stylesheet" href="css/globals.css" />
    <link rel="stylesheet" href="css/components.css" />
    <link rel="stylesheet" href="css/main.css" />
    <link rel="stylesheet" href="css/pricing.css" />
</head>

<body>
    <?php
    require_once 'components/render_navbar.php';
    require_once 'components/render_slideout_menu.php';
    require_once 'components/render_theme_toggle.php';

    $current_page = basename($_SERVER['PHP_SELF']);
    renderNavbar($current_page);
    renderThemeToggle();

    // Store plans data for JavaScript use
    $plansJson = json_encode($plans);
    echo "<script>const plansData = " . $plansJson . ";</script>";

    // Initially render empty payment content - it will be populated by JavaScript
    renderSlideoutMenu('paymentSlideout', 'Complete your Payment', '');
    ?>

    <div class="main-content">
        <div class="pricing-container">
            <h1>Select Your Plan</h1>
            <p class="welcome-text">
                Welcome to BiblioNook! Choose the plan that best fits your reading style and unlock a world of digital
                books at your fingertips. Whether you're a casual reader or a literary enthusiast, we have the perfect
                plan for you.
            </p>

            <div class="plans-container">
                <?php
                foreach ($plans as $planKey => $plan) {
                    echo renderPlanCard($planKey, $plan);
                }
                ?>
            </div>
        </div>
    </div>

    <script src="js/pricing.js"></script>
    <script src='js/components/render_slideout_menu.js'></script>
</body>

</html>