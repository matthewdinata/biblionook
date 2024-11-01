class SlideoutMenu {
    constructor() {
        this.activeMenu = null;
        this.init();
    }

    init() {
        // Close menu when clicking overlay or close button
        document.addEventListener('click', (e) => {
            if (
                e.target.classList.contains('slideout-overlay') ||
                e.target.classList.contains('close-button')
            ) {
                this.closeActiveMenu(true); // true indicates it should reset
            }
        });

        // Close menu on escape key
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && this.activeMenu) {
                this.closeActiveMenu(true);
            }
        });
    }

    open(menuId) {
        const menu = document.getElementById(menuId);
        if (!menu) return;

        // Store original content if not already stored
        if (!this.originalContent) {
            const slideoutBody = menu.querySelector('.slideout-body');
            if (slideoutBody) {
                this.originalContent = slideoutBody.innerHTML;
            }
        }

        // Close any active menu first
        if (this.activeMenu) {
            this.closeActiveMenu(true);
        }

        menu.style.display = 'block';
        // Trigger reflow
        menu.offsetHeight;
        menu.classList.add('active');
        this.activeMenu = menu;
        document.body.style.overflow = 'hidden';
    }

    closeActiveMenu(shouldReset = false) {
        if (!this.activeMenu) return;

        this.activeMenu.classList.remove('active');
        const menu = this.activeMenu;
        this.activeMenu = null;
        document.body.style.overflow = '';

        // Wait for animation to complete before hiding
        setTimeout(() => {
            menu.style.display = 'none';
            if (shouldReset) {
                this.resetMenuContent(menu);
            }
        }, 300);
    }

    resetMenuContent(menu) {
        if (!this.originalContent) return;

        const slideoutBody = menu.querySelector('.slideout-body');
        if (slideoutBody) {
            slideoutBody.innerHTML = this.originalContent;

            // Reinitialize the payment form validator
            const paymentForm = document.getElementById('slideout-paymentForm');
            if (paymentForm) {
                new PaymentFormValidator('slideout-paymentForm');
            }
        }
    }
}

// Initialize slideout menu handler
const slideoutMenu = new SlideoutMenu();

class PaymentFormValidator {
    constructor(formId) {
        this.form = document.getElementById(formId);
        this.errorMessages = new Map();
        this.init();
    }

    init() {
        if (!this.form) return;

        // Initialize input event listeners
        this.form.querySelectorAll('input').forEach((input) => {
            // Create error message container for each input
            const errorDiv = document.createElement('div');
            errorDiv.className = 'error-message';
            input.parentNode.appendChild(errorDiv);
            this.errorMessages.set(input.id, errorDiv);

            // Add input event listeners
            input.addEventListener('input', (e) =>
                this.validateField(e.target)
            );
            input.addEventListener('blur', (e) => this.validateField(e.target));
        });

        // Add form submit handler
        this.form.addEventListener('submit', (e) => this.handleSubmit(e));
    }

    showSuccessState() {
        // Get the slideout content
        const slideoutContent = this.form.closest('.slideout-body');

        // Store the original content
        this.originalContent = slideoutContent.innerHTML;

        // Create and show success message
        const successHTML = `
            <div class="payment-success">
                <div class="success-icon">✓</div>
                <h2>Payment Successful!</h2>
                <p>Thank you for your payment. You can now enjoy your purchase.</p>
                <button class="done-button">Done</button>
            </div>
        `;

        // Replace content with success message
        slideoutContent.innerHTML = successHTML;

        const doneButton = slideoutContent.querySelector('.done-button');
        doneButton.addEventListener('click', () => {
            // Close the slideout menu
            window.slideoutMenu.closeActiveMenu();

            // Wait for slideout animation to complete, then refresh the page
            setTimeout(() => {
                window.location.reload();
            }, 300); // Match the slideout close animation duration
        });
    }

    validateField(field) {
        const errorDiv = this.errorMessages.get(field.id);
        let error = '';

        switch (field.id) {
            case 'slideout-cardholderName':
                if (!field.value.trim()) {
                    error = 'Cardholder name is required';
                } else if (!/^[a-zA-Z\s]{2,50}$/.test(field.value.trim())) {
                    error =
                        'Please enter a valid name (2-50 characters, letters only)';
                }
                break;

            case 'slideout-email':
                if (!field.value.trim()) {
                    error = 'Email address is required';
                } else if (
                    !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(field.value.trim())
                ) {
                    error = 'Please enter a valid email address';
                }
                break;

            case 'slideout-cardNumber':
                // Clean non-digits first
                const cleanNumber = field.value.replace(/\D/g, '');

                // Limit to 16 digits before formatting
                const truncatedNumber = cleanNumber.slice(0, 16);

                // Format with dashes after every 4 digits
                field.value = truncatedNumber.replace(/(\d{4})(?=\d)/g, '$1-');

                // Validation
                if (!truncatedNumber) {
                    error = 'Card number is required';
                } else if (truncatedNumber.length !== 16) {
                    error = 'Please enter a valid 16-digit card number';
                }
                break;

            case 'slideout-month':
                const monthValue = field.value.trim();
                const monthNum = parseInt(monthValue);

                if (!monthValue) {
                    error = 'Month is required';
                } else if (
                    !monthValue.match(/^(0[1-9]|1[0-2])$/) &&
                    !monthValue.match(/^[1-9]$/)
                ) {
                    error = 'Invalid month';
                }
                break;

            case 'slideout-year':
                const year = parseInt(field.value);
                const currentYear = new Date().getFullYear();
                if (!field.value.trim()) {
                    error = 'Year is required';
                } else if (year < currentYear || year > currentYear + 10) {
                    error = `Invalid year`;
                }
                break;

            case 'slideout-cvv':
                if (!field.value.trim()) {
                    error = 'CVV is required';
                } else if (!/^\d{3,4}$/.test(field.value)) {
                    error = 'Invalid CVV';
                }
                break;
        }

        // Update UI with error message
        errorDiv.textContent = error;
        field.classList.toggle('error', !!error);
        return !error;
    }

    validateForm() {
        let isValid = true;
        this.form.querySelectorAll('input').forEach((input) => {
            if (!this.validateField(input)) {
                isValid = false;
            }
        });
        return isValid;
    }

    handleSubmit(e) {
        e.preventDefault();
        if (this.validateForm()) {
            // Show loading state
            const submitButton = this.form.querySelector(
                '.slideout-submit-button'
            );
            submitButton.disabled = true;
            submitButton.textContent = 'Processing...';

            if (typeof processPayment === "function") {
                // Call the global function to process payment
                processPayment();
            }
            // Simulate payment processing
            setTimeout(() => {
                this.showSuccessState();
            }, 2000);
        }
    }
}

// Initialize both components when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    // Initialize slideout menu globally
    window.slideoutMenu = new SlideoutMenu();

    // Initialize payment form validation if the form exists
    const paymentForm = document.getElementById('slideout-paymentForm');
    if (paymentForm) {
        new PaymentFormValidator('slideout-paymentForm');
    }
});
