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

function openPaymentSlideout(planKey) {
    // Get the plan data
    const plan = plansData[planKey];

    // Generate the content HTML with a specific class for easier removal
    const content = `
        <div class="plan-details-content">
            <div class="plan-header">
                <div class="price">
                    <span class="amount">$${plan.price}</span>
                    <span class="period">/mon</span>
                </div>
                <h2>${plan.name}</h2>
            </div>
            <div class="plan-features">
                ${plan.features
                    .map(
                        (feature) => `
                    <div class="feature">
                        <img src="assets/icons/check.png" alt="check">
                        <span>${feature}</span>
                    </div>
                `
                    )
                    .join("")}
            </div>
        </div>
    `;

    // Update the slideout content
    const slideoutBody = document.querySelector(
        "#paymentSlideout .slideout-body"
    );
    const paymentDetails = slideoutBody.querySelector(
        ".slideout-payment-details"
    );

    // Remove any existing plan content
    const existingContent = slideoutBody.querySelector(".plan-details-content");
    if (existingContent) {
        existingContent.remove();
    }

    // Insert the new content before the payment form
    paymentDetails.insertAdjacentHTML("beforebegin", content);

    // Open the slideout
    slideoutMenu.open("paymentSlideout");
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
