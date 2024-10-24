-- User Table
CREATE TABLE User (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL,
    membership_type ENUM('free', 'lite', 'plus') NOT NULL
);

-- Payment Table
CREATE TABLE Payment (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATETIME NOT NULL,
    payment_type ENUM('membership', 'borrowing') NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(id)
);

-- Book Table
CREATE TABLE Book (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    isbn VARCHAR(13) NOT NULL,
    publication_date DATE,
    genre VARCHAR(100),
    summary TEXT,
    date_added DATE NOT NULL,
    fee DECIMAL(5, 2) NOT NULL,
    total_copies INT NOT NULL,
    is_featured BOOLEAN DEFAULT FALSE,
    file LONGBLOB,
    thumbnail_url VARCHAR(255)
);

-- Borrowing Table
CREATE TABLE Borrowing (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    book_id INT,
    payment_id INT,
    borrow_date DATETIME NOT NULL,
    due_date DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (book_id) REFERENCES Book(id),
    FOREIGN KEY (payment_id) REFERENCES Payment(id)
);

-- Review Table
CREATE TABLE Review (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    book_id INT,
    rating INT NOT NULL,
    title VARCHAR(255),
    content TEXT,
    review_date DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (book_id) REFERENCES Book(id)
);