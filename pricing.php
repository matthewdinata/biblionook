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
    $current_page = basename($_SERVER['PHP_SELF']);
    renderNavbar($current_page);
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
                <!-- Free Plan -->
                <div class="plan-card">
                    <div class="plan-header">
                        <div class="price">
                            <span class="amount">$0</span>
                            <span class="period">/mon</span>
                        </div>
                        <h2>Free plan</h2>
                    </div>
                    <div class="plan-features">
                        <div class="feature">
                            <img src="assets/icons/check.png" alt="check">
                            <span>Pay-per-borrow basis</span>
                        </div>
                        <div class="feature">
                            <img src="assets/icons/check.png" alt="check">
                            <span>Basic Support</span>
                        </div>
                    </div>
                    <button class="current-plan">Current Plan
                    </button>
                </div>

                <!-- Lite Plan -->
                <div class=" plan-card">
                    <div class="plan-header">
                        <div class="price">
                            <span class="amount">$9.9</span>
                            <span class="period">/mon</span>
                        </div>
                        <h2>Lite plan</h2>
                    </div>
                    <div class="plan-features">
                        <div class="feature">
                            <img src="assets/icons/check.png" alt="check">
                            <span>Borrow up to 3 books at a time</span>
                        </div>
                        <div class="feature">
                            <img src="assets/icons/check.png" alt="check">
                            <span>Basic Support</span>
                        </div>
                    </div>
                    <button class="plan-button" onclick="upgradePlan('lite')">Upgrade to Lite plan
                        <img src="assets/icons/arrow-right.png" alt="check">
                    </button>
                </div>

                <!-- Plus Plan -->
                <div class="plan-card premium">
                    <div class="plan-header">
                        <div class="price">
                            <span class="amount">$19.9</span>
                            <span class="period">/mon</span>
                        </div>
                        <h2>Plus plan</h2>
                    </div>
                    <div class="plan-features">
                        <div class="feature">
                            <img src="assets/icons/check-white.png" alt="check">
                            <span>Everything on Lite plan</span>
                        </div>
                        <div class="feature">
                            <img src="assets/icons/check-white.png" alt="check">
                            <span>Borrow up to 10 books at a time</span>
                        </div>
                        <div class="feature">
                            <img src="assets/icons/check-white.png" alt="check">
                            <span>Advanced Search Functionality</span>
                        </div>
                        <div class="feature">
                            <img src="assets/icons/check-white.png" alt="check">
                            <span>Early access to new releases</span>
                        </div>
                        <div class="feature">
                            <img src="assets/icons/check-white.png" alt="check">
                            <span>Premium Support</span>
                        </div>
                    </div>
                    <button class="plan-button" onclick="upgradePlan('plus')">Upgrade to Plus plan
                        <img src="assets/icons/arrow-right.png" alt="check">
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script src="js/pricing.js"></script>
</body>

</html>