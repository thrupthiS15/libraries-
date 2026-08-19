
CREATE DATABASE IF NOT EXISTS librarydb;
USE librarydb;

CREATE TABLE IF NOT EXISTS users(
 id INT AUTO_INCREMENT PRIMARY KEY,
 username VARCHAR(50),
 email VARCHAR(100) UNIQUE,
 password VARCHAR(100),
 role VARCHAR(20) DEFAULT 'USER'
);

CREATE TABLE IF NOT EXISTS books(
 id INT AUTO_INCREMENT PRIMARY KEY,
 title VARCHAR(100),
 author VARCHAR(100),
 category VARCHAR(50),
 quantity INT,
 shelf_number VARCHAR(50) DEFAULT 'Not Assigned',
 UNIQUE KEY unique_book (title, author)
);

INSERT IGNORE INTO users(username,email,password,role)
VALUES('admin','admin@library.com','admin123','ADMIN');

CREATE TABLE IF NOT EXISTS borrows (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    borrow_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    return_date TIMESTAMP NULL,
    status VARCHAR(20) DEFAULT 'BORROWED',
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE
);

INSERT IGNORE INTO books (title, author, category, quantity, shelf_number) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 5, 'Shelf A-1'),
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 3, 'Shelf A-3'),
('A Brief History of Time', 'Stephen Hawking', 'Science', 2, 'Shelf B-2'),
('Introduction to Algorithms', 'Thomas H. Cormen', 'Technology', 4, 'Shelf C-1'),
('Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 'History', 6, 'Shelf D-4');

