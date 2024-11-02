function returnBook(bookId, bookTitle) {
    if (!confirm(`Are you sure you want to return ${bookTitle}?`)) {
        return;
    }
    fetch("utils/books/process_return_book.php", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({ book_id: bookId }),
    })
        .then((response) => response.json())
        .then((data) => {
            if (data.success) {
                alert("Book returned successfully");
                location.reload();
            } else {
                alert("Error: " + data.message);
            }
        })
        .catch((error) => {
            console.error("Error:", error);
            alert("An error occurred while returning the book");
        });
}
