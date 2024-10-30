class SlideoutMenu {
    constructor() {
        this.activeMenu = null;
        this.originalContent = null;
        this.currentBookData = null;
        this.init();
    }

    init() {
        // Close menu when clicking overlay or close button
        document.addEventListener("click", (e) => {
            if (
                e.target.classList.contains("slideout-overlay") ||
                e.target.classList.contains("close-button")
            ) {
                this.closeActiveMenu(true); // true indicates it should reset
            }
        });

        // Close menu on escape key
        document.addEventListener("keydown", (e) => {
            if (e.key === "Escape" && this.activeMenu) {
                this.closeActiveMenu(true);
            }
        });
    }

    open(menuId, bookData = null) {
        const menu = document.getElementById(menuId);
        if (!menu) return;

        // Store original content if not already stored
        if (!this.originalContent) {
            const slideoutBody = menu.querySelector(".slideout-body");
            if (slideoutBody) {
                this.originalContent = slideoutBody.innerHTML;
            }
        }

        // Close any active menu first
        if (this.activeMenu) {
            this.closeActiveMenu(true);
        }

        // If book data is provided, update the review modal content
        if (bookData) {
            this.updateReviewContent(menu, bookData);
        }

        menu.style.display = "block";
        // Trigger reflow
        menu.offsetHeight;
        menu.classList.add("active");
        this.activeMenu = menu;
        document.body.style.overflow = "hidden";
    }

    updateReviewContent(menu, bookData) {
        this.currentBookData = bookData;

        console.log(JSON.stringify(bookData, null, 2));

        const form = document.getElementById("reviewForm");
        const coverImage = menu.querySelector("#review-book-cover");
        const bookTitle = menu.querySelector("#review-book-title");
        const bookMeta = menu.querySelector("#review-book-meta");

        if (form) {
            form.dataset.bookId = bookData.id;
        }

        if (coverImage) {
            coverImage.src = bookData.thumbnail_url;
            coverImage.alt = bookData.title;
        }

        if (bookTitle) {
            bookTitle.textContent = bookData.title;
        }

        if (bookMeta) {
            bookMeta.textContent = `by ${bookData.author}`;
        }
    }

    closeActiveMenu(shouldReset = false) {
        if (!this.activeMenu) return;

        this.activeMenu.classList.remove("active");
        const menu = this.activeMenu;
        this.activeMenu = null;
        document.body.style.overflow = "";

        // Wait for animation to complete before hiding
        setTimeout(() => {
            menu.style.display = "none";
            if (shouldReset) {
                this.resetMenuContent(menu);
            }
        }, 300);
    }

    resetMenuContent(menu) {
        if (!this.originalContent) return;

        const slideoutBody = menu.querySelector(".slideout-body");
        if (slideoutBody) {
            slideoutBody.innerHTML = this.originalContent;

            // Reset current book data
            this.currentBookData = null;

            // Reinitialize the review form validator
            const reviewForm = document.getElementById("reviewForm");
            if (reviewForm) {
                new ReviewFormValidator("reviewForm");
            }
        }
    }
}

// Function to handle opening the review modal
function openReview(bookData) {
    window.slideoutMenu.open("reviewSlideout", bookData);
}

class ReviewFormValidator {
    constructor(formId) {
        this.form = document.getElementById(formId);
        this.errorMessages = new Map();
        this.init();
    }

    init() {
        if (!this.form) return;

        // Initialize star rating
        this.initStarRating();

        // Initialize input fields validation
        this.form
            .querySelectorAll('input[type="text"], textarea')
            .forEach((input) => {
                // Create error message container for each input
                const errorDiv = document.createElement("div");
                errorDiv.className = "error-message";
                input.parentNode.appendChild(errorDiv);
                this.errorMessages.set(input.id, errorDiv);

                // Add input event listeners
                input.addEventListener("input", (e) =>
                    this.validateField(e.target)
                );
                input.addEventListener("blur", (e) =>
                    this.validateField(e.target)
                );
            });

        // Add form submit handler
        this.form.addEventListener("submit", (e) => this.handleSubmit(e));
    }

