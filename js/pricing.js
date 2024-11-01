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
            <input type="hidden" name="selected-plan" value="${planKey}" />
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

function processPayment() {
    const selectedPlan = document.querySelector(
        "#paymentSlideout input[name=selected-plan]"
    ).value;

    // Create a form data object to submit the selected plan to the PHP script
    const formData = new FormData();
    formData.append("selected-plan", selectedPlan);

    fetch("utils/pricing/process_upgrade_plan.php", {
        method: "POST",
        body: formData,
    })
        .then((response) => response.json())
        .then((data) => {
            if (data.success) {
                console.log("Payment successful!");
            } else {
                // Handle errors
                const errorMessages = data.errors.join("<br>");
                document.querySelector(".error-message").innerHTML =
                    errorMessages;
            }
        })
        .catch((error) => {
            console.error("Error:", error);
        });
}

function switchPlan(planKey) {
    if (!confirm(`Are you sure you want to switch to ${planKey} plan?`)) {
        return;
    }
    const formData = new FormData();
    formData.append("selected-plan", planKey);

    fetch("utils/pricing/process_upgrade_plan.php", {
        method: "POST",
        body: formData,
    })
        .then((response) => response.json())
        .then((data) => {
            if (data.success) {
                window.location.reload();
            } else {
                const errorMessages = data.errors.join("<br>");
                document.querySelector(".error-message").innerHTML =
                    errorMessages;
            }
        })
        .catch((error) => {
            console.error("Error:", error);
        });
}
