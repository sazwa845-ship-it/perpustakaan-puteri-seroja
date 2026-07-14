-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2026 at 04:39 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaanpuetriseroja`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `Item_ID` int(11) NOT NULL,
  `Tittle` varchar(255) NOT NULL,
  `ISBN` varchar(20) NOT NULL,
  `Author` varchar(255) NOT NULL,
  `Publisher` varchar(255) NOT NULL,
  `Year` int(4) NOT NULL,
  `Status` varchar(20) NOT NULL,
  `Genre_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`Item_ID`, `Tittle`, `ISBN`, `Author`, `Publisher`, `Year`, `Status`, `Genre_ID`) VALUES
(5, 'Basic Mathematics', '9780823464005', 'Alliah L Agostini, Olivia de Castro', 'Miles Kelly Publishing Ltd', 2026, 'non-available', 2),
(10, 'Surat Cinta Untuk Pendosa', '9789672118244', 'Adnin Roslan', 'Sentap Press Sdn Bhd', 2019, 'available', 1),
(25, 'Science of Wonder', '9780007149520', 'Richard Holmes', 'Miles Kelly Publishing Ltd', 2008, 'available', 2),
(56, 'Buku Pintar Agama Islam', '9789671771570', 'Mujahid Abdul Ilias', 'Ilham Books', 2018, 'missing', 5),
(256, 'Majalah Dewan Masyarakat', '20690987', 'Zikri Ibrahim', 'Dewan Bahasa dan Pustaka (DBP)', 2025, 'available', 3),
(400, 'Snow White- The Brothers Grimm', '9781789581973', 'Sarah Lucy', 'Disney XD', 2023, 'non-available', 6),
(450, 'Before I knew I loved You ', '9781035046300', 'Toshikazu Kawaguchi', 'Imagine That Publishing Ltd.', 2026, 'available', 1),
(2300, 'Sofia The First', '9781805336297', 'Bella Swan', 'Disney XD', 2017, 'missing', 6),
(4450, 'The Science  Book', '97871789890259', 'John Fardon', 'Miles Kelly Publishing Ltd', 2019, 'available', 2),
(4452, 'Malaya and Its History', '9788991511162', 'Pantheon Space Academy', 'Pantheon Global Publishing LLC', 2022, 'available', 3),
(6000, 'The Open Public Health Journal', '9781400052172', 'Rebecca Skloot', 'Health Journal', 2010, 'available', 4),
(6700, 'The World Discoverers ', '20290968', 'Daniel J. Boorstin', 'Imagine That Publishing Ltd.', 1983, 'non-available', 3),
(7650, 'Noktah', '9789674692308', 'Rehan Moktar', 'Sentap Press Sdn Bhd', 2025, 'available', 1),
(7656, 'Demon Slayer ', '9780857507617', 'Koyoharu Gotouge', 'Imagine That Publishing Ltd.', 2016, 'non-available', 1),
(8769, 'Sakitnya Rindu Ini ', '9789833884001', 'Liana Afiera Malik', ' Sentap Press Sdn Bhd', 2022, 'missing', 1),
(8770, 'Lelaki Rusia Itu', '9781234567890', 'Kamila Valieva', 'Moscow Printed PUBLISHER', 2026, 'available', 1);

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

