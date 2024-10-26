<?php
session_start();
$activeTab = $_SESSION['active_tab'] ?? 'create-account'; // Default to create-account if not set
$formData = $_SESSION['form_data'] ?? [];
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>BiblioNook - Authentication</title>
    <link rel="icon" href="assets/logo.svg" type="image/x-icon" />
    <link rel="stylesheet" href="css/globals.css" />
    <link rel="stylesheet" href="css/components.css" />
    <link rel="stylesheet" href="css/auth.css" />
</head>

<body>
    <div class="auth-container">
        <div class="auth-header">
            <div class="logo">
                <img src="assets/logo.svg" alt="BiblioNook" />
                <span>BiblioNook</span>
            </div>
            <button class="close-btn">&times;</button>
        </div>

        <div class="auth-content">
            <div class="<?php echo $activeTab === 'create-account' ? 'active' : ''; ?>">
                <h1 id="create-account-title" class="title">Set Up Your Account</h1>
                <p id="create-account-subtitle" class="subtitle">Great choice! Let's
                    create your BiblioNook
                    account.<br>Please
                    fill in your details below.</p>
            </div>
            <div class="<?php echo $activeTab === 'signin' ? 'active' : ''; ?>">
                <h1 id="signin-title" class="title">Welcome Back!</h1>
                <p id="signin-subtitle" class="subtitle">Please
                    fill
                    in your details to sign in.</p>
            </div>

            <div class="tab-container">
                <div class="tab-buttons">
                    <button class="tab-btn <?php echo $activeTab === 'create-account' ? 'active' : ''; ?>"
                        data-tab="create-account">Create Account</button>
                    <button class="tab-btn <?php echo $activeTab === 'signin' ? 'active' : ''; ?>"
                        data-tab="signin">Sign In</button>
                </div>

                <!-- Create Account Form -->
                <form id="create-account-form"
                    class="tab-content <?php echo $activeTab === 'create-account' ? 'active' : ''; ?>"
                    action="./utils/auth/process_registration.php" method="POST">
                    <div class="form-group">
                        <label for="reg-name">Name</label>
                        <input type="text" id="reg-name" name="name" placeholder="Brian Clark" required>
                        <span id="nameError" class="error"></span>
                    </div>
                    <div class="form-group">
                        <label for="reg-email">Email</label>
                        <input type="email" id="reg-email" name="email" placeholder="example@youremail.com" required>
                        <span id="emailError" class="error"></span>
                    </div>
                    <div class="form-group">
                        <label for="reg-password">Password</label>
                        <input type="password" id="reg-password" name="password" placeholder="********" required>
                        <span id="passwordError" class="error"></span>
                    </div>
                    <div class="form-group">
                        <label for="reg-confirm-password">Confirm Password</label>
                        <input type="password" id="reg-confirm-password" name="confirm_password" placeholder="********"
                            required>
                        <span id="confirmPasswordError" class="error"></span>
                    </div>
                    <button type="submit" class="submit-btn">Create Account →</button>
                </form>

                <!-- Sign In Form -->
                <form id="signin-form" class="tab-content <?php echo $activeTab === 'signin' ? 'active' : ''; ?>"
                    action="./utils/auth/process_login.php" method="POST">
                    <div class="form-group">
                        <label for="login-email">Email</label>
                        <input type="email" id="login-email" name="email" placeholder="example@youremail.com"
                            value="<?php echo htmlspecialchars($formData['email'] ?? ''); ?>" required>
                        <span id="login-emailError" class="error"></span>
                    </div>
                    <div class="form-group">
                        <label for="login-password">Password</label>
                        <input type="password" id="login-password" name="password" placeholder="********" required>
                        <span id="login-passwordError" class="error"></span>
                    </div>
                    <button type="submit" class="submit-btn">Sign In →</button>
                </form>

                <?php if (!empty($_SESSION['auth_errors'])): ?>
                    <div id="error-container" class="error-message show">
                        <?php
                        foreach ($_SESSION['auth_errors'] as $error) {
                            echo htmlspecialchars($error) . "<br>";
                        }
                        unset($_SESSION['auth_errors']);
                        ?>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>
    <script src="js/auth.js"></script>
    <?php
    // Clear session data after displaying
    unset($_SESSION['active_tab']);
    unset($_SESSION['form_data']);
    ?>
</body>

</html>