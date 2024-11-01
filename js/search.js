document.addEventListener('DOMContentLoaded', function () {
    const searchInput = document.querySelector('.search-input');
    const searchSelect = document.querySelector('.search-select');
    const searchButton = document.querySelector('.search-button');
    const booksGrid = document.querySelector('.books-grid');
    const paginationText = document.querySelector('.pagination-text');
    const prevButton = document.querySelector('.pagination-button:first-child');
    const nextButton = document.querySelector('.pagination-button:last-child');
    const genreCheckboxes = document.querySelectorAll(
        '.filter-section:nth-child(1) input[type="checkbox"]'
    );
    const authorCheckboxes = document.querySelectorAll(
        '.filter-section:nth-child(2) input[type="checkbox"]'
    );
    const titleCheckboxes = document.querySelectorAll(
        '.filter-section:nth-child(3) input[type="checkbox"]'
    );
    const sortButton = document.querySelector('.sort-button');
    let currentSortOrder = 'none';

    let currentPage = 1;
    let totalPages = 1;

    // Store the initial featured books HTML
    const initialFeaturedBooks = booksGrid.innerHTML;

    function getSelectedFilters() {
        const filters = {
            genres: [],
            authorRanges: [],
            titleRanges: [],
        };

        genreCheckboxes.forEach((checkbox) => {
            if (checkbox.checked) {
                filters.genres.push(checkbox.value);
            }
        });

        authorCheckboxes.forEach((checkbox) => {
            if (checkbox.checked) {
                filters.authorRanges.push(checkbox.value);
            }
        });

        titleCheckboxes.forEach((checkbox) => {
            if (checkbox.checked) {
                filters.titleRanges.push(checkbox.value);
            }
        });

        return filters;
    }

    // Debounce function to prevent too many API calls
    function debounce(func, wait) {
        let timeout;
        return function executedFunction(...args) {
            const later = () => {
                clearTimeout(timeout);
                func(...args);
            };
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
        };
    }

    function updateSortButton() {
        sortButton.setAttribute('data-sort', currentSortOrder);
        switch (currentSortOrder) {
            case 'asc':
                sortButton.innerHTML = `
                    DATE (Oldest First)
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                         stroke-linejoin="round" class="sort-icon">
                        <path d="M6 9l6 6 6-6" />
                    </svg>
                `;
                break;
            case 'desc':
                sortButton.innerHTML = `
                    DATE (Newest First)
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                         stroke-linejoin="round" class="sort-icon">
                        <path d="M6 9l6 6 6-6" />
                    </svg>
                `;
                break;
            default:
                sortButton.innerHTML = `
                    DATE
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"
                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                         stroke-linejoin="round" class="sort-icon">
                        <path d="M6 9l6 6 6-6" />
                    </svg>
                `;
        }
    }

    // Function to perform search
    async function performSearch() {
        const searchType = searchSelect.value;
        const searchQuery = searchInput.value.trim();
        const filters = getSelectedFilters();

        if (
            searchQuery === '' &&
            filters.genres.length === 0 &&
            filters.authorRanges.length === 0 &&
            filters.titleRanges.length === 0 &&
            currentSortOrder === 'none'
        ) {
            booksGrid.classList.remove('no-results-grid');
            booksGrid.innerHTML = initialFeaturedBooks;
            paginationText.textContent = '1 of 1';
            prevButton.disabled = true;
            nextButton.disabled = true;
            return;
        }

        try {
            const queryParams = new URLSearchParams({
                type: searchType,
                query: searchQuery,
                page: currentPage,
                genres: filters.genres.join(','),
                authorRanges: filters.authorRanges.join(','),
                titleRanges: filters.titleRanges.join(','),
                sort: currentSortOrder,
            });
            const response = await fetch(
                `utils/search/search_books.php?${queryParams}`
            );

            const data = await response.json();

            // If there's an error in the response, throw it
            if (data.error) {
                throw new Error(data.error);
            }

            // Clear existing content
            booksGrid.innerHTML = '';

            if (data.books.length === 0) {
                booksGrid.classList.add('no-results-grid'); // Add this class
                booksGrid.innerHTML =
                    '<p class="no-results">No books found. Try a different search.</p>';
                paginationText.textContent = '0 of 0';
                prevButton.disabled = true;
                nextButton.disabled = true;
                return;
            } else {
                booksGrid.classList.remove('no-results-grid'); // Remove class when showing results
            }

            // Add each book to the grid
            data.books.forEach((book) => {
                const bookCard = document.createElement('a');
                bookCard.className = 'book-card';
                bookCard.href = `details.php?id=${book.id}`;

                bookCard.innerHTML = `
                    <div class="book-cover">
                        <img src="${book.thumbnail_url}" alt="${book.title}" />
                    </div>
                    <h3 class="book-title">${book.title}</h3>
                    <p class="book-author">${book.author}</p>
                `;

                booksGrid.appendChild(bookCard);
            });

            // Update pagination
            totalPages = data.totalPages || 1;
            paginationText.textContent = `${currentPage} of ${totalPages}`;
            prevButton.disabled = currentPage <= 1;
            nextButton.disabled = currentPage >= totalPages;
        } catch (error) {
            console.error('Error performing search:', error);
            // For actual errors (not empty searches), show error message
            if (searchQuery !== '') {
                booksGrid.innerHTML =
                    '<p class="error-message">Error loading books. Please try again.</p>';
                paginationText.textContent = '0 of 0';
                prevButton.disabled = true;
                nextButton.disabled = true;
            }
        }
    }

    // Debounced search function
    const debouncedSearch = debounce(performSearch, 300);

    // Event listeners
    sortButton.addEventListener('click', () => {
        // Cycle through sort states
        switch (currentSortOrder) {
            case 'none':
                currentSortOrder = 'asc';
                break;
            case 'asc':
                currentSortOrder = 'desc';
                break;
            case 'desc':
                currentSortOrder = 'none';
                break;
        }
        updateSortButton();
        performSearch();
    });

    searchInput.addEventListener('input', debouncedSearch);
    searchSelect.addEventListener('change', () => {
        if (searchInput.value.trim() !== '') {
            performSearch();
        }
    });
    searchButton.addEventListener('click', performSearch);

    genreCheckboxes.forEach((checkbox) => {
        checkbox.addEventListener('change', performSearch);
    });

    authorCheckboxes.forEach((checkbox) => {
        checkbox.addEventListener('change', performSearch);
    });

    titleCheckboxes.forEach((checkbox) => {
        checkbox.addEventListener('change', performSearch);
    });

    // Pagination handlers
    prevButton.addEventListener('click', () => {
        if (currentPage > 1) {
            currentPage--;
            performSearch();
        }
    });

    nextButton.addEventListener('click', () => {
        if (currentPage < totalPages) {
            currentPage++;
            performSearch();
        }
    });
});
