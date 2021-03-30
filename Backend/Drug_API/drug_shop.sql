-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2021 at 08:09 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";





/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `drug shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `drug categories`
--

CREATE TABLE `drug categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `drug categories`
--

INSERT INTO `drug categories` (`category_id`, `category_name`) VALUES
(1, 'Headache'),
(2, 'Stomach ache'),
(3, 'Cough'),
(4, 'Flu');

-- --------------------------------------------------------

--
-- Table structure for table `drug companies`
--

CREATE TABLE `drug companies` (
  `drug_company_id` int(11) NOT NULL,
  `drug_company_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `drug companies`
--

INSERT INTO `drug companies` (`drug_company_id`, `drug_company_name`) VALUES
(1, 'Ultradent Products, Inc.'),
(2, 'Harmon Stores Inc'),
(3, 'Wal-Mart Stores Inc'),
(4, 'Cadila Healthcare Limited'),
(5, 'Energizer Personal Care LLC'),
(6, 'Henry Schein, Inc.'),
(7, 'Family Dollar'),
(8, 'Three Rivers Pharmaceuticals, '),
(9, 'Save-A-Lot Food Stores Ltd'),
(10, 'Agile Pharmachem');

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `drug_id` int(11) NOT NULL,
  `drug_name` varchar(60) NOT NULL,
  `drug_price` int(11) NOT NULL,
  `drug_quantity` int(11) NOT NULL,
  `drug_description` text DEFAULT NULL,
  `drug_category_id` int(11) NOT NULL,
  `drug_type_id` int(11) NOT NULL,
  `drug_company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`drug_id`, `drug_name`, `drug_price`, `drug_quantity`, `drug_description`, `drug_category_id`, `drug_type_id`, `drug_company_id`) VALUES