    initStarRating() {
        this.ratingContainer = this.form.querySelector(".rating-input");
        this.ratingInputs = this.form.querySelectorAll(".star-input");

        // Create error message container for rating
        const errorDiv = document.createElement("div");
        errorDiv.className = "error-message";
        this.ratingContainer.after(errorDiv);
        this.errorMessages.set("rating", errorDiv);

        // Add rating change listener
        this.ratingInputs.forEach((input) => {
            input.addEventListener("change", () => this.validateRating());
        });
    }

    validateRating() {
        const errorDiv = this.errorMessages.get("rating");
        const selectedRating = this.form.querySelector(
            'input[name="rating"]:checked'
        );

        if (!selectedRating) {
            errorDiv.textContent = "Please select a rating";
            return false;
        }

        errorDiv.textContent = "";
        return true;
    }

    validateField(field) {
        const errorDiv = this.errorMessages.get(field.id);
        let error = "";

        switch (field.id) {
            case "reviewTitle":
                if (!field.value.trim()) {
                    error = "Review title is required";
                } else if (field.value.trim().length < 3) {
                    error = "Title must be at least 3 characters long";
                } else if (field.value.trim().length > 100) {
                    error = "Title must be less than 100 characters";
                }
                break;

            case "reviewContent":
                if (!field.value.trim()) {
                    error = "Review content is required";
                } else if (field.value.trim().length < 10) {
                    error = "Review must be at least 10 characters long";
                } else if (field.value.trim().length > 1000) {
                    error = "Review must be less than 1000 characters";
                }
                break;
        }

        // Update UI with error message
        errorDiv.textContent = error;
        field.classList.toggle("error", !!error);
        return !error;
    }

    validateForm() {
        let isValid = true;

        // Validate rating
        if (!this.validateRating()) {
            isValid = false;
        }

        // Validate other fields
        this.form
            .querySelectorAll('input[type="text"], textarea')
            .forEach((input) => {
                if (!this.validateField(input)) {
                    isValid = false;
                }
            });

        return isValid;
    }

    showSuccessState() {
        // Get the form container
        const formContainer = this.form.parentElement;

        // Create and show success message
        const successHTML = `
            <div class="review-success">
                <div class="success-icon">✓</div>
                <h2>Review Submitted!</h2>
                <p>Thank you for sharing your thoughts. Your review will help others discover great books!</p>
                <button type="button" class="done-button">Done</button>
            </div>
        `;

        // Store original content and replace with success message
        this.originalContent = formContainer.innerHTML;
        formContainer.innerHTML = successHTML;

        // Handle done button click
        const doneButton = formContainer.querySelector(".done-button");
        doneButton.addEventListener("click", () => {
            location.reload();
        });
    }

    handleSubmit(e) {
        e.preventDefault();

        if (this.validateForm()) {
            // Show loading state
            const submitButton = this.form.querySelector(
                ".submit-review-button"
            );
            const originalText = submitButton.textContent;
            submitButton.disabled = true;
            submitButton.textContent = "Submitting...";

            // Create form data
            const formData = new FormData(this.form);
            const bookId = this.form.dataset.bookId;
            formData.append("book_id", bookId);

            // Send to server
            fetch("./utils/review/process_review.php", {
                method: "POST",
                body: formData,
            })
                .then((response) => response.json())
                .then((data) => {
                    if (data.success) {
                        this.showSuccessState();
                    } else {
                        submitButton.disabled = false;
                        submitButton.textContent = originalText;
                        alert(data.message || "Error submitting review");
                    }
                })
                .catch((error) => {
                    console.error("Error:", error);
                    submitButton.disabled = false;
                    submitButton.textContent = originalText;
                    alert("Error submitting review. Please try again.");
                });
        }
    }
}

// Initialize both components when DOM is loaded
document.addEventListener("DOMContentLoaded", () => {
    // Initialize slideout menu globally
    window.slideoutMenu = new SlideoutMenu();

    // Initialize when DOM is loaded
    new ReviewFormValidator("reviewForm");
});
