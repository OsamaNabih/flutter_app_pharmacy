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


INSERT INTO `Drug Categories`(category_name) VALUES('Headache');
INSERT INTO `Drug Categories`(category_name) VALUES('Stomach ache');
INSERT INTO `Drug Categories`(category_name) VALUES('Cough');
INSERT INTO `Drug Categories`(category_name) VALUES('Flu');

INSERT INTO `Drug Types`(type_name) VALUES('Syrup');
INSERT INTO `Drug Types`(type_name) VALUES('Pill');
INSERT INTO `Drug Types`(type_name) VALUES('Cream');

INSERT INTO `Order Status`(order_status_name) VALUES('Awaiting approval');
INSERT INTO `Order Status`(order_status_name) VALUES('Approved');
INSERT INTO `Order Status`(order_status_name) VALUES('Shipping');
INSERT INTO `Order Status`(order_status_name) VALUES('Delivered');



INSERT INTO Users (user_id, user_name, user_email, user_password, user_phone, user_type_id) VALUES (1, 21, 'wianne0@list-manage.com', 'TmEgy1cEl', '8678844809', 1);
INSERT INTO Users (user_id, user_name, user_email, user_password, user_phone, user_type_id) VALUES (2, 51, 'drainer1@mit.edu', 'Jpe6Up', '7136223076', 3);
INSERT INTO Users (user_id, user_name, user_email, user_password, user_phone, user_type_id) VALUES (3, 14, 'bstanhope2@plala.or.jp', 'FisRxr3n6b', '6154511336', 2);
INSERT INTO Users (user_id, user_name, user_email, user_password, user_phone, user_type_id) VALUES (4, 80, 'apendre3@mlb.com', 'kkIJGjDDvXyL', '2565836850', 3);
INSERT INTO Users (user_id, user_name, user_email, user_password, user_phone, user_type_id) VALUES (5, 41, 'rmcpharlain4@vinaora.com', 'Cjj5tii9Efg', '3013824732', 3);
INSERT INTO Users (user_id, user_name, user_email, user_password, user_phone, user_type_id) VALUES (6, 12, 'kmurrells5@businesswire.com', 'QizMflR', '4437888439', 2);
INSERT INTO Users (user_id, user_name, user_email, user_password, user_phone, user_type_id) VALUES (7, 23, 'aredrup6@cafepress.com', 'VnxJbT', '6928542138', 1);
INSERT INTO Users (user_id, user_name, user_email, user_password, user_phone, user_type_id) VALUES (8, 47, 'skarlsson7@howstuffworks.com', 'tumXeOaA', '5324977794', 2);
INSERT INTO Users (user_id, user_name, user_email, user_password, user_phone, user_type_id) VALUES (9, 77, 'mjodlowski8@oracle.com', 'G8bSNk', '7743935978', 3);
INSERT INTO Users (user_id, user_name, user_email, user_password, user_phone, user_type_id) VALUES (10, 70, 'dcahill9@admin.ch', 'GAHLbh7', '8573905518', 2);
INSERT INTO Users (user_id, user_name, user_email, user_password, user_phone, user_type_id) VALUES (11, 56, 'rhitzkea@archive.org', '85d8GKDQLi', '2063122135', 1);
INSERT INTO Users (user_id, user_name, user_email, user_password, user_phone, user_type_id) VALUES (12, 20, 'sstraughanb@reference.com', 'e7BxrU3ok', '6622070007', 2);
INSERT INTO Users (user_id, user_name, user_email, user_password, user_phone, user_type_id) VALUES (13, 81, 'vtschierschc@dailymail.co.uk', 'X7pVwMk', '6896796422', 3);
INSERT INTO Users (user_id, user_name, user_email, user_password, user_phone, user_type_id) VALUES (14, 57, 'tdeweyd@ted.com', 'D5TZh2', '3812221417', 3);
INSERT INTO Users (user_id, user_name, user_email, user_password, user_phone, user_type_id) VALUES (15, 34, 'wbeige@cnet.com', 'DVWEVfMOs', '6506321303', 1);

