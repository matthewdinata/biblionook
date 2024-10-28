document.addEventListener("DOMContentLoaded", function () {
    // Tab switching functionality
    initializeTabs();

    // Form validation
    initializeRegistrationValidation();
    initializeSignInValidation();

    // Handle error container fade out
    const errorContainer = document.getElementById("error-container");
    if (errorContainer && errorContainer.classList.contains("show")) {
        setTimeout(function () {
            errorContainer.classList.remove("show");
        }, 3000);
    }
});

function initializeTabs() {
    const closeBtn = document.querySelector(".close-btn");
    closeBtn.addEventListener("click", () => window.history.back());

    const tabButtons = document.querySelectorAll(".tab-btn");
    const tabContents = document.querySelectorAll(".tab-content");
    const titles = document.querySelectorAll(".title");
    const subtitles = document.querySelectorAll(".subtitle");

    // Initialize the active tab's title and subtitle
    const activeTabBtn = document.querySelector(".tab-btn.active");
    if (activeTabBtn) {
        const activeTabName = activeTabBtn.getAttribute("data-tab");
        document
            .querySelector(`#${activeTabName}-title`)
            .classList.add("active");
        document
            .querySelector(`#${activeTabName}-subtitle`)
            .classList.add("active");
    }

    tabButtons.forEach((button) => {
        button.addEventListener("click", () => {
            // Remove active class from all elements
            [tabButtons, tabContents, titles, subtitles].forEach(
                (collection) => {
                    collection.forEach((element) =>
                        element.classList.remove("active")
                    );
                }
            );

            // Add active class to clicked elements
            const tabName = button.getAttribute("data-tab");
            button.classList.add("active");
            document.querySelector(`#${tabName}-form`).classList.add("active");
            document.querySelector(`#${tabName}-title`).classList.add("active");
            document
                .querySelector(`#${tabName}-subtitle`)
                .classList.add("active");
        });
    });
}

function initializeRegistrationValidation() {
    const form = document.getElementById("create-account-form");
    const submitButton = form.querySelector("button[type='submit']");

    const fields = {
        name: {
            input: document.getElementById("reg-name"),
            error: document.getElementById("nameError"),
            validate: function (value) {
                if (!value) return { isValid: false, error: "" };
                const nameRegex = /^[A-Za-z\s]{2,50}$/;
                return {
                    isValid: nameRegex.test(value),
                    error: nameRegex.test(value)
                        ? ""
                        : "Name should be 2-50 characters long and contain only letters and spaces.",
                };
            },
        },
        email: {
            input: document.getElementById("reg-email"),
            error: document.getElementById("emailError"),
            validate: function (value) {
                if (!value) return { isValid: false, error: "" };
                const emailRegex =
                    /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                return {
                    isValid: emailRegex.test(value),
                    error: emailRegex.test(value)
                        ? ""
                        : "Please enter a valid email address.",
                };
            },
        },
        password: {
            input: document.getElementById("reg-password"),
            error: document.getElementById("passwordError"),
            validate: function (value) {
                if (!value) return { isValid: false, error: "" };
                const hasMinLength = value.length >= 8;
                const hasUpperCase = /[A-Z]/.test(value);
                const hasLowerCase = /[a-z]/.test(value);
                const hasNumber = /\d/.test(value);
                const hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/.test(value);

                const isValid =
                    hasMinLength &&
                    hasUpperCase &&
                    hasLowerCase &&
                    hasNumber &&
                    hasSpecialChar;

                if (!isValid) {
                    const errors = [];
                    if (!hasMinLength) errors.push("at least 8 characters");
                    if (!hasUpperCase) errors.push("one uppercase letter");
                    if (!hasLowerCase) errors.push("one lowercase letter");
                    if (!hasNumber) errors.push("one number");
                    if (!hasSpecialChar) errors.push("one special character");

                    return {
                        isValid: false,
                        error: `Password must contain ${errors.join(", ")}.`,
                    };
                }

                return { isValid: true, error: "" };
            },
        },
        confirmPassword: {
            input: document.getElementById("reg-confirm-password"),
            error: document.getElementById("confirmPasswordError"),
            validate: function (value) {
                if (!value) return { isValid: false, error: "" };
                const passwordInput = document.getElementById("reg-password");
                return {
                    isValid: value === passwordInput.value,
                    error:
                        value === passwordInput.value
                            ? ""
                            : "Passwords do not match.",
                };
            },
        },
    };

    // Add input event listeners to all fields
    Object.keys(fields).forEach((fieldName) => {
        const field = fields[fieldName];
        field.input.addEventListener("input", () => {
            validateField(fieldName, fields);
        });
    });

    // Add form submit handler
    form.addEventListener("submit", (e) => {
        e.preventDefault();

        // Validate all fields
        let isValid = true;
        Object.keys(fields).forEach((fieldName) => {
            if (!validateField(fieldName, fields)) {
                isValid = false;
            }
        });

        if (isValid) {
            form.submit();
        } else {
            submitButton.classList.add("shake");
            setTimeout(() => {
                submitButton.classList.remove("shake");
            }, 200);
        }
    });
}

function initializeSignInValidation() {
    const form = document.getElementById("signin-form");
    const submitButton = form.querySelector("button[type='submit']");

    const signInFields = {
        email: {
            input: document.getElementById("login-email"),
            error: document.getElementById("login-emailError"),
            validate: function (value) {
                if (!value)
                    return { isValid: false, error: "Email is required." };
                const emailRegex =
                    /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                return {
                    isValid: emailRegex.test(value),
                    error: emailRegex.test(value)
                        ? ""
                        : "Please enter a valid email address.",
                };
            },
        },
        password: {
            input: document.getElementById("login-password"),
            error: document.getElementById("login-passwordError"),
            validate: function (value) {
                if (!value)
                    return { isValid: false, error: "Password is required." };
                return {
                    isValid: value.length >= 8,
                    error:
                        value.length >= 8
                            ? ""
                            : "Password must be at least 8 characters long.",
                };
            },
        },
    };

    setupFormValidation(form, signInFields, submitButton);
}

function setupFormValidation(form, fields, submitButton) {
    // Add input event listeners to all fields
    Object.keys(fields).forEach((fieldName) => {
        const field = fields[fieldName];
        field.input.addEventListener("input", () => {
            validateField(fieldName, fields);
        });
    });

    // Add form submit handler
    form.addEventListener("submit", (e) => {
        e.preventDefault();

        // Validate all fields
        let isValid = true;
        Object.keys(fields).forEach((fieldName) => {
            if (!validateField(fieldName, fields)) {
                isValid = false;
            }
        });

        if (isValid) {
            form.submit();
        } else {
            submitButton.classList.add("shake");
            setTimeout(() => {
                submitButton.classList.remove("shake");
            }, 200);
        }
    });
}

function validateField(fieldName, fields) {
    const field = fields[fieldName];
    const result = field.validate(field.input.value);

    field.error.textContent = result.error;

    return result.isValid;
}
