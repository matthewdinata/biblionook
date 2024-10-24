document.addEventListener("DOMContentLoaded", function () {
    const closeBtn = document.querySelector(".close-btn");
    closeBtn.addEventListener("click", function () {
        window.history.back();
    });

    const tabButtons = document.querySelectorAll(".tab-btn");
    const tabContents = document.querySelectorAll(".tab-content");
    const title = document.querySelectorAll(".title");
    const subtitle = document.querySelectorAll(".subtitle");

    tabButtons.forEach((button) => {
        button.addEventListener("click", () => {
            // Remove active class from all buttons and contents
            tabButtons.forEach((btn) => btn.classList.remove("active"));
            tabContents.forEach((content) =>
                content.classList.remove("active")
            );
            title.forEach((title) => title.classList.remove("active"));
            subtitle.forEach((subtitle) => subtitle.classList.remove("active"));

            // Add active class to clicked button and corresponding content
            button.classList.add("active");
            const tabName = button.getAttribute("data-tab");
            const activeContent = document.querySelector(`#${tabName}-form`);
            const activeTitle = document.querySelector(`#${tabName}-title`);
            const activeSubtitle = document.querySelector(
                `#${tabName}-subtitle`
            );
            activeContent.classList.add("active");
            activeTitle.classList.add("active");
            activeSubtitle.classList.add("active");
        });
    });

    // Form validation
    const createAccountForm = document.getElementById("create-account-form");

    const nameInput = document.getElementById("reg-name");
    const emailInput = document.getElementById("reg-email");
    const passwordInput = document.getElementById("reg-password");
    const confirmPasswordInput = document.getElementById(
        "reg-confirm-password"
    );

    const nameError = document.getElementById("nameError");
    const emailError = document.getElementById("emailError");
    const passwordError = document.getElementById("passwordError");
    const confirmPasswordError = document.getElementById(
        "confirmPasswordError"
    );

    function validateName() {
        const nameRegex = /^[A-Za-z\s]+$/;
        if (!nameRegex.test(nameInput.value)) {
            nameError.textContent =
                "Name should only contain alphabets and spaces.";
            return false;
        }
        nameError.textContent = "";
        return true;
    }

    function validateEmail() {
        const emailRegex = /^[\w\.-]+@[\w\.-]+\.[a-zA-Z]{2,4}$/;
        if (!emailRegex.test(emailInput.value)) {
            emailError.textContent = "Please enter a valid email address.";
            return false;
        }
        emailError.textContent = "";
        return true;
    }

    function validatePassword() {
        const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;
        if (!passwordRegex.test(passwordInput.value)) {
            passwordError.textContent =
                "Password should contain at least 8 characters, including one uppercase letter, one lowercase letter, and one number.";
            return false;
        }
        passwordError.textContent = "";
        return true;
    }

    function validateConfirmPassword() {
        if (passwordInput.value !== confirmPasswordInput.value) {
            confirmPasswordError.textContent = "Passwords do not match.";
            return false;
        }
        confirmPasswordError.textContent = "";
        return true;
    }

    function resetErrors() {
        nameError.textContent = "";
        emailError.textContent = "";
        passwordError.textContent = "";
        confirmPasswordError.textContent = "";
    }

    nameInput.addEventListener("input", validateName);
    emailInput.addEventListener("input", validateEmail);
    passwordInput.addEventListener("input", validatePassword);
    confirmPasswordInput.addEventListener("input", validateConfirmPassword);

    if (createAccountForm) {
        createAccountForm.addEventListener("submit", function (e) {
            const password = document.getElementById("reg-password").value;
            const confirmPassword = document.getElementById(
                "reg-confirm-password"
            ).value;

            if (password !== confirmPassword) {
                e.preventDefault();
                alert("Passwords do not match!");
            }
        });
    }
});
