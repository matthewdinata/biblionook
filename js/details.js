const select = document.querySelector('.period-select');
const priceAmountElement = document.querySelector('.price .amount');
const pricePeriodElement = document.querySelector('.price .period');

// Initialize base fee
let baseFee = 0;
if (priceAmountElement) {
    baseFee = parseFloat(priceAmountElement.textContent.replace('$', ''));
}

// Initial setup for display text
if (select) {
    updateDisplayText();
}

// Initialize price display for free membership
if (priceAmountElement && pricePeriodElement) {
    // Set initial period text
    const initialDays = 7;
    pricePeriodElement.textContent = `/ ${initialDays} days`;

    // Update when selection changes
    select.addEventListener('change', () => {
        updateDisplayText();
        updatePrice();
    });

    // Add event listener for slideout menu opening
    const paymentSlideout = document.getElementById('paymentSlideout');
    if (paymentSlideout) {
        const observer = new MutationObserver((mutations) => {
            mutations.forEach((mutation) => {
                if (mutation.target.classList.contains('active')) {
                    updatePaymentForm();
                }
            });
        });

        observer.observe(paymentSlideout, {
            attributes: true,
            attributeFilter: ['class'],
        });
    }

    // Initial price update
    updatePrice();
}

// Function to handle member borrowing (for lite/plus memberships)
function handleMemberBorrow() {
    const periodSelect = document.getElementById('memberPeriodSelect');
    if (!periodSelect) return;

    const selectedPeriod = periodSelect.value;
    const numberOfDays = selectedPeriod * 7;

    if (confirm(`Confirm borrowing this book for ${numberOfDays} days?`)) {
        submitBorrowingRequest(selectedPeriod);
    }
}

// Function to submit borrowing request for both free and premium members
async function submitBorrowingRequest(periodValue) {
    try {
        const response = await fetch('utils/details/process_borrow.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                book_id: bookId,
                period: periodValue,
            }),
        });

        const data = await response.json();

        if (data.success) {
            alert(
                'Book borrowed successfully! Due date: ' +
                    new Date(data.due_date).toLocaleDateString()
            );
            window.location.href = 'books.php';
        } else {
            alert(data.message || 'Failed to borrow book. Please try again.');
        }
    } catch (error) {
        console.error('Error:', error);
        alert('An error occurred. Please try again.');
    }
}

// Display text updating function
function updateDisplayText() {
    if (!select) return;

    const selectedOption = select.options[select.selectedIndex];
    const displayText = selectedOption.dataset.display;

    // Create and insert a new option with the display text
    const displayOption = document.createElement('option');
    displayOption.textContent = displayText;
    displayOption.value = selectedOption.value;
    displayOption.hidden = true;
    displayOption.selected = true;

    // Remove any previous hidden display options
    Array.from(select.options).forEach((option) => {
        if (option.hidden) {
            select.removeChild(option);
        }
    });

    // Insert the display option at the start
    select.insertBefore(displayOption, select.firstChild);
}

// Price updating function
function updatePrice() {
    if (!select || !priceAmountElement || !pricePeriodElement) return;

    const selectedValue = parseInt(select.value);
    const numberOfDays = selectedValue * 7;
    const totalFee = (baseFee * selectedValue).toFixed(2);

    // Update the main price display
    priceAmountElement.textContent = `$${totalFee}`;
    pricePeriodElement.textContent = `/ ${numberOfDays} days`;

    // Update payment form if it's visible
    updatePaymentForm();
}

// Payment form updating function
function updatePaymentForm() {
    const paymentDueAmount = document.querySelector(
        '.payment-form .price-display .amount'
    );
    const paymentDuePeriod = document.querySelector(
        '.payment-form .price-display .period'
    );

    if (paymentDueAmount && paymentDuePeriod && select) {
        const selectedValue = parseInt(select.value);
        const numberOfDays = selectedValue * 7;
        const totalFee = (baseFee * selectedValue).toFixed(2);

        paymentDueAmount.textContent = `$${totalFee}`;
        paymentDuePeriod.textContent = `for ${numberOfDays} days`;
    }
}
