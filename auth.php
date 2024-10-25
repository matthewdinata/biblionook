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
            <h1 id="create-account-title" class="title active">Set Up Your Account</h1>
            <h1 id="signin-title" class="title">Welcome Back!</h1>
            <p id="create-account-subtitle" class="subtitle active">Great choice! Let's create your BiblioNook
                account.<br>Please
                fill in your details below.</p>
            <p id="signin-subtitle" class="subtitle">Please fill in your details to sign in.</p>

            <div class="tab-container">
                <div class="tab-buttons">
                    <button class="tab-btn active" data-tab="create-account">Create Account</button>
                    <button class="tab-btn" data-tab="signin">Sign In</button>
                </div>

                <!-- Create Account Form -->
                <form id="create-account-form" class="tab-content active" action="./utils/auth/process_registration.php"
                      method="POST">
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
                        <input type="password" id="reg-password" name="password" required>
                        <span id="passwordError" class="error"></span>
                    </div>
                    <div class="form-group">
                        <label for="reg-confirm-password">Confirm Password</label>
                        <input type="password" id="reg-confirm-password" name="confirm_password" required>
                        <span id="confirmPasswordError" class="error"></span>
                    </div>
                    <button type="submit" class="submit-btn">Create Account →</button>
                </form>

                <!-- Sign In Form -->
                <form id="signin-form" class="tab-content" action="process_login.php" method="POST">
                    <div class="form-group">
                        <label for="login-email">Email</label>
                        <input type="email" id="login-email" name="email" placeholder="example@youremail.com" required>
                    </div>
                    <div class="form-group">
                        <label for="login-password">Password</label>
                        <input type="password" id="login-password" name="password" placeholder="********" required>
                    </div>
                    <button type="submit" class="submit-btn">Sign In →</button>
                </form>
            </div>
        </div>
    </div>
    <script src="js/auth.js"></script>
</body>

</html>