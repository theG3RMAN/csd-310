DROP USER IF EXISTS 'root'@'localhost';

CREATE USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'admin';

GRANT ALL PRIVILEGES ON whatabook.* TO'root'@'localhost';

ALTER TABLE wishlist DROP FOREIGN KEY fk_book;
ALTER TABLE wishlist DROP FOREIGN KEY fk_user;

-- drop tables if they exist
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS user;

/*
    Create table(s)
*/
CREATE TABLE store (
    store_id    INT             NOT NULL    AUTO_INCREMENT,
    locale      VARCHAR(500)    NOT NULL,
    PRIMARY KEY(store_id)
);

CREATE TABLE book (
    book_id     INT             NOT NULL    AUTO_INCREMENT,
    book_name   VARCHAR(200)    NOT NULL,
    author      VARCHAR(200)    NOT NULL,
    details     VARCHAR(500),
    PRIMARY KEY(book_id)
);

CREATE TABLE user (
    user_id         INT         NOT NULL    AUTO_INCREMENT,
    first_name      VARCHAR(75) NOT NULL,
    last_name       VARCHAR(75) NOT NULL,
    PRIMARY KEY(user_id) 
);

CREATE TABLE wishlist (
    wishlist_id     INT         NOT NULL    AUTO_INCREMENT,
    user_id         INT         NOT NULL,
    book_id         INT         NOT NULL,
    PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_book
    FOREIGN KEY (book_id)
        REFERENCES book(book_id),
    CONSTRAINT fk_user
    FOREIGN KEY (user_id)
        REFERENCES user(user_Id)
);

/*
    insert store record 
*/
INSERT INTO store(locale)
    VALUES('Oregon');

/*
    insert book records 
*/
INSERT INTO book(book_name, author, details)
    VALUES('Jane Eyre', 'Charlote Bronte', 'novel of experience by a eponymous heroine');

INSERT INTO book(book_name, author, details)
    VALUES('Of Mice and Men', 'John Steinbeck', 'Depression era 1937 novel');

INSERT INTO book(book_name, author, details)
    VALUES('The Misanthrope', 'Moliere', 'a classic play');

INSERT INTO book(book_name, author)
    VALUES('The Great Gatsby', 'F. Scott Fitzgerald', '1925 Novella');

INSERT INTO book(book_name, author)
    VALUES('Animal Farm', 'George Orewell', 'allegorical novel');

INSERT INTO book(book_name, author)
    VALUES('Narrative of the Life of Frederick Douglas, An American Slave', 'Fredrick Douglass','Powerful autobiography account of Douglass life as a slave');

INSERT INTO book(book_name, author)
    VALUES('Songs of Innocence and of Experience', 'William Blake' ,'small collection of poetry');

INSERT INTO book(book_name, author)
    VALUES('Pride and Prejudice', 'Jane Austen', 'Novel followin the turbulent relationship between a daugther and a rich aristocratic landowner');

INSERT INTO book(book_name, author)
    VALUES('The Turn of the Screw', 'Henry James', 'Classic Horror Novella');

/*
    insert user
*/ 
INSERT INTO user(first_name, last_name) 
    VALUES('Markus', 'Dezelak');

INSERT INTO user(first_name, last_name)
    VALUES('Kimberly', 'Dezelak');

INSERT INTO user(first_name, last_name)
    VALUES('Magdalena', 'Dezelak');

/*
    insert wishlist records 
*/
INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Markus'), 
        (SELECT book_id FROM book WHERE book_name = 'The Turn of the Screw')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Kimberly'),
        (SELECT book_id FROM book WHERE book_name = 'Animal Farm')
    );

INSERT INTO wishlist(user_id, book_id)
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Magdalena Dezelak'),
        (SELECT book_id FROM book WHERE book_name = 'The Misantrope')
    );