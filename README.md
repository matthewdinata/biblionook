# BiblioNook - The Online Hub for All Your Favourite Reads

BiblioNook is a digital library platform that provides a seamless reading experience with features for both free and paid members. Users can browse, search, borrow and review books through an intuitive interface.

## Features

- **Home Page**: Search functionality, featured books and new arrivals sections
- **Book Directory**: Browse complete collection with filtering and sorting options  
- **Book Details**: Comprehensive book information and user reviews
- **Borrowing System**: Flexible borrowing options for different membership tiers
- **Membership Plans**: Free, Lite and Plus subscription options
- **Advanced Search**: Enhanced search capabilities for Plus members
- **User Authentication**: Secure login system with role-based access

## Tech Stack

- Frontend: HTML, CSS, JavaScript
- Backend: PHP
- Database: MySQL

## Project Structure

```
biblionook
├── README.md
├── assets
│   ├── icons
│   │   ├── arrow-right.png
│   │   ├── books.svg
│   │   ├── check-white.png
│   │   ├── check.png
│   │   ├── home.svg
│   │   ├── pricing.svg
│   │   ├── read.svg
│   │   ├── return.svg
│   │   ├── review.svg
│   │   ├── reviewed.svg
│   │   ├── search-inverted.svg
│   │   ├── search.svg
│   │   ├── sign-in.svg
│   │   ├── star-empty.svg
│   │   ├── star-filled.svg
│   │   ├── star-half-filled.svg
│   │   ├── user.svg
│   │   └── user_profile.png
│   └── logo.svg
├── auth.php
├── books.php
├── components
│   ├── render_navbar.php
│   ├── render_review.php
│   ├── render_slideout_menu.php
│   └── render_theme_toggle.php
├── css
│   ├── auth.css
│   ├── books.css
│   ├── components.css
│   ├── details.css
│   ├── globals.css
│   ├── index.css
│   ├── main.css
│   ├── pricing.css
│   ├── read.css
│   └── search.css
├── details.php
├── index.php
├── js
│   ├── auth.js
│   ├── books.js
│   ├── components
│   │   ├── render_review.js
│   │   └── render_slideout_menu.js
│   ├── details.js
│   ├── index.js
│   ├── pricing.js
│   └── search.js
├── lib
│   └── db.php
├── pricing.php
├── read.php
├── search.php
├── sql
│   ├── create.sql
│   └── create_v2.sql
└── utils
    ├── auth
    │   ├── logout.php
    │   ├── process_login.php
    │   └── process_registration.php
    ├── books
    │   └── process_return_book.php
    ├── details
    │   ├── process_borrow.php
    │   └── process_borrow_with_payment.php
    ├── index
    │   └── get_suggestion.php
    ├── pricing
    │   └── process_upgrade_plan.php
    ├── review
    │   └── process_review.php
    └── search
        └── search_books.php
```

## Installation

1. Clone the repository
2. Import `sql/create_v2.sql` into your MySQL database
3. Configure database connection in `lib/db.php`
4. Serve using a PHP-enabled web server

## Database Schema

The application uses the following main tables:
- Users: Stores user accounts and membership details
- Books: Contains book information and metadata
- Borrowings: Tracks book borrowing records
- Reviews: Stores user reviews and ratings
- Payments: Records membership and borrowing payments

## Testing

The application includes comprehensive testing for:
- User authentication
- Membership management
- Book browsing and searching
- Borrowing workflow
- Review system
- Payment processing
- Responsive design

## Contributing

This project was developed for IE4727 Web Application Design by:
- Gabrielle Nicole Suharjono (U2120811H)
- Matthew Dinata (U2120122G)