/*
INSERT INTO `Drug Companies` (drug_company_id, drug_company_name) VALUES (1, 'Ultradent Products, Inc.');
INSERT INTO `Drug Companies` (drug_company_id, drug_company_name) VALUES (2, 'Harmon Stores Inc');
INSERT INTO `Drug Companies` (drug_company_id, drug_company_name) VALUES (3, 'Wal-Mart Stores Inc');
INSERT INTO `Drug Companies` (drug_company_id, drug_company_name) VALUES (4, 'Cadila Healthcare Limited');
INSERT INTO `Drug Companies` (drug_company_id, drug_company_name) VALUES (5, 'Energizer Personal Care LLC');
INSERT INTO `Drug Companies` (drug_company_id, drug_company_name) VALUES (6, 'Henry Schein, Inc.');
INSERT INTO `Drug Companies` (drug_company_id, drug_company_name) VALUES (7, 'Family Dollar');
INSERT INTO `Drug Companies` (drug_company_id, drug_company_name) VALUES (8, 'Three Rivers Pharmaceuticals, LLC.');
INSERT INTO `Drug Companies` (drug_company_id, drug_company_name) VALUES (9, 'Save-A-Lot Food Stores Ltd');
INSERT INTO `Drug Companies` (drug_company_id, drug_company_name) VALUES (10, 'Agile Pharmachem');

/*
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (1, 'Fentanyl Citrate', 88, 425, 'Nullam sit amet turpis elementum ligula vehicula consequat.', 1, 1, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (2, 'Ampicillin', 400, 63, 'Quisque porta volutpat erat.', 1, 3, 7);


INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (3, 'Maximum Strength Zantac', 211, 438, 'In sagittis dui vel nisl.', 3, 3, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (4, 'Biaxin', 242, 27, 'Phasellus sit amet erat.', 4, 3, 10);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (5, 'FLUARIX', 81, 481, 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 3, 3, 1);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (6, 'Dairy Allergy Relief', 178, 112, 'Ut tellus.', 1, 2, 7);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (7, 'HyVee Cold Sore Treatment', 284, 355, 'Suspendisse potenti.', 4, 2, 9);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (8, 'ADSOL Red Cell Preservation Solution System in Plastic Container (PL 146 Plastic)', 297, 100, 'Suspendisse potenti.', 2, 3, 8);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (9, 'Rifampin', 90, 424, 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 3, 1, 3);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (10, 'RUE21 Midnight Musk Antibacterial Hand Sanitizer', 344, 483, 'Maecenas tincidunt lacus at velit.', 3, 1, 7);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (11, 'Cyclosporine', 8, 403, 'Fusce consequat.', 1, 1, 9);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (12, 'Labetalol hydrochloride', 68, 313, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 3, 3, 1);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (13, 'Moore Medical Loratadine', 193, 481, 'Etiam vel augue.', 2, 1, 3);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (14, 'Salicylic Acid Corn Remover', 290, 173, 'Nulla facilisi.', 2, 3, 4);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (15, 'Furosemide', 155, 114, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 3, 1, 4);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (16, 'MUCOR PLUMBEUS', 219, 179, 'Pellentesque eget nunc.', 2, 1, 9);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (17, 'antacid', 327, 156, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 4, 3, 8);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (18, 'Degree', 21, 380, 'Morbi quis tortor id nulla ultrices aliquet.', 2, 3, 10);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (19, 'Zyvestra', 105, 485, 'Quisque ut erat.', 4, 3, 7);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (20, 'Benicar', 335, 95, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 4, 1, 10);


INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (21, 'Mamonde Total', 120, 443, 'Quisque id justo sit amet sapien dignissim vestibulum.', 3, 3, 1);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (22, 'Treatment Set TS329750', 376, 378, 'Suspendisse potenti.', 3, 2, 7);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (23, 'Warfarin Sodium', 75, 300, 'In blandit ultrices enim.', 1, 3, 5);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (24, 'LEDUM PALUSTRE', 35, 97, 'Pellentesque ultrices mattis odio.', 3, 2, 8);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (25, 'Rx Act Ibuprofen', 147, 375, 'Nam tristique tortor eu pede.', 3, 2, 9);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (26, 'Pleasure Balm', 183, 355, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.', 2, 2, 10);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (27, 'Salt Grass', 61, 331, 'Donec dapibus.', 1, 2, 5);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (28, 'Childrens Acetaminophen', 93, 90, 'Pellentesque at nulla.', 3, 1, 9);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (29, 'Perphenazine', 199, 118, 'Nam dui.', 1, 2, 4);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (30, 'Carbidopa and Levodopa', 385, 285, 'Integer ac leo.', 2, 1, 1);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (31, 'Exchange Select Dark Tanning Sunscreen', 109, 68, 'Aliquam sit amet diam in magna bibendum imperdiet.', 4, 1, 9);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (32, 'Fluconazole', 296, 229, 'Donec ut mauris eget massa tempor convallis.', 3, 1, 5);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (33, 'OXYGEN', 165, 190, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', 1, 2, 8);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (34, 'CHAPSTICK OVERNIGHT', 151, 220, 'In sagittis dui vel nisl.', 4, 3, 1);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (35, 'CEPROTIN', 94, 246, 'Phasellus in felis.', 1, 2, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (36, 'Neostigmine Methylsulfate', 42, 85, 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 3, 1, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (37, 'BreathAway', 53, 377, 'Curabitur in libero ut massa volutpat convallis.', 2, 2, 7);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (38, 'FNG', 249, 210, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', 2, 1, 1);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (39, 'Female Stimulant', 29, 346, 'Maecenas pulvinar lobortis est.', 2, 2, 10);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (40, 'Rasuvo', 285, 279, 'Duis consequat dui nec nisi volutpat eleifend.', 3, 1, 7);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (41, 'Prednisone', 58, 401, 'Vestibulum ac est lacinia nisi venenatis tristique.', 4, 1, 9);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (42, 'Medium Dark Foundation SPF 15', 289, 437, 'Praesent blandit lacinia erat.', 2, 1, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (43, 'UV Capture Water Zero Sunspray', 268, 162, 'Sed vel enim sit amet nunc viverra dapibus.', 4, 1, 5);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (44, 'ALREX', 341, 422, 'Nulla tempus.', 1, 2, 9);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (45, 'Carduus Oxalis', 353, 484, 'Quisque porta volutpat erat.', 4, 2, 5);



INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (46, 'Fluocinolone Acetonide', 345, 464, 'Morbi non lectus.', 3, 2, 3);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (47, 'Ice Cold Topical Analgesic Gel', 373, 30, 'Nam nulla.', 1, 3, 10);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (48, 'SINGULAIR', 143, 188, 'Praesent blandit lacinia erat.', 1, 2, 1);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (49, 'METOPROLOL SUCCINATE', 306, 423, 'Duis ac nibh.', 2, 3, 5);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (50, 'Givenchy Photo Perfexion Fluid Foundation SPF 20 Perfect Petal Tint 2', 91, 215, 'Proin interdum mauris non ligula pellentesque ultrices.', 4, 3, 9);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (51, 'Doxycycline Hyclate', 259, 185, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 4, 3, 10);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (52, 'Losartan Potassium and Hydrochlorothiazide', 384, 351, 'Integer tincidunt ante vel ipsum.', 2, 2, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (53, 'AMLODIPINE BESYLATE', 91, 148, 'Vivamus tortor.', 2, 1, 4);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (54, 'KALI MURIATICUM', 19, 111, 'Quisque porta volutpat erat.', 3, 1, 4);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (55, 'Pre Post Surgery', 22, 478, 'Vestibulum sed magna at nunc commodo placerat.', 1, 2, 1);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (56, 'Theophylline', 348, 162, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', 3, 2, 4);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (57, 'Robafen AC', 81, 220, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', 3, 3, 2);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (58, 'CITALOPRAM HYDROBROMIDE', 82, 171, 'Aliquam non mauris.', 3, 2, 8);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (59, 'Doxycycline Hyclate', 243, 49, 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 3, 3, 9);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (60, 'FEM Remedy', 380, 195, 'Nulla nisl.', 4, 1, 1);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (61, 'Olanzapine', 285, 405, 'Aliquam sit amet diam in magna bibendum imperdiet.', 1, 2, 8);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (62, 'DT ANTIBACTERIAL HAND', 185, 354, 'Vivamus vel nulla eget eros elementum pellentesque.', 2, 1, 4);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (63, 'Zetia', 377, 453, 'Morbi porttitor lorem id ligula.', 1, 3, 5);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (64, 'SENSODYNE', 90, 465, 'Proin eu mi.', 4, 1, 7);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (65, 'Good Neighbor Pharmacy', 236, 431, 'Maecenas ut massa quis augue luctus tincidunt.', 3, 1, 4);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (66, 'butalbital, acetominophen and caffeine', 138, 496, 'Integer ac neque.', 4, 3, 4);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (67, 'Levofloxacin', 221, 432, 'Nullam varius.', 4, 1, 3);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (68, 'acyclovir', 66, 126, 'Donec vitae nisi.', 3, 1, 10);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (69, 'Methocarbamol', 57, 60, 'Integer ac leo.', 4, 3, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (70, 'Hydralazine Hydrochloride', 336, 135, 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 3, 3, 9);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (71, 'Sertraline Hydrochloride', 155, 308, 'In quis justo.', 1, 1, 1);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (72, 'severe cold and flu relief', 274, 327, 'Nulla tempus.', 3, 1, 2);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (73, 'Treatment Set TS331413', 220, 22, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', 2, 2, 9);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (74, 'Idole Beauty', 73, 234, 'Aenean fermentum.', 2, 1, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (75, 'Diclofenac Sodium', 257, 193, 'Donec ut mauris eget massa tempor convallis.', 4, 1, 9);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (76, 'Perindopril Erbumine', 41, 473, 'Vivamus vel nulla eget eros elementum pellentesque.', 2, 1, 4);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (77, 'Glytone Acne Facial Masque', 5, 109, 'Phasellus in felis.', 4, 2, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (78, 'Dial antibacterial', 353, 425, 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1, 3, 7);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (79, 'LBEL LEDERM 35plus Jour', 309, 276, 'Mauris sit amet eros.', 2, 3, 4);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (80, 'Pleo Mucedo', 301, 237, 'Vivamus vel nulla eget eros elementum pellentesque.', 2, 3, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (81, 'zermat body breeze Roll-On Antiperspirant', 125, 120, 'Ut at dolor quis odio consequat varius.', 2, 1, 8);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (82, 'OXYGEN', 343, 452, 'Aliquam quis turpis eget elit sodales scelerisque.', 1, 3, 1);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (83, 'Non-Aerosol Antimicrobial Foam Hand Rub', 377, 280, 'Vestibulum sed magna at nunc commodo placerat.', 2, 1, 1);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (84, 'House Dust', 116, 22, 'Nunc rhoncus dui vel sem.', 3, 2, 7);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (85, 'QUETIAPINE FUMARATE', 164, 385, 'Nullam sit amet turpis elementum ligula vehicula consequat.', 1, 3, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (86, 'Amlodipine Besylate', 100, 400, 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 4, 2, 7);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (87, 'Helium', 170, 478, 'Phasellus in felis.', 4, 3, 3);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (88, 'Sertraline Hydrochloride', 284, 34, 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 3, 2, 1);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (89, 'Acetaminophen And Codeine', 385, 127, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 4, 3, 2);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (90, 'Levetiracetam', 355, 327, 'Pellentesque eget nunc.', 3, 3, 8);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (91, 'BuPROPion Hydrochloride', 160, 308, 'Nulla mollis molestie lorem.', 2, 3, 3);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (92, 'Ortho-K Thick', 398, 33, 'Etiam vel augue.', 2, 2, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (93, 'Penicillin V Potassium', 393, 71, 'In hac habitasse platea dictumst.', 4, 2, 9);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (94, 'Baby Respiration', 89, 458, 'Nam tristique tortor eu pede.', 2, 2, 9);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (95, 'Ranitidine', 29, 226, 'Mauris sit amet eros.', 1, 1, 4);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (96, 'Facility Maintenance Instant Hand Sanitizer HS-67', 233, 399, 'Duis ac nibh.', 1, 1, 1);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (97, 'Baclofen', 262, 84, 'Suspendisse potenti.', 3, 2, 10);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (98, 'Pulmo Tartarus 17/8 Special Order', 327, 118, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 3, 2, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (99, 'Captopril', 100, 415, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', 4, 3, 3);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (100, 'Lisinopril and Hydrochlorothiazide', 124, 300, 'Praesent id massa id nisl venenatis lacinia.', 1, 3, 7);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (101, 'Sandostatin LAR Depot', 123, 212, 'Maecenas rhoncus aliquam lacus.', 4, 2, 3);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (102, 'Oxcarbazepine', 152, 431, 'Nunc rhoncus dui vel sem.', 4, 2, 10);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (103, 'benzonatate', 178, 279, 'Curabitur in libero ut massa volutpat convallis.', 4, 3, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (104, 'Levofloxacin', 6, 169, 'Vivamus vestibulum sagittis sapien.', 3, 3, 7);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (105, 'Pristiq', 298, 192, 'Aenean lectus.', 1, 3, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (106, 'NorelCS', 23, 455, 'Nulla suscipit ligula in lacus.', 1, 2, 5);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (107, 'Sertraline Hydrochloride', 237, 237, 'In eleifend quam a odio.', 1, 2, 2);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (108, 'ABILIFY', 259, 329, 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', 3, 1, 1);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (109, 'ciprofloxacin', 123, 371, 'Donec semper sapien a libero.', 1, 3, 9);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (110, 'SENEXON-S', 363, 411, 'Vivamus vel nulla eget eros elementum pellentesque.', 1, 2, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (111, 'Darkleaves Mugwort', 298, 68, 'Donec quis orci eget orci vehicula condimentum.', 2, 3, 7);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (112, 'Dextrose and Sodium Chloride', 32, 252, 'Nulla mollis molestie lorem.', 1, 3, 3);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (113, 'Prascion', 227, 489, 'Pellentesque at nulla.', 2, 2, 5);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (114, 'Metoprolol tartrate', 399, 380, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 3, 1, 2);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (115, 'Erythromycin', 147, 53, 'Donec ut dolor.', 1, 2, 10);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (116, 'Prednisone', 107, 149, 'Aenean auctor gravida sem.', 3, 3, 4);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (117, 'ck one waterfresh face makeup spf 15', 97, 421, 'Donec ut dolor.', 3, 2, 10);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (118, 'SkinTx Daily Defense', 390, 144, 'In blandit ultrices enim.', 3, 2, 5);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (119, 'Spironolactone', 142, 478, 'Vivamus vel nulla eget eros elementum pellentesque.', 1, 1, 7);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (120, 'Meloxicam', 288, 410, 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', 2, 2, 2);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (121, 'Theraflu', 348, 109, 'Maecenas tincidunt lacus at velit.', 2, 3, 7);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (122, 'equaline', 117, 125, 'Morbi porttitor lorem id ligula.', 4, 2, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (123, 'ESZOPICLONE', 62, 112, 'Suspendisse ornare consequat lectus.', 1, 2, 9);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (124, 'Antiseptic Mouth Rinse', 193, 352, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', 3, 1, 7);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (125, 'LBEL MAXIMUM COMFORT AND LONG-LASTING FOUNDATION SPF 10', 374, 311, 'Proin eu mi.', 1, 3, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (126, 'Dexamethasone Sodium Phosphate', 112, 210, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', 3, 1, 4);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (127, 'Ibuprofen', 394, 443, 'Proin interdum mauris non ligula pellentesque ultrices.', 1, 2, 9);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (128, 'NITROGEN', 305, 291, 'Morbi non lectus.', 2, 2, 8);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (129, 'INLYTA', 347, 211, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', 1, 1, 4);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (130, 'Yellow Dock', 210, 180, 'Praesent blandit lacinia erat.', 2, 2, 4);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (131, 'Acne', 266, 305, 'Vestibulum rutrum rutrum neque.', 4, 2, 8);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (132, 'West Cottonwood', 160, 399, 'Proin at turpis a pede posuere nonummy.', 1, 2, 2);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (133, 'Ibuprofen', 222, 369, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.', 1, 3, 1);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (134, 'Promethazine Hydrochloride', 385, 299, 'Cras in purus eu magna vulputate luctus.', 3, 3, 8);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (135, 'Golden Pear Antibacterial Foaming Hand Wash', 266, 327, 'Curabitur in libero ut massa volutpat convallis.', 1, 3, 7);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (136, 'Pramipexole Dihydrochloride', 355, 347, 'Praesent blandit.', 1, 3, 4);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (137, 'TopCare Acid Reducer', 165, 426, 'In est risus, auctor sed, tristique in, tempus sit amet, sem.', 2, 2, 3);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (138, 'Good Neighbor Pharmacy Nasal Decongestant', 162, 414, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 1, 1, 10);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (139, 'Nortriptyline Hydrochloride', 63, 470, 'Donec quis orci eget orci vehicula condimentum.', 4, 2, 4);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (140, 'citroma', 200, 291, 'Maecenas ut massa quis augue luctus tincidunt.', 1, 1, 10);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (141, 'Olanzapine', 309, 451, 'Maecenas ut massa quis augue luctus tincidunt.', 4, 3, 8);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (142, 'Spearmint and Peppermint PLAQUE A WAY Fluoride AnticavityGentle Formula', 87, 108, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 1, 1, 8);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (143, 'ATORVASTATIN CALCIUM', 310, 354, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 2, 3, 8);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (144, 'Natrum Sulphuricum Kit Refill', 114, 88, 'Integer non velit.', 1, 1, 9);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (145, 'Glyburide-Metformin Hydrochloride', 178, 392, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', 3, 2, 4);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (146, 'Sheep Sorrel', 32, 59, 'Donec vitae nisi.', 2, 2, 2);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (147, 'Ibuprofen PM', 72, 438, 'Integer a nibh.', 2, 1, 3);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (148, 'Hydrocodone Bitartrate and Acetaminophen', 63, 214, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 3, 3, 10);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (149, 'RISPERIDONE', 162, 150, 'Duis mattis egestas metus.', 4, 2, 3);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (150, 'Ibuprofen PM', 227, 169, 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 1, 3, 9);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (151, 'Paroxetine', 73, 269, 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 1, 2, 7);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (152, 'Cayston', 314, 211, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 2, 3, 5);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (153, 'Green Pea', 218, 87, 'Nunc rhoncus dui vel sem.', 4, 3, 8);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (154, 'Cold and Flu', 376, 307, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 3, 3, 2);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (155, 'Ash Mixture', 30, 49, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 4, 1, 1);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (156, 'Serophene', 21, 210, 'Nunc nisl.', 3, 2, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (157, 'Cefprozil', 176, 305, 'Ut tellus.', 4, 3, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (158, 'Cold Spot', 195, 90, 'Nulla mollis molestie lorem.', 3, 2, 1);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (159, 'AVANDARYL', 207, 73, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 2, 3, 10);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (160, 'Glimepiride', 253, 464, 'Donec dapibus.', 3, 2, 1);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (161, 'Chemet', 320, 78, 'Quisque ut erat.', 1, 2, 9);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (162, 'Desonide', 287, 51, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 3, 3, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (163, 'Diclofenac Sodium', 121, 448, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4, 3, 9);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (164, 'MESQUITE POLLEN', 332, 26, 'Donec dapibus.', 1, 2, 1);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (165, 'OXALIPLATIN', 126, 392, 'Aenean auctor gravida sem.', 1, 1, 8);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (166, 'benzoyl peroxide', 63, 69, 'Morbi porttitor lorem id ligula.', 2, 2, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (167, 'Neti Wash Flu', 19, 63, 'In congue.', 3, 1, 3);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (168, 'AURUM STIBIUM HYOSCYAMUS', 386, 238, 'Donec posuere metus vitae ipsum.', 3, 3, 7);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (169, 'CALIFORNIA ALOE FRESH SUN MILK', 68, 419, 'Maecenas ut massa quis augue luctus tincidunt.', 2, 2, 5);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (170, 'PENICILLIUM CHRYSOGENUM VAR CHRYSOGENUM', 282, 420, 'Nulla nisl.', 3, 3, 5);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (171, 'CLE DE PEAU BEAUTE SMOOTHING BASE FOR PORES', 81, 230, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 4, 1, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (172, 'Cinnamon Sugar', 339, 396, 'Maecenas tincidunt lacus at velit.', 2, 1, 5);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (173, 'Body', 282, 197, 'Donec quis orci eget orci vehicula condimentum.', 2, 3, 3);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (174, 'Smart Sense Childrens Allergy', 378, 244, 'Nunc nisl.', 3, 2, 3);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (175, 'Hypothalmapath', 110, 168, 'Maecenas pulvinar lobortis est.', 3, 1, 7);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (176, 'Inspra', 312, 123, 'Pellentesque at nulla.', 1, 1, 7);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (177, 'Diltiazem Hydrochloride', 102, 286, 'Pellentesque eget nunc.', 3, 3, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (178, 'Potassium Citrate', 14, 454, 'In quis justo.', 1, 1, 1);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (179, 'Primidone', 198, 121, 'Morbi vel lectus in quam fringilla rhoncus.', 4, 3, 3);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (180, 'smashbox', 51, 350, 'Integer ac leo.', 1, 2, 5);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (181, 'Amoxicillin', 204, 412, 'Donec posuere metus vitae ipsum.', 1, 1, 7);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (182, 'Vermocks', 128, 196, 'Integer tincidunt ante vel ipsum.', 4, 1, 7);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (183, 'Dextroamphetamine Sulfate', 270, 60, 'Maecenas tincidunt lacus at velit.', 4, 2, 2);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (184, 'LISINOPRIL', 128, 477, 'Suspendisse accumsan tortor quis turpis.', 1, 2, 5);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (185, 'CAREONE', 233, 211, 'Mauris ullamcorper purus sit amet nulla.', 4, 3, 9);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (186, 'flormar REBORN BB SUNSCREEN BROAD SPECTRUM SPF 30 CP16 Beige', 21, 130, 'Morbi ut odio.', 4, 3, 10);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (187, 'Visipaque', 125, 46, 'Fusce posuere felis sed lacus.', 4, 2, 4);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (188, 'Mucus Relief Plus', 15, 415, 'Curabitur in libero ut massa volutpat convallis.', 3, 2, 4);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (189, 'Easy Care First Aid - All Purpose', 42, 26, 'Maecenas ut massa quis augue luctus tincidunt.', 2, 1, 5);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (190, 'ST. IVES', 14, 37, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', 1, 1, 10);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (191, 'Qdryl Allergy', 8, 212, 'Suspendisse potenti.', 1, 1, 7);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (192, 'CARE ONE', 341, 291, 'Quisque id justo sit amet sapien dignissim vestibulum.', 4, 2, 1);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (193, 'Hydrochlorothiazide', 135, 217, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', 2, 1, 4);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (194, 'Well Beginnings Baby Eczema', 15, 341, 'Quisque id justo sit amet sapien dignissim vestibulum.', 1, 1, 4);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (195, 'Promolaxin', 218, 461, 'Integer ac leo.', 3, 3, 6);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (196, 'Nuvel Devotion Roll-on Antiperspirant Deodorant', 249, 349, 'Proin eu mi.', 3, 2, 5);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (197, 'Omeprazole', 15, 374, 'Duis bibendum.', 3, 1, 2);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (198, 'Spearmint', 181, 75, 'Praesent blandit lacinia erat.', 1, 3, 3);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (199, 'good sense tussin dm', 142, 201, 'Vestibulum ac est lacinia nisi venenatis tristique.', 1, 2, 9);
INSERT INTO Drugs (drug_id, drug_name, drug_price, drug_quantity, drug_description, drug_category_id, drug_type_id, drug_company_id) VALUES (200, 'Equate nicotine', 237, 328, 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 2, 2, 10);
*/