function upgradePlan(planType) {
    // First check if user is logged in
    fetch("./utils/auth/check_auth.php")
        .then((response) => response.json())
        .then((data) => {
            if (!data.authenticated) {
                window.location.href = "auth.php";
                return;
            }

            // If authenticated, proceed with plan upgrade
            window.location.href = `payment.php?plan=${planType}`;
        })
        .catch((error) => {
            console.error("Error:", error);
            alert("An error occurred. Please try again later.");
        });
}

// Add smooth scrolling for anchor links
document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
    anchor.addEventListener("click", function (e) {
        e.preventDefault();
        document.querySelector(this.getAttribute("href")).scrollIntoView({
            behavior: "smooth",
        });
    });
});