(1, 'Fentanyl Citrate', 88, 425, 'Nullam sit amet turpis elementum ligula vehicula consequat.', 1, 1, 6),
(2, 'Ampicillin', 400, 63, 'Quisque porta volutpat erat.', 1, 3, 7),
(3, 'Maximum Strength Zantac', 211, 438, 'In sagittis dui vel nisl.', 3, 3, 6),
(4, 'Biaxin', 242, 27, 'Phasellus sit amet erat.', 4, 3, 10),
(5, 'FLUARIX', 81, 481, 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 3, 3, 1),
(6, 'Dairy Allergy Relief', 178, 112, 'Ut tellus.', 1, 2, 7),
(7, 'HyVee Cold Sore Treatment', 284, 355, 'Suspendisse potenti.', 4, 2, 9),
(8, 'ADSOL Red Cell Preservation Solution System in Plastic Conta', 297, 100, 'Suspendisse potenti.', 2, 3, 8),
(9, 'Rifampin', 90, 424, 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 3, 1, 3),
(10, 'RUE21 Midnight Musk Antibacterial Hand Sanitizer', 344, 483, 'Maecenas tincidunt lacus at velit.', 3, 1, 7),
(11, 'Cyclosporine', 8, 403, 'Fusce consequat.', 1, 1, 9),
(12, 'Labetalol hydrochloride', 68, 313, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 3, 3, 1),
(13, 'Moore Medical Loratadine', 193, 481, 'Etiam vel augue.', 2, 1, 3),
(14, 'Salicylic Acid Corn Remover', 290, 173, 'Nulla facilisi.', 2, 3, 4),
(15, 'Furosemide', 155, 114, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 3, 1, 4),
(16, 'MUCOR PLUMBEUS', 219, 179, 'Pellentesque eget nunc.', 2, 1, 9),
(17, 'antacid', 327, 156, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 4, 3, 8),
(18, 'Degree', 21, 380, 'Morbi quis tortor id nulla ultrices aliquet.', 2, 3, 10),
(19, 'Zyvestra', 105, 485, 'Quisque ut erat.', 4, 3, 7),
(20, 'Benicar', 335, 95, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 4, 1, 10),
(21, 'Mamonde Total', 120, 443, 'Quisque id justo sit amet sapien dignissim vestibulum.', 3, 3, 1),
(22, 'Treatment Set TS329750', 376, 378, 'Suspendisse potenti.', 3, 2, 7),
(23, 'Warfarin Sodium', 75, 300, 'In blandit ultrices enim.', 1, 3, 5),
(24, 'LEDUM PALUSTRE', 35, 97, 'Pellentesque ultrices mattis odio.', 3, 2, 8),
(25, 'Rx Act Ibuprofen', 147, 375, 'Nam tristique tortor eu pede.', 3, 2, 9),
(26, 'Pleasure Balm', 183, 355, 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.', 2, 2, 10),
(27, 'Salt Grass', 61, 331, 'Donec dapibus.', 1, 2, 5),
(28, 'Childrens Acetaminophen', 93, 90, 'Pellentesque at nulla.', 3, 1, 9),
(29, 'Perphenazine', 199, 118, 'Nam dui.', 1, 2, 4),
(30, 'Carbidopa and Levodopa', 385, 285, 'Integer ac leo.', 2, 1, 1),
(31, 'Exchange Select Dark Tanning Sunscreen', 109, 68, 'Aliquam sit amet diam in magna bibendum imperdiet.', 4, 1, 9),
(32, 'Fluconazole', 296, 229, 'Donec ut mauris eget massa tempor convallis.', 3, 1, 5),
(33, 'OXYGEN', 165, 190, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', 1, 2, 8),
(34, 'CHAPSTICK OVERNIGHT', 151, 220, 'In sagittis dui vel nisl.', 4, 3, 1),
(35, 'CEPROTIN', 94, 246, 'Phasellus in felis.', 1, 2, 6),
(36, 'Neostigmine Methylsulfate', 42, 85, 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 3, 1, 6),
(37, 'BreathAway', 53, 377, 'Curabitur in libero ut massa volutpat convallis.', 2, 2, 7),
(38, 'FNG', 249, 210, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', 2, 1, 1),
(39, 'Female Stimulant', 29, 346, 'Maecenas pulvinar lobortis est.', 2, 2, 10),
(40, 'Rasuvo', 285, 279, 'Duis consequat dui nec nisi volutpat eleifend.', 3, 1, 7),
(41, 'Prednisone', 58, 401, 'Vestibulum ac est lacinia nisi venenatis tristique.', 4, 1, 9),
(42, 'Medium Dark Foundation SPF 15', 289, 437, 'Praesent blandit lacinia erat.', 2, 1, 6),
(43, 'UV Capture Water Zero Sunspray', 268, 162, 'Sed vel enim sit amet nunc viverra dapibus.', 4, 1, 5),
(44, 'ALREX', 341, 422, 'Nulla tempus.', 1, 2, 9),
(45, 'Carduus Oxalis', 353, 484, 'Quisque porta volutpat erat.', 4, 2, 5),
(46, 'Fluocinolone Acetonide', 345, 464, 'Morbi non lectus.', 3, 2, 3),
(47, 'Ice Cold Topical Analgesic Gel', 373, 30, 'Nam nulla.', 1, 3, 10),
(48, 'SINGULAIR', 143, 188, 'Praesent blandit lacinia erat.', 1, 2, 1),
(49, 'METOPROLOL SUCCINATE', 306, 423, 'Duis ac nibh.', 2, 3, 5),
(50, 'Givenchy Photo Perfexion Fluid Foundation SPF 20 Perfect Pet', 91, 215, 'Proin interdum mauris non ligula pellentesque ultrices.', 4, 3, 9),
(51, 'Doxycycline Hyclate', 259, 185, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 4, 3, 10),
(52, 'Losartan Potassium and Hydrochlorothiazide', 384, 351, 'Integer tincidunt ante vel ipsum.', 2, 2, 6),
(53, 'AMLODIPINE BESYLATE', 91, 148, 'Vivamus tortor.', 2, 1, 4),
(54, 'KALI MURIATICUM', 19, 111, 'Quisque porta volutpat erat.', 3, 1, 4),
(55, 'Pre Post Surgery', 22, 478, 'Vestibulum sed magna at nunc commodo placerat.', 1, 2, 1),
(56, 'Theophylline', 348, 162, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', 3, 2, 4),
(57, 'Robafen AC', 81, 220, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', 3, 3, 2),
(58, 'CITALOPRAM HYDROBROMIDE', 82, 171, 'Aliquam non mauris.', 3, 2, 8),
(59, 'Doxycycline Hyclate', 243, 49, 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 3, 3, 9),
(60, 'FEM Remedy', 380, 195, 'Nulla nisl.', 4, 1, 1),
(61, 'Olanzapine', 285, 405, 'Aliquam sit amet diam in magna bibendum imperdiet.', 1, 2, 8),
(62, 'DT ANTIBACTERIAL HAND', 185, 354, 'Vivamus vel nulla eget eros elementum pellentesque.', 2, 1, 4),
(63, 'Zetia', 377, 453, 'Morbi porttitor lorem id ligula.', 1, 3, 5),
(64, 'SENSODYNE', 90, 465, 'Proin eu mi.', 4, 1, 7),
(65, 'Good Neighbor Pharmacy', 236, 431, 'Maecenas ut massa quis augue luctus tincidunt.', 3, 1, 4),
(66, 'butalbital, acetominophen and caffeine', 138, 496, 'Integer ac neque.', 4, 3, 4),
(67, 'Levofloxacin', 221, 432, 'Nullam varius.', 4, 1, 3),
(68, 'acyclovir', 66, 126, 'Donec vitae nisi.', 3, 1, 10),
(69, 'Methocarbamol', 57, 60, 'Integer ac leo.', 4, 3, 6),
(70, 'Hydralazine Hydrochloride', 336, 135, 'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 3, 3, 9),
(71, 'Sertraline Hydrochloride', 155, 308, 'In quis justo.', 1, 1, 1),
(72, 'severe cold and flu relief', 274, 327, 'Nulla tempus.', 3, 1, 2),
(73, 'Treatment Set TS331413', 220, 22, 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', 2, 2, 9),
(74, 'Idole Beauty', 73, 234, 'Aenean fermentum.', 2, 1, 6),
(75, 'Diclofenac Sodium', 257, 193, 'Donec ut mauris eget massa tempor convallis.', 4, 1, 9),
(76, 'Perindopril Erbumine', 41, 473, 'Vivamus vel nulla eget eros elementum pellentesque.', 2, 1, 4),
(77, 'Glytone Acne Facial Masque', 5, 109, 'Phasellus in felis.', 4, 2, 6),
(78, 'Dial antibacterial', 353, 425, 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 1, 3, 7),
(79, 'LBEL LEDERM 35plus Jour', 309, 276, 'Mauris sit amet eros.', 2, 3, 4),
(80, 'Pleo Mucedo', 301, 237, 'Vivamus vel nulla eget eros elementum pellentesque.', 2, 3, 6),
(81, 'zermat body breeze Roll-On Antiperspirant', 125, 120, 'Ut at dolor quis odio consequat varius.', 2, 1, 8),
(82, 'OXYGEN', 343, 452, 'Aliquam quis turpis eget elit sodales scelerisque.', 1, 3, 1),
(83, 'Non-Aerosol Antimicrobial Foam Hand Rub', 377, 280, 'Vestibulum sed magna at nunc commodo placerat.', 2, 1, 1),
(84, 'House Dust', 116, 22, 'Nunc rhoncus dui vel sem.', 3, 2, 7),
(85, 'QUETIAPINE FUMARATE', 164, 385, 'Nullam sit amet turpis elementum ligula vehicula consequat.', 1, 3, 6),
(86, 'Amlodipine Besylate', 100, 400, 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 4, 2, 7),
(87, 'Helium', 170, 478, 'Phasellus in felis.', 4, 3, 3),
(88, 'Sertraline Hydrochloride', 284, 34, 'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 3, 2, 1),
(89, 'Acetaminophen And Codeine', 385, 127, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 4, 3, 2),
(90, 'Levetiracetam', 355, 327, 'Pellentesque eget nunc.', 3, 3, 8),
(91, 'BuPROPion Hydrochloride', 160, 308, 'Nulla mollis molestie lorem.', 2, 3, 3),
(92, 'Ortho-K Thick', 398, 33, 'Etiam vel augue.', 2, 2, 6),
(93, 'Penicillin V Potassium', 393, 71, 'In hac habitasse platea dictumst.', 4, 2, 9),
(94, 'Baby Respiration', 89, 458, 'Nam tristique tortor eu pede.', 2, 2, 9),
(95, 'Ranitidine', 29, 226, 'Mauris sit amet eros.', 1, 1, 4),
(96, 'Facility Maintenance Instant Hand Sanitizer HS-67', 233, 399, 'Duis ac nibh.', 1, 1, 1),
(97, 'Baclofen', 262, 84, 'Suspendisse potenti.', 3, 2, 10),
(98, 'Pulmo Tartarus 17/8 Special Order', 327, 118, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 3, 2, 6),
(99, 'Captopril', 100, 415, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.', 4, 3, 3),
(100, 'Lisinopril and Hydrochlorothiazide', 124, 300, 'Praesent id massa id nisl venenatis lacinia.', 1, 3, 7),
(101, 'Sandostatin LAR Depot', 123, 212, 'Maecenas rhoncus aliquam lacus.', 4, 2, 3),
(102, 'Oxcarbazepine', 152, 431, 'Nunc rhoncus dui vel sem.', 4, 2, 10),
(103, 'benzonatate', 178, 279, 'Curabitur in libero ut massa volutpat convallis.', 4, 3, 6),
(104, 'Levofloxacin', 6, 169, 'Vivamus vestibulum sagittis sapien.', 3, 3, 7),
(105, 'Pristiq', 298, 192, 'Aenean lectus.', 1, 3, 6),
(106, 'NorelCS', 23, 455, 'Nulla suscipit ligula in lacus.', 1, 2, 5),
(107, 'Sertraline Hydrochloride', 237, 237, 'In eleifend quam a odio.', 1, 2, 2),
(108, 'ABILIFY', 259, 329, 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', 3, 1, 1),
(109, 'ciprofloxacin', 123, 371, 'Donec semper sapien a libero.', 1, 3, 9),
(110, 'SENEXON-S', 363, 411, 'Vivamus vel nulla eget eros elementum pellentesque.', 1, 2, 6),
(111, 'Darkleaves Mugwort', 298, 68, 'Donec quis orci eget orci vehicula condimentum.', 2, 3, 7),
(112, 'Dextrose and Sodium Chloride', 32, 252, 'Nulla mollis molestie lorem.', 1, 3, 3),
(113, 'Prascion', 227, 489, 'Pellentesque at nulla.', 2, 2, 5),
(114, 'Metoprolol tartrate', 399, 380, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 3, 1, 2),
(115, 'Erythromycin', 147, 53, 'Donec ut dolor.', 1, 2, 10),
(116, 'Prednisone', 107, 149, 'Aenean auctor gravida sem.', 3, 3, 4),
(117, 'ck one waterfresh face makeup spf 15', 97, 421, 'Donec ut dolor.', 3, 2, 10),
(118, 'SkinTx Daily Defense', 390, 144, 'In blandit ultrices enim.', 3, 2, 5),
(119, 'Spironolactone', 142, 478, 'Vivamus vel nulla eget eros elementum pellentesque.', 1, 1, 7),
(120, 'Meloxicam', 288, 410, 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.', 2, 2, 2),
(121, 'Theraflu', 348, 109, 'Maecenas tincidunt lacus at velit.', 2, 3, 7),
(122, 'equaline', 117, 125, 'Morbi porttitor lorem id ligula.', 4, 2, 6),
(123, 'ESZOPICLONE', 62, 112, 'Suspendisse ornare consequat lectus.', 1, 2, 9),
(124, 'Antiseptic Mouth Rinse', 193, 352, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', 3, 1, 7),
(125, 'LBEL MAXIMUM COMFORT AND LONG-LASTING FOUNDATION SPF 10', 374, 311, 'Proin eu mi.', 1, 3, 6),
(126, 'Dexamethasone Sodium Phosphate', 112, 210, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', 3, 1, 4),
(127, 'Ibuprofen', 394, 443, 'Proin interdum mauris non ligula pellentesque ultrices.', 1, 2, 9),
(128, 'NITROGEN', 305, 291, 'Morbi non lectus.', 2, 2, 8),
(129, 'INLYTA', 347, 211, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', 1, 1, 4),
(130, 'Yellow Dock', 210, 180, 'Praesent blandit lacinia erat.', 2, 2, 4),
(131, 'Acne', 266, 305, 'Vestibulum rutrum rutrum neque.', 4, 2, 8),
(132, 'West Cottonwood', 160, 399, 'Proin at turpis a pede posuere nonummy.', 1, 2, 2),
(133, 'Ibuprofen', 222, 369, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.', 1, 3, 1),
(134, 'Promethazine Hydrochloride', 385, 299, 'Cras in purus eu magna vulputate luctus.', 3, 3, 8),
(135, 'Golden Pear Antibacterial Foaming Hand Wash', 266, 327, 'Curabitur in libero ut massa volutpat convallis.', 1, 3, 7),
(136, 'Pramipexole Dihydrochloride', 355, 347, 'Praesent blandit.', 1, 3, 4),
(137, 'TopCare Acid Reducer', 165, 426, 'In est risus, auctor sed, tristique in, tempus sit amet, sem.', 2, 2, 3),
(138, 'Good Neighbor Pharmacy Nasal Decongestant', 162, 414, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 1, 1, 10),
(139, 'Nortriptyline Hydrochloride', 63, 470, 'Donec quis orci eget orci vehicula condimentum.', 4, 2, 4),
(140, 'citroma', 200, 291, 'Maecenas ut massa quis augue luctus tincidunt.', 1, 1, 10),
(141, 'Olanzapine', 309, 451, 'Maecenas ut massa quis augue luctus tincidunt.', 4, 3, 8),
(142, 'Spearmint and Peppermint PLAQUE A WAY Fluoride AnticavityGen', 87, 108, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 1, 1, 8),
(143, 'ATORVASTATIN CALCIUM', 310, 354, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 2, 3, 8),
(144, 'Natrum Sulphuricum Kit Refill', 114, 88, 'Integer non velit.', 1, 1, 9),
(145, 'Glyburide-Metformin Hydrochloride', 178, 392, 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', 3, 2, 4),
(146, 'Sheep Sorrel', 32, 59, 'Donec vitae nisi.', 2, 2, 2),
(147, 'Ibuprofen PM', 72, 438, 'Integer a nibh.', 2, 1, 3),
(148, 'Hydrocodone Bitartrate and Acetaminophen', 63, 214, 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 3, 3, 10),
(149, 'RISPERIDONE', 162, 150, 'Duis mattis egestas metus.', 4, 2, 3),
(150, 'Ibuprofen PM', 227, 169, 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 1, 3, 9),
(151, 'Paroxetine', 73, 269, 'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 1, 2, 7),
(152, 'Cayston', 314, 211, 'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 2, 3, 5),
(153, 'Green Pea', 218, 87, 'Nunc rhoncus dui vel sem.', 4, 3, 8),
(154, 'Cold and Flu', 376, 307, 'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue.', 3, 3, 2),
(155, 'Ash Mixture', 30, 49, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 4, 1, 1),
(156, 'Serophene', 21, 210, 'Nunc nisl.', 3, 2, 6),
(157, 'Cefprozil', 176, 305, 'Ut tellus.', 4, 3, 6),
(158, 'Cold Spot', 195, 90, 'Nulla mollis molestie lorem.', 3, 2, 1),
(159, 'AVANDARYL', 207, 73, 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 2, 3, 10),
(160, 'Glimepiride', 253, 464, 'Donec dapibus.', 3, 2, 1),
(161, 'Chemet', 320, 78, 'Quisque ut erat.', 1, 2, 9),
(162, 'Desonide', 287, 51, 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 3, 3, 6),
(163, 'Diclofenac Sodium', 121, 448, 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 4, 3, 9),
(164, 'MESQUITE POLLEN', 332, 26, 'Donec dapibus.', 1, 2, 1),
(165, 'OXALIPLATIN', 126, 392, 'Aenean auctor gravida sem.', 1, 1, 8),
(166, 'benzoyl peroxide', 63, 69, 'Morbi porttitor lorem id ligula.', 2, 2, 6),
(167, 'Neti Wash Flu', 19, 63, 'In congue.', 3, 1, 3),
(168, 'AURUM STIBIUM HYOSCYAMUS', 386, 238, 'Donec posuere metus vitae ipsum.', 3, 3, 7),
(169, 'CALIFORNIA ALOE FRESH SUN MILK', 68, 419, 'Maecenas ut massa quis augue luctus tincidunt.', 2, 2, 5),
(170, 'PENICILLIUM CHRYSOGENUM VAR CHRYSOGENUM', 282, 420, 'Nulla nisl.', 3, 3, 5),
(171, 'CLE DE PEAU BEAUTE SMOOTHING BASE FOR PORES', 81, 230, 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.', 4, 1, 6),
(172, 'Cinnamon Sugar', 339, 396, 'Maecenas tincidunt lacus at velit.', 2, 1, 5),
(173, 'Body', 282, 197, 'Donec quis orci eget orci vehicula condimentum.', 2, 3, 3),
(174, 'Smart Sense Childrens Allergy', 378, 244, 'Nunc nisl.', 3, 2, 3),
(175, 'Hypothalmapath', 110, 168, 'Maecenas pulvinar lobortis est.', 3, 1, 7),
(176, 'Inspra', 312, 123, 'Pellentesque at nulla.', 1, 1, 7),
(177, 'Diltiazem Hydrochloride', 102, 286, 'Pellentesque eget nunc.', 3, 3, 6),
(178, 'Potassium Citrate', 14, 454, 'In quis justo.', 1, 1, 1),
(179, 'Primidone', 198, 121, 'Morbi vel lectus in quam fringilla rhoncus.', 4, 3, 3),
(180, 'smashbox', 51, 350, 'Integer ac leo.', 1, 2, 5),
(181, 'Amoxicillin', 204, 412, 'Donec posuere metus vitae ipsum.', 1, 1, 7),
(182, 'Vermocks', 128, 196, 'Integer tincidunt ante vel ipsum.', 4, 1, 7),
(183, 'Dextroamphetamine Sulfate', 270, 60, 'Maecenas tincidunt lacus at velit.', 4, 2, 2),
(184, 'LISINOPRIL', 128, 477, 'Suspendisse accumsan tortor quis turpis.', 1, 2, 5),
(185, 'CAREONE', 233, 211, 'Mauris ullamcorper purus sit amet nulla.', 4, 3, 9),
(186, 'flormar REBORN BB SUNSCREEN BROAD SPECTRUM SPF 30 CP16 Beige', 21, 130, 'Morbi ut odio.', 4, 3, 10),
(187, 'Visipaque', 125, 46, 'Fusce posuere felis sed lacus.', 4, 2, 4),
(188, 'Mucus Relief Plus', 15, 415, 'Curabitur in libero ut massa volutpat convallis.', 3, 2, 4),
(189, 'Easy Care First Aid - All Purpose', 42, 26, 'Maecenas ut massa quis augue luctus tincidunt.', 2, 1, 5),
(190, 'ST. IVES', 14, 37, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est.', 1, 1, 10),
(191, 'Qdryl Allergy', 8, 212, 'Suspendisse potenti.', 1, 1, 7),
(192, 'CARE ONE', 341, 291, 'Quisque id justo sit amet sapien dignissim vestibulum.', 4, 2, 1),
(193, 'Hydrochlorothiazide', 135, 217, 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', 2, 1, 4),
(194, 'Well Beginnings Baby Eczema', 15, 341, 'Quisque id justo sit amet sapien dignissim vestibulum.', 1, 1, 4),
(195, 'Promolaxin', 218, 461, 'Integer ac leo.', 3, 3, 6),
(196, 'Nuvel Devotion Roll-on Antiperspirant Deodorant', 249, 349, 'Proin eu mi.', 3, 2, 5),
(197, 'Omeprazole', 15, 374, 'Duis bibendum.', 3, 1, 2),
(198, 'Spearmint', 181, 75, 'Praesent blandit lacinia erat.', 1, 3, 3),
(199, 'good sense tussin dm', 142, 201, 'Vestibulum ac est lacinia nisi venenatis tristique.', 1, 2, 9),
(200, 'Equate nicotine', 237, 328, 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.', 2, 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `drug types`
--

CREATE TABLE `drug types` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `drug types`
--

INSERT INTO `drug types` (`type_id`, `type_name`) VALUES
(1, 'Syrup'),
(2, 'Pill'),
(3, 'Cream');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `order_note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_date`, `user_id`, `order_status_id`, `order_note`) VALUES
(1, '2018-12-11 06:45:42', 6, 1, 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'),
(2, '2018-06-26 18:34:21', 1, 2, 'Vestibulum ac est lacinia nisi venenatis tristique.'),
(3, '2018-04-07 08:07:25', 13, 1, 'Nulla ac enim.'),
(4, '2019-01-15 21:53:36', 9, 1, 'Suspendisse ornare consequat lectus.'),
(5, '2021-02-25 15:52:55', 10, 3, 'Duis at velit eu est congue elementum.'),
(6, '2019-10-13 12:46:29', 15, 3, 'Nunc purus.'),
(7, '2021-01-11 21:24:35', 6, 2, 'Phasellus sit amet erat.'),
(8, '2019-04-15 06:41:19', 13, 3, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(9, '2019-11-06 15:23:48', 1, 2, 'Praesent blandit.');


-- --------------------------------------------------------

--
-- Table structure for table `order drugs`
--

CREATE TABLE `order drugs` (
  `order_drug_id` int(11) NOT NULL,
  `order_drug_quantity` int(11) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order drugs`
--

INSERT INTO `order drugs` (order_drug_id, order_drug_quantity, order_id) VALUES
(1, 2, 1),
(150, 3, 1),
(113, 1, 1),
(9, 1, 2),
(10, 1, 2),
(11, 1, 2),
(93, 1, 3),
(192, 1, 4),
(146, 1, 5),
(73, 4, 6),
(39, 2, 7),
(18, 1, 8),
(3, 2, 8),
(54, 4, 9),
(111, 2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `order status`
--

CREATE TABLE `order status` (
  `order_status_id` int(11) NOT NULL,
  `order_status_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order status`
--

INSERT INTO `order status` (`order_status_id`, `order_status_name`) VALUES
(1, 'Awaiting approval'),
(2, 'Approved'),
(3, 'Shipping'),
(4, 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(320) NOT NULL,
  `user_password` char(60) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `user_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_password`, `user_phone`, `user_type_id`) VALUES
(1, '21', 'wianne0@list-manage.com', 'TmEgy1cEl', '8678844809', 1),
(2, '51', 'drainer1@mit.edu', 'Jpe6Up', '7136223076', 3),
(3, '14', 'bstanhope2@plala.or.jp', 'FisRxr3n6b', '6154511336', 2),
(4, '80', 'apendre3@mlb.com', 'kkIJGjDDvXyL', '2565836850', 3),
(5, '41', 'rmcpharlain4@vinaora.com', 'Cjj5tii9Efg', '3013824732', 3),
(6, '12', 'kmurrells5@businesswire.com', 'QizMflR', '4437888439', 2),
(7, '23', 'aredrup6@cafepress.com', 'VnxJbT', '6928542138', 1),
(8, '47', 'skarlsson7@howstuffworks.com', 'tumXeOaA', '5324977794', 2),
(9, '77', 'mjodlowski8@oracle.com', 'G8bSNk', '7743935978', 3),
(10, '70', 'dcahill9@admin.ch', 'GAHLbh7', '8573905518', 2),
(11, '56', 'rhitzkea@archive.org', '85d8GKDQLi', '2063122135', 1),
(12, '20', 'sstraughanb@reference.com', 'e7BxrU3ok', '6622070007', 2),
(13, '81', 'vtschierschc@dailymail.co.uk', 'X7pVwMk', '6896796422', 3),
(14, '57', 'tdeweyd@ted.com', 'D5TZh2', '3812221417', 3),
(15, '34', 'wbeige@cnet.com', 'DVWEVfMOs', '6506321303', 1),
(16, 'Osama Nabih', 'osos123@gmail.com', '$2b$10$ou82AeZCJLGEt8Rep6HrCe2eDyFFOyweRFtqpeb96msjlNx.Dclt2', '015382010', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user types`
--

CREATE TABLE `user types` (
  `user_type_id` int(11) NOT NULL,
  `user_type_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user types`
--

INSERT INTO `user types` (`user_type_id`, `user_type_name`) VALUES
(1, 'Client'),
(2, 'Owner'),
(3, 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `drug categories`
--
ALTER TABLE `drug categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `drug companies`
--
ALTER TABLE `drug companies`
  ADD PRIMARY KEY (`drug_company_id`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`drug_id`),
  ADD KEY `drug_category_id` (`drug_category_id`),
  ADD KEY `drug_type_id` (`drug_type_id`),
  ADD KEY `drug_company_id` (`drug_company_id`);

--
-- Indexes for table `drug types`
--
ALTER TABLE `drug types`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `order drugs`
--
ALTER TABLE `order drugs`
  ADD PRIMARY KEY (`order_drug_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_status_id` (`order_status_id`);

--
-- Indexes for table `order status`
--
ALTER TABLE `order status`
  ADD PRIMARY KEY (`order_status_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD KEY `user_type_id` (`user_type_id`);

--
-- Indexes for table `user types`
--
ALTER TABLE `user types`
  ADD PRIMARY KEY (`user_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `drug categories`
--
ALTER TABLE `drug categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `drug companies`
--
ALTER TABLE `drug companies`
  MODIFY `drug_company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `drug_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `drug types`
--
ALTER TABLE `drug types`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order drugs`
--
ALTER TABLE `order drugs`
  MODIFY `order_drug_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order status`
--
ALTER TABLE `order status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user types`
--
ALTER TABLE `user types`
  MODIFY `user_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `drugs`
--
ALTER TABLE `drugs`
  ADD CONSTRAINT `drugs_ibfk_1` FOREIGN KEY (`drug_category_id`) REFERENCES `drug categories` (`category_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `drugs_ibfk_2` FOREIGN KEY (`drug_type_id`) REFERENCES `drug types` (`type_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `drugs_ibfk_3` FOREIGN KEY (`drug_company_id`) REFERENCES `drug companies` (`drug_company_id`) ON DELETE CASCADE;

--
-- Constraints for table `order drugs`
--
ALTER TABLE `order drugs`
  ADD CONSTRAINT `order drugs_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order drugs_ibfk_2` FOREIGN KEY (`order_drug_id`) REFERENCES `drugs` (`drug_id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`order_status_id`) REFERENCES `order status` (`order_status_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_type_id`) REFERENCES `user types` (`user_type_id`);
COMMIT;

-- ----------------------------------------------------------
-- Views
CREATE VIEW `Users Orders`
AS
SELECT SUM(drug_price*order_drug_quantity) as `Total Cost`, user_id, order_id, order_status_name, order_date, order_note  
FROM (Drugs JOIN (Orders NATURAL JOIN `Order drugs`) ON drug_id = order_drug_id) NATURAL JOIN `Order Status` 
GROUP BY order_id;

-- --------------------------------------------------------

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
