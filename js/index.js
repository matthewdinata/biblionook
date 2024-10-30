document.addEventListener("DOMContentLoaded", function () {
    function debounce(func, delay) {
        let timeoutId;
        return function (...args) {
            clearTimeout(timeoutId);
            timeoutId = setTimeout(() => func.apply(this, args), delay);
        };
    }

    const searchInput = document.getElementById("search-input");
    const suggestionsContainer = document.getElementById("suggestions");

    if (searchInput && suggestionsContainer) {
        const getSuggestions = debounce((query) => {
            if (query.length < 2) {
                suggestionsContainer.style.display = "none";
                return;
            }

            fetch(
                `utils/index/get_suggestion.php?query=${encodeURIComponent(
                    query
                )}`
            )
                .then((response) => response.json())
                .then((data) => {
                    console.log(data);
                    suggestionsContainer.innerHTML = "";
                    if (data.length > 0) {
                        data.forEach((item) => {
                            const div = document.createElement("div");
                            div.innerHTML = `
                                <a href="details.php?id=${item.id}">
                                    <div class="suggestion-item">
                                        <img src="${item.thumbnail_url}"
                                            alt="${item.title}" />
                                        <div class="text">
                                            <span>${item.title}</span> by <span>${item.author}</span>
                                        </div>
                                    </div>
                                </a>`;
                            div.className = "suggestion-item";
                            div.onclick = () => {
                                searchInput.value = "";
                                suggestionsContainer.style.display = "none";
                            };
                            suggestionsContainer.appendChild(div);
                        });
                        suggestionsContainer.style.display = "block";
                    } else {
                        const div = document.createElement("div");
                        div.textContent = "Oops! No results found";
                        div.className = "suggestion-item";
                        suggestionsContainer.appendChild(div);
                        suggestionsContainer.style.display = "block";
                    }
                })
                .catch((error) => console.error("Error:", error));
        }, 300);

        searchInput.addEventListener("input", (e) =>
            getSuggestions(e.target.value)
        );

        document.addEventListener("click", (e) => {
            if (
                !searchInput.contains(e.target) &&
                !suggestionsContainer.contains(e.target)
            ) {
                suggestionsContainer.style.display = "none";
            }
        });
    } else {
        console.error("Search input or suggestions container not found");
    }
});