CREATE TABLE `borrow` (
  `Borrow_ID` int(10) NOT NULL,
  `Borrow_Date` date NOT NULL,
  `Due_Date` date NOT NULL,
  `Return_Date` date DEFAULT NULL,
  `Member_ID` int(10) NOT NULL,
  `Staff_ID` int(10) NOT NULL,
  `Item_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrow`
--

INSERT INTO `borrow` (`Borrow_ID`, `Borrow_Date`, `Due_Date`, `Return_Date`, `Member_ID`, `Staff_ID`, `Item_ID`) VALUES
(1000, '2026-01-09', '2026-01-15', '2026-01-14', 2110666417, 1, 5),
(1010, '2026-05-17', '2026-05-23', '2026-06-07', 2102551872, 2, 10),
(1100, '2026-05-01', '2026-05-07', '2026-05-06', 2133078944, 5, 25),
(1200, '2026-06-05', '2026-06-11', '2026-06-13', 2142689244, 7, 56),
(1300, '2026-06-11', '2026-06-17', '2026-06-18', 2130415538, 1, 256),
(1400, '2026-06-11', '2026-06-17', '2026-06-17', 2122678270, 2, 400),
(1500, '2026-06-12', '2026-06-18', '2026-06-21', 2127155936, 5, 450),
(2000, '2026-01-09', '2026-01-15', '2026-01-21', 2100267133, 2, 2300),
(3000, '2026-02-20', '2026-02-26', '2026-02-27', 2106348874, 5, 4450),
(4000, '2026-03-04', '2026-03-10', '2026-03-09', 2140115933, 7, 4452),
(5000, '2026-03-14', '2026-03-20', '2026-03-21', 2125808029, 1, 6000),
(6000, '2026-03-14', '2026-03-20', '2026-06-19', 2111642061, 2, 6700),
(7000, '2026-04-05', '2026-04-11', '2026-04-11', 2146586905, 5, 7650),
(8000, '2026-04-13', '2026-04-19', '2026-04-17', 2125808029, 7, 7656),
(9000, '2026-05-20', '2026-06-27', '2026-06-07', 2125889616, 1, 8769);

-- --------------------------------------------------------

--
-- Table structure for table `fine`
--

CREATE TABLE `fine` (
  `Fine_ID` int(10) NOT NULL,
  `Date_Issued` date NOT NULL,
  `Amount_Charge` decimal(10,2) NOT NULL,
  `Overdue_Period` int(10) DEFAULT NULL,
  `Status` varchar(20) NOT NULL,
  `Reason` text DEFAULT NULL,
  `Borrow_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fine`
--

INSERT INTO `fine` (`Fine_ID`, `Date_Issued`, `Amount_Charge`, `Overdue_Period`, `Status`, `Reason`, `Borrow_ID`) VALUES
(10, '2026-01-15', 2.50, 5, 'complete', 'damage', 2000),
(20, '2026-02-26', 0.50, 1, 'in process', 'late', 3000),
(30, '2026-03-20', 0.50, 1, 'complete', 'late', 5000),
(40, '2026-05-23', 7.50, 15, 'in process', 'lost ', 1010),
(50, '2026-06-11', 1.00, 2, 'complete', 'late', 1200),
(60, '2026-06-17', 0.50, 1, 'complete', 'late', 1300),
(70, '2026-06-18', 1.50, 3, 'complete', 'damage', 1500);

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `Genre_ID` int(10) NOT NULL,
  `Genre_Name` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`Genre_ID`, `Genre_Name`, `Description`) VALUES
(1, 'Fiction', 'novels, creative literature, fictional stories'),
(2, 'Science & Technology', 'physics, biology, chemistry, computers, math'),
(3, 'History & Geography', 'world history, maps'),
(4, 'Medicine & Health', 'human anatomy'),
(5, 'Religion', 'pray, Islam rules'),
(6, 'Children', 'Illustration');

-- --------------------------------------------------------

--
-- Table structure for table `library_staff`
--

CREATE TABLE `library_staff` (
  `Staff_ID` int(10) NOT NULL,
  `First_Name` varchar(100) NOT NULL,
  `Last_Name` varchar(100) NOT NULL,
  `Staff_Contact` varchar(20) DEFAULT NULL,
  `Staff_Email` varchar(100) DEFAULT NULL,
  `Position` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `library_staff`
--

INSERT INTO `library_staff` (`Staff_ID`, `First_Name`, `Last_Name`, `Staff_Contact`, `Staff_Email`, `Position`) VALUES
(1, 'Azlan Shah', 'Ahmad Shuib', '019-6706783', 'azlanshuib@gmail.com', 'circulation'),
(2, 'Nurin Jazlina', 'Ayyub', '013-6969910', 'jazlina10@gmail.com', 'circulation'),
(3, 'Sook Fan', 'Tan ', '013-2496445', 'tansookfan@gmail.com', 'acquisition'),
(4, 'Anjali', 'Devi', '016-6166006', 'anjalidevi@gmail.com', 'cataloguing'),
(5, 'Siti Maisarah ', 'Zulkifli', '019-5678769', 'maisarah@gmail.com', 'circulation'),
(6, 'Aisyah Batrisya', 'Mohd Musa', '010-3298923', 'aisyahmusa@gmail.com', 'acquisition'),
(7, 'Fairuz', 'Mad', '014-6578999', 'fairuzmad@gmail.com', 'circulation'),
(8, 'Jia Xin', 'Lee ', '019-6706789', 'leejixin@gmail.com', 'acquisition'),
(9, 'Ikhwal', 'Zamri', '012-7877909', 'ikhwalzamri@gmail.com', 'acquisition'),
(10, 'Adrean', 'Ruiz', '012-1134603', 'adreanruiz@gmail.com', 'shelving'),
(11, 'Thariq', 'Ridzwan', '019-8726490', 'thariqridzwan@gmail.com', 'archivist'),
(12, 'Megat Hafiz', 'Ihsan Hamid', '014-8873294', 'megathafiz@gmail.com', 'archivist'),
(13, 'Kevin Kyle', 'Yong', '010-3125586', 'kevinkyle@gmail.com', 'cataloguing'),
(14, 'Haider', 'Mohd Syameel', '019-7349226', 'haidersyameel@gmail.com', 'acquisition'),
(15, 'Theez Ridzhan', 'Hudzaifah Alias', '012-8964883', 'theezridzhan@gmail.com', 'shelving');

-- --------------------------------------------------------

--
-- Table structure for table `member/user`
--

CREATE TABLE `member/user` (
  `Member_ID` int(10) NOT NULL,
  `First_Name` varchar(100) NOT NULL,
  `Last_Name` varchar(100) NOT NULL,
  `User_Contact` varchar(20) DEFAULT NULL,
  `User_Email` varchar(100) DEFAULT NULL,
  `User_Address` text DEFAULT NULL,
  `Postcode` varchar(5) NOT NULL,
  `state` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member/user`
--

INSERT INTO `member/user` (`Member_ID`, `First_Name`, `Last_Name`, `User_Contact`, `User_Email`, `User_Address`, `Postcode`, `state`) VALUES
(2100267133, 'Izham Hariz', 'Mohd Izzat', '017-8991342', 'izhamhhaizz@gmail.com', 'No. 11, Jalan BM6/87A, Bandar Bukit Mahkota, Bangi, Kajang', '43000', 'Selangor'),
(2102551872, 'Jia Yi', 'Tan', '012-8966030', 'tanjiayi@gmail.com', 'No. 83. Persiaran Lada  3, Taman Changkat Lada Raya', '36800', 'Perak'),
(2106348874, 'Azzahra', 'Amierul Bakhtiar', '012-2517561', 'azzahra@gmail.com', 'Unit B-10-3, Blok B, Kondominium Setapak Green, Jalan Semarak Api', '53000', 'Kuala Lumpur'),
(2110666417, 'Ammar Zayyan', 'Ziyad', '014-4049355', 'zayyanziyad@gmail.com', 'A02-05,Jalan Samudra Timur 7, Batu Caves', '76580', 'Selangor'),
(2111642061, ' Wen Liang', 'How', '011-11342404', 'howwengliang@gmail.com', 'No. 54, Lorong Tabuan Tranquility 4, Tabuan Jaya', '93360', 'Selangor'),
(2122678270, 'Stephanie Grace', 'Fernandez', '019-3698783', 'stephanieg@gmail.com', 'No. 7, Jalan Lapangan Siber 4, Bandar Baru Bangi', '31350', 'Selangor'),
(2125404312, 'Susanti', 'Devi', '019-9664808', 'susantidevi@gmail.com', 'Lot 452, Kampung Bukit Hijau, Jalan Kampung Lalang', '93009', 'Kedah'),
(2125808029, 'Muhammad Ismail', 'Mail', '018-3650827', 'mailbmail@gmail.com', 'NO. 64, Taman Beringin, Fasa 1, Changlun', '60110', 'Kedah'),
(2125889616, 'Maznah', 'Ahmad Fakhrul ', '011-55080646', 'maznahfakhrul@gmail.com', 'No. 15, Jalan Austin Heights 3/2, Taman Austin Heights', '81000', 'Johor'),
(2127155936, 'Nur Hamidah', 'Hashim', '013-4167662', 'midahashim@gmail.com', 'No. 5, Jalan Lavender 2, Taman Lavender Heights', '70400', 'Negeri Sembilan'),
(2130415538, 'Aqielah Harissa', 'Haziq Khalim', '017-9685521', 'qielaharissa@gmail.com', 'No. 88, Jalan Evergreen, Tanjung Tokong', '11290', 'Negeri Sembilan'),
(2133078944, 'Mei Ling', 'Lee', '014-7566418', 'leemeiling@gmial.com', 'No. 14, Jalan LK6/7/430, Lintas Kupang ', '43000', 'Selangor'),
(2140115933, 'Amsyar Dizhwar', 'Muhammad Hamdar', '018-8879540', 'amyardizhwar@gmail.com', '103, Jalan Angsana U13/5, Setia Alam, Shah Alam', '40170', 'Selangor'),
(2142689244, 'Kavitha', 'Rajushwara', '019-5726991', 'kavitha@gmail.com', 'No. 12B, Kampung Tok Jalal, Jalan Padang Tembak', '11610', 'Kuala Lumpur'),
(2146586905, 'Tanesh', 'Marugem', '011-11346030', 'taneshh@gmail.com', 'No. 24, Jalan BK 5/12, Bandar Kinrara, Puchong', '43244', 'Selangor');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `Supplier_ID` int(10) NOT NULL,
  `Supplier_Name` varchar(255) NOT NULL,
  `Supplier_Contact` varchar(20) DEFAULT NULL,
  `Supplier_Email` varchar(255) DEFAULT NULL,
  `Item_ID` int(11) NOT NULL,
  `Staff_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`Supplier_ID`, `Supplier_Name`, `Supplier_Contact`, `Supplier_Email`, `Item_ID`, `Staff_ID`) VALUES
(101, 'Ilmu Books Enterprise', '013-8765432', 'IBE@gmail.com', 7656, 3),
(202, 'Asia Edu Supplies', '018-1122334', 'asiaedusupp@gmail.com', 5, 14),
(303, 'Smart Library Resources', '017-5566778', 'smartlibraryresources@gmail.com', 25, 6),
(404, 'MsRachel Education', '012-3456789', 'msracheledu@gmail.com', 8769, 8),
(606, 'Zamri Global Education ', '014-2034456', 'zamriglobaledu@gail.com', 10, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`Item_ID`),
  ADD KEY `Genre_ID` (`Genre_ID`);

--
-- Indexes for table `borrow`
--
ALTER TABLE `borrow`
  ADD PRIMARY KEY (`Borrow_ID`),
  ADD KEY `Member_ID` (`Member_ID`),
  ADD KEY `Staff_ID` (`Staff_ID`),
  ADD KEY `Item_ID` (`Item_ID`);

--
-- Indexes for table `fine`
--
ALTER TABLE `fine`
  ADD PRIMARY KEY (`Fine_ID`),
  ADD KEY `Borrow_ID` (`Borrow_ID`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`Genre_ID`);

--
-- Indexes for table `library_staff`
--
ALTER TABLE `library_staff`
  ADD PRIMARY KEY (`Staff_ID`);

--
-- Indexes for table `member/user`
--
ALTER TABLE `member/user`
  ADD PRIMARY KEY (`Member_ID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Supplier_ID`),
  ADD KEY `Item_ID` (`Item_ID`),
  ADD KEY `Staff_ID` (`Staff_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `Item_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8771;

--
-- AUTO_INCREMENT for table `borrow`
--
ALTER TABLE `borrow`
  MODIFY `Borrow_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9001;

--
-- AUTO_INCREMENT for table `fine`
--
ALTER TABLE `fine`
  MODIFY `Fine_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
  MODIFY `Genre_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `library_staff`
--
ALTER TABLE `library_staff`
  MODIFY `Staff_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `member/user`
--
ALTER TABLE `member/user`
  MODIFY `Member_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2146586906;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `Supplier_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=607;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`Genre_ID`) REFERENCES `genre` (`Genre_ID`);

--
-- Constraints for table `borrow`
--
ALTER TABLE `borrow`
  ADD CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`Member_ID`) REFERENCES `member/user` (`Member_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`Staff_ID`) REFERENCES `library_staff` (`Staff_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `borrow_ibfk_3` FOREIGN KEY (`Item_ID`) REFERENCES `book` (`Item_ID`);

--
-- Constraints for table `fine`
--
ALTER TABLE `fine`
  ADD CONSTRAINT `fine_ibfk_1` FOREIGN KEY (`Borrow_ID`) REFERENCES `borrow` (`Borrow_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`Staff_ID`) REFERENCES `library_staff` (`Staff_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
