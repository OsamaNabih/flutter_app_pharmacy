DROP DATABASE IF EXISTS `Drug Shop`;
CREATE DATABASE `Drug Shop`;

CREATE TABLE `User Types`
(
    user_type_id INT NOT NULL auto_increment,
    user_type_name VARCHAR(100) NOT NULL,
    PRIMARY KEY(user_type_id)
);

CREATE TABLE Users
(
    user_id INT NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(100) NOT NULL,
    user_email VARCHAR(320) UNIQUE NOT NULL,
    user_password char(60) NOT NULL, /*Bcrypt library produces a hash of length 60*/
    user_phone VARCHAR(20) NOT NULL,
    user_type_id INT NOT NULL,
    PRIMARY KEY(user_id),
    FOREIGN KEY(user_type_id) REFERENCES `User Types`(user_type_id) /*on delete cascade?, default is restrict*/
);

CREATE TABLE `Drug Categories`
(
    category_id INT NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(category_id)
);

CREATE TABLE `Drug Types`
(
    type_id INT NOT NULL AUTO_INCREMENT,
    type_name VARCHAR(15) NOT NULL,
    PRIMARY KEY(type_id)
);

CREATE TABLE `Drug Companies`
(
    drug_company_id INT NOT NULL AUTO_INCREMENT,
    drug_company_name VARCHAR(30) NOT NULL,
    PRIMARY KEY(drug_company_id)
);

CREATE TABLE Drugs
(
    drug_id INT NOT NULL AUTO_INCREMENT,
    drug_name VARCHAR(60) NOT NULL,
    drug_price INT NOT NULL,
    drug_quantity INT NOT NULL,
    drug_description TEXT,
    drug_category_id INT NOT NULL,
    drug_type_id INT NOT NULL,
    drug_company_id INT NOT NULL,
    PRIMARY KEY(drug_id),
    FOREIGN KEY(drug_category_id) REFERENCES `Drug Categories`(category_id) ON DELETE CASCADE,
    FOREIGN KEY(drug_type_id) REFERENCES `Drug Types`(type_id) ON DELETE CASCADE,
    FOREIGN KEY(drug_company_id) REFERENCES `Drug Companies`(drug_company_id) ON DELETE CASCADE
);

CREATE TABLE `Order Status`
(
    order_status_id INT NOT NULL AUTO_INCREMENT,
    order_status_name VARCHAR(30) NOT NULL,
    PRIMARY KEY(order_status_id)
);

CREATE TABLE Orders
(
    order_id INT NOT NULL AUTO_INCREMENT,
    order_date DATETIME NOT NULL,
    user_id INT NOT NULL,
    order_status_id INT NOT NULL,
    order_note TEXT,
    PRIMARY KEY(order_id),
    FOREIGN KEY(user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY(order_status_id) REFERENCES `Order Status`(order_status_id)
);

CREATE TABLE `Order Drugs`
(
    order_drug_id INT NOT NULL AUTO_INCREMENT,
    order_drug_quantity INT NOT NULL,
    order_id INT NOT NULL,
    PRIMARY KEY(order_drug_id),
    FOREIGN KEY(order_id) REFERENCES Orders(order_id) ON DELETE CASCADE
);

INSERT INTO `User Types`(user_type_name) VALUES('Client');
INSERT INTO `User Types`(user_type_name) VALUES('Owner');
INSERT INTO `User Types`(user_type_name) VALUES('Admin');

INSERT INTO Users(user_name, user_email, user_password, user_phone, user_type_id) VALUES('Osama Nabih', 'osama123@gmail.com', '12345', '01067633228', 1);

INSERT INTO `Drug Categories`(category_name) VALUES('Headache');
INSERT INTO `Drug Categories`(category_name) VALUES('Stomach ache');
INSERT INTO `Drug Categories`(category_name) VALUES('Cough');
INSERT INTO `Drug Categories`(category_name) VALUES('Flu');

INSERT INTO `Drug Types`(type_name) VALUES('Syrup');
INSERT INTO `Drug Types`(type_name) VALUES('Pill');
INSERT INTO `Drug Types`(type_name) VALUES('Cream');
