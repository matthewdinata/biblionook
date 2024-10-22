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
