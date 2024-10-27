const select = document.querySelector('.period-select');

// Initial setup
updateDisplayText();

// Update when selection changes
select.addEventListener('change', updateDisplayText);

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
