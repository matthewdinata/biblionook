const select = document.querySelector('.period-select');
const priceAmountElement = document.querySelector('.price .amount');
const pricePeriodElement = document.querySelector('.price .period');

const baseFee = parseFloat(priceAmountElement.textContent.replace('$', ''));

// Initial setup
updateDisplayText();
updatePrice();

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

function updateDisplayText() {
    const selectedOption = select.options[select.selectedIndex];
    const displayText = selectedOption.dataset.display;

    // Create and insert a new option with the display text
    const displayOption = document.createElement('option');
    displayOption.textContent = displayText;
    displayOption.value = selectedOption.value;
    displayOption.hidden = true; // This hides it from the dropdown list
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

function updatePrice() {
    const selectedValue = parseInt(select.value);
    const numberOfDays = selectedValue * 7;
    const totalFee = (baseFee * selectedValue).toFixed(2);

    // Update the main price display
    priceAmountElement.textContent = `$${totalFee}`;
    pricePeriodElement.textContent = `/ ${numberOfDays} days`;

    // Update payment form if it's visible
    updatePaymentForm();
}

function updatePaymentForm() {
    const paymentDueAmount = document.querySelector(
        '.payment-form .price-display .amount'
    );
    const paymentDuePeriod = document.querySelector(
        '.payment-form .price-display .period'
    );

    if (paymentDueAmount && paymentDuePeriod) {
        const selectedValue = parseInt(select.value);
        const numberOfDays = selectedValue * 7;
        const totalFee = (baseFee * selectedValue).toFixed(2);

        paymentDueAmount.textContent = `$${totalFee}`;
        paymentDuePeriod.textContent = `for ${numberOfDays} days`;
    }
}
