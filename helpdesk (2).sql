-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2023 at 06:20 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helpdesk`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `departemen_id` int(11) NOT NULL,
  `nama_departemen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`departemen_id`, `nama_departemen`) VALUES
(1, 'Unit Kerja Sumber Daya Manusia'),
(2, 'Unit Kerja Keuangan'),
(3, 'Unit Kerja IT'),
(4, 'Unit Kerja Penelitian dan Pengembangan'),
(5, 'Unit Kerja Satuan Pengawasan Intern'),
(6, 'Unit Kerja Umum dan Asset'),
(7, 'Unit Kerja Perencanaan Teknik'),
(8, 'Unit Kerja Produksi'),
(9, 'Unit Kerja Distribusi dan ATR'),
(10, 'Unit Kerja Layanan Pengadaan'),
(11, 'Unit Kerja Hukum Humas dan Kesekretariatan');

-- --------------------------------------------------------

--
-- Table structure for table `historymessage`
--

CREATE TABLE `historymessage` (
  `history_id` int(11) NOT NULL,
  `sesi_pesan` varchar(20) NOT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `status` varchar(15) DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `historymessage`
--

INSERT INTO `historymessage` (`history_id`, `sesi_pesan`, `kategori_id`, `sender_id`, `receiver_id`, `status`, `created_at`) VALUES
(58, 'PES0002', 3, 2, 5, 'taken', '2023-10-10 19:53:58');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sesi_pesan` varchar(20) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `reply` text DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'open',
  `image` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sesi_pesan`, `kategori_id`, `sender_id`, `receiver_id`, `message`, `reply`, `timestamp`, `status`, `image`) VALUES
(161, 'PES0002', 3, 2, 5, 'Hallo Bangs', NULL, '2023-10-10 19:53:58', 'taken', NULL),
(162, 'PES0002', 3, 5, 2, ' Naon euy', NULL, '2023-10-10 19:54:14', 'taken', ''),
(163, 'PES0002', 3, 2, 5, ' GA jadi', NULL, '2023-10-10 19:57:16', 'taken', ''),
(164, 'PES0002', 3, 2, 5, ' ', NULL, '2023-10-10 19:59:16', 'taken', 'photo_2023-07-24_21-41-09.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `teknisi_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `request_id` varchar(20) DEFAULT NULL,
  `sesi_pesan` varchar(15) DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `message_for_teknisi` varchar(150) DEFAULT NULL,
  `message_for_karyawan` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `link` varchar(150) DEFAULT NULL,
  `is_read` enum('UNREAD','READ') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `user_id`, `teknisi_id`, `role_id`, `request_id`, `sesi_pesan`, `kategori_id`, `department_id`, `message_for_teknisi`, `message_for_karyawan`, `created_at`, `link`, `is_read`) VALUES
(210, 2, NULL, NULL, 'REQ0001', NULL, 3, 3, 'Perangkat Personal Computer  dari Reyhan Adriana Deris Departemen IT memiliki masalah dan butuh diperbaiki.', 'Anda telah mengajukan permintaan perbaikan untuk perangkat Personal Computer .', '2023-09-28 20:51:38', 'Dashboard/Search?keyword=REQ0001', 'UNREAD'),
(211, 2, 5, NULL, 'REQ0001', NULL, 3, 3, 'Perangkat Personal Computer  dari Reyhan Adriana Deris Departemen IT Telah Diproses oleh Farhan.', 'Perangkat Personal Computer  Anda Telah Diproses.', '2023-09-28 20:55:59', 'Dashboard/Search?keyword=REQ0001', 'UNREAD'),
(212, 2, 5, NULL, 'REQ0001', NULL, 3, 3, 'Perangkat Personal Computer  dari Reyhan Adriana Deris Departemen IT Telah Diproses oleh Farhan.', 'Perangkat Personal Computer  Anda Telah Diproses.', '2023-09-28 21:11:15', 'Dashboard/Search?keyword=REQ0001', 'UNREAD'),
(213, 2, 5, NULL, 'REQ0001', NULL, 3, 3, 'Perangkat Personal Computer  dari Reyhan Adriana Deris Departemen IT Telah Diproses oleh Farhan.', 'Perangkat Personal Computer  Anda Telah Diproses.', '2023-09-28 21:12:35', 'Dashboard/Search?keyword=REQ0001', 'UNREAD'),
(214, 2, 5, NULL, 'REQ0001', NULL, 3, 3, 'Perangkat Personal Computer  dari Reyhan Adriana Deris Departemen IT Telah Diperbaiki oleh Saya.', 'Perangkat Personal Computer  Telah Diperbaiki olehFarhan', '2023-09-28 21:14:18', 'Dashboard/Search?keyword=REQ0001', 'UNREAD'),
(215, 2, NULL, NULL, 'REQ0002', NULL, 3, 3, 'Perangkat Personal Computer  dari Reyhan Adriana Deris Departemen IT memiliki masalah dan butuh diperbaiki.', 'Anda telah mengajukan permintaan perbaikan untuk perangkat Personal Computer .', '2023-09-28 21:15:49', 'Dashboard/Search?keyword=REQ0002', 'UNREAD'),
(216, 2, 5, NULL, 'REQ0002', NULL, 3, 3, 'Perangkat Personal Computer  dari Reyhan Adriana Deris Departemen IT Telah Diproses oleh Farhan.', 'Perangkat Personal Computer  Anda Telah Diproses.', '2023-09-28 21:16:26', 'Dashboard/Search?keyword=REQ0002', 'UNREAD'),
(217, 2, 5, NULL, 'REQ0002', NULL, 3, 3, 'Perangkat Personal Computer  dari Reyhan Adriana Deris Departemen IT Tidak Dapat Diperbaiki oleh Saya.', 'Perangkat Personal Computer  Tidak Dapat Diperbaiki oleh Farhan', '2023-09-28 21:16:42', 'Dashboard/Search?keyword=REQ0002', 'UNREAD'),
(253, 2, NULL, NULL, 'REQ0003', NULL, 3, 3, 'Perangkat Windwos 10 dari Reyhan Adriana Deris Departemen IT memiliki masalah dan butuh diperbaiki.', 'Anda telah mengajukan permintaan perbaikan untuk perangkat Windwos 10.', '2023-10-05 21:31:10', 'Dashboard/Search?keyword=REQ0003', 'UNREAD'),
(254, 2, NULL, NULL, 'REQ0004', NULL, 3, 3, 'Perangkat Personal Computer  dari Reyhan Adriana Deris Departemen IT memiliki masalah dan butuh diperbaiki.', 'Anda telah mengajukan permintaan perbaikan untuk perangkat Personal Computer .', '2023-10-05 21:38:49', 'Dashboard/Search?keyword=REQ0004', 'UNREAD'),
(255, 2, NULL, NULL, 'REQ0005', NULL, 3, 3, 'Perangkat Mouse Logitech dari Reyhan Adriana Deris Departemen IT memiliki masalah dan butuh diperbaiki.', 'Anda telah mengajukan permintaan perbaikan untuk perangkat Mouse Logitech.', '2023-10-05 21:44:06', 'Dashboard/Search?keyword=REQ0005', 'UNREAD'),
(256, 2, 5, NULL, 'REQ0003', NULL, 3, 3, 'Perangkat Windwos 10 dari Reyhan Adriana Deris Departemen IT Telah Diproses oleh farhan.', 'Perangkat Windwos 10 Anda Telah Diproses.', '2023-10-05 22:09:28', 'Dashboard/Search?keyword=REQ0003', 'UNREAD'),
(257, 2, 9, NULL, 'REQ0005', NULL, 3, 3, 'Perangkat Mouse Logitech dari Reyhan Adriana Deris Departemen IT Telah Diproses oleh icam.', 'Perangkat Mouse Logitech Anda Telah Diproses.', '2023-10-05 22:31:10', 'Dashboard/Search?keyword=REQ0005', 'UNREAD'),
(258, 2, 5, NULL, 'REQ0003', NULL, 3, 3, 'Perangkat Windwos 10 dari Reyhan Adriana Deris Departemen IT Telah Diperbaiki oleh Saya.', 'Perangkat Windwos 10 Telah Diperbaiki oleh farhan', '2023-10-06 00:53:06', 'Dashboard/Search?keyword=REQ0003', 'UNREAD'),
(259, 2, NULL, NULL, 'REQ0006', NULL, 3, 3, 'Perangkat Microsoft Office 356 dari Reyhan Adriana Deris Departemen IT memiliki masalah dan butuh diperbaiki.', 'Anda telah mengajukan permintaan perbaikan untuk perangkat Microsoft Office 356.', '2023-10-06 01:09:52', 'Dashboard/Search?keyword=REQ0006', 'UNREAD'),
(274, 2, NULL, NULL, NULL, 'PES0002', 3, 3, 'Terdapat Pesan Baru dari Reyhan Adriana Deris Dengan Sesi Pesan PES0002', 'Anda Telah Mengajukan Live Chat untuk kategori Hardware.', '2023-10-11 09:53:58', 'KelolaPesan/chatroom/PES0002', 'UNREAD'),
(275, 2, 5, NULL, NULL, 'PES0002', 3, NULL, 'Anda Menerima Live Chat dari Reyhan Adriana Deris Dengan Sesi Pesan: PES0002', 'Live Chat Anda Telah Diterima Oleh farhan. Dengan Sesi Pesan: PES0002.', '2023-10-11 09:54:06', 'KelolaPesan/chatroom/PES0002', 'UNREAD'),
(276, 2, 5, NULL, NULL, 'PES0002', 3, 3, NULL, 'Farhan Raihan Wahidin Pesan:  Naon euy', '2023-10-11 09:54:14', 'KelolaPesan/chatroom/PES0002', 'UNREAD'),
(277, 5, 2, NULL, NULL, 'PES0002', 3, 3, 'Reyhan Adriana Deris Pesan:  GA jadi', NULL, '2023-10-11 09:57:16', 'KelolaPesan/chatroom/PES0002', 'UNREAD'),
(278, 5, 2, NULL, NULL, 'PES0002', 3, 3, 'Reyhan Adriana Deris Pesan:  ', NULL, '2023-10-11 09:59:16', 'KelolaPesan/chatroom/PES0002', 'UNREAD');

-- --------------------------------------------------------

--
-- Table structure for table `perangkat`
--

CREATE TABLE `perangkat` (
  `id` int(11) NOT NULL,
  `nomer_seri` varchar(100) NOT NULL,
  `nama_perangkat` varchar(255) DEFAULT NULL,
  `ipaddress` varchar(50) DEFAULT NULL,
  `spesifikasi` varchar(1000) DEFAULT NULL,
  `departemen_id` int(11) DEFAULT NULL,
  `status_perangkat` varchar(15) DEFAULT 'RUNNING',
  `catatan` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `kategori_id` int(11) NOT NULL,
  `foto` varchar(200) NOT NULL,
  `tanggal_masuk` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `perangkat`
--

INSERT INTO `perangkat` (`id`, `nomer_seri`, `nama_perangkat`, `ipaddress`, `spesifikasi`, `departemen_id`, `status_perangkat`, `catatan`, `user_id`, `kategori_id`, `foto`, `tanggal_masuk`) VALUES
(27, 'M-Logi-001', 'Mouse Logitech', NULL, 'Mouse + Bluetooth Receiver', 3, 'PROSES', NULL, 2, 3, 'mouse.jpg', '2023-10-01'),
(28, 'PC-IT-001', 'Personal Computer ', '192.168.1.1', 'Intel Core i3, RAM 8GB, 512 GB SSD', 3, 'DIPAKAI', NULL, 2, 3, 'komputer.jpg', '2023-10-03'),
(29, 'Windwos10-crack', 'Windwos 10', NULL, 'Windwos 10', 3, 'DIPAKAI', NULL, 2, 4, 'WIndows10Pro.jpg', '2023-10-02'),
(30, 'MSoff-01', 'Microsoft Office 356', NULL, 'MS Word, MS Excel, MS Power Point', 3, 'DIPAKAI', NULL, 2, 4, 'msoffice.jpg', '2023-10-04'),
(36, '12345AB678', 'Smartphone Samsung Galaxy S21', NULL, 'RAM 2GB, ROM 32GB', 1, 'DIPAKAI', NULL, 4, 3, 'hp-sasmung-a10s-harga-satu-jutaan.jpg', '0000-00-00'),
(37, 'XYZ7890W', 'Laptop Dell XPS 13 ', NULL, 'Intel Core i7 gen8', 1, 'DIPAKAI', NULL, 4, 3, 'laptop.jpg', '0000-00-00'),
(38, 'KLMN5678P', 'Keyboard Lenovo', NULL, 'Mechanical', 1, 'DIPAKAI', NULL, 4, 3, 'lenovo-sk-8823-1671184460.jpg', '0000-00-00'),
(39, '7890GHJKL', 'Printer Epson', NULL, 'Printer dan Scanner', 1, 'DIPAKAI', NULL, 4, 3, 'SC-P600.jpg', '0000-00-00'),
(40, 'ms-office2', 'Microsoft Office 2019', NULL, 'Microsoft Office 2019', 1, 'DIPAKAI', NULL, 4, 4, 'microsoft-office_0.jpg', '0000-00-00'),
(41, 'AB12CD34EF', 'Monitor LG 27GL83A-B', NULL, '122hz', 3, 'DIPAKAI', NULL, 6, 3, 'lg_22mk400h_b_22_full_hd_radeon_1445083.jpg', '0000-00-00'),
(42, '98765QWERT', 'mouse logitech', NULL, 'Wireless', 3, 'DIPAKAI', NULL, 6, 3, 'logitech-b100-large.jpg', '0000-00-00'),
(43, 'MN2456PQ', 'PC', NULL, 'Intel Core i7 gen 8, Ram 8GB, SSD 500GB, VGA Geforce 1660 Ti Max Q 6GB', 3, 'DIPAKAI', NULL, 6, 3, 'dell_hr4w0_optiplex_5040_mini_tower_1233922.jpg', '0000-00-00'),
(44, 'ms-office3', 'Microsoft Office 2019', NULL, 'Microsoft Office 2019', 3, 'DIPAKAI', NULL, 6, 4, 'microsoft-office_01.jpg', '0000-00-00'),
(45, 'X1Y23A4Q', 'Handphone Samsung a10s', NULL, 'RAM 3GB, ROM 32GB', 3, 'DIPAKAI', NULL, 6, 3, 'hp-sasmung-a10s-harga-satu-jutaan1.jpg', '0000-00-00'),
(46, '223XPS431', 'Laptop Dell XPS 13 ', NULL, 'Intel Core i7 Gen8, RAM 8GB, SSD 500GB, VGA Nvidia Geforce 1080 4GB', 1, 'DIPAKAI', NULL, 11, 3, 'laptop1.jpg', '0000-00-00'),
(47, '123DSAD', 'Printer Epson', NULL, 'Printer dan Scanner', 1, 'DIPAKAI', NULL, 11, 3, 'SC-P6001.jpg', '0000-00-00'),
(48, '213XZ12AD', 'mouse logitech', NULL, 'Mouse Wireless', 1, 'DIPAKAI', NULL, 11, 3, 'logitech-b100-large1.jpg', '0000-00-00'),
(49, 'ms-office4', 'Microsoft Office 2023', NULL, 'Microsoft Office 2023', 1, 'DIPAKAI', NULL, 11, 4, 'microsoft-office_02.jpg', '0000-00-00'),
(50, 'I20X01P', 'Handphone Iphone XS-Max', NULL, '512GB', 1, 'DIPAKAI', NULL, 11, 3, 'iPhone-XS-Max.jpg', '0000-00-00'),
(51, 'AX4211SD', 'Webcam Logitech C310', NULL, 'HD 720', 1, 'DIPAKAI', NULL, 12, 3, 'Logitech_960_000585_C310_HD_Webcam_709599.jpg', '0000-00-00'),
(52, 'XZ1121AA', 'Laptop Dell XPS 13 ', NULL, 'Intel Core i5 Gen 9, Ram 8GB, VGA Nvidia Geforce GTX 1080 4GB', 1, 'DIPAKAI', NULL, 12, 3, 'laptop2.jpg', '0000-00-00'),
(53, 'ms-office5', 'Microsoft Office 2019', NULL, 'Microsoft Office 2019', 1, 'DIPAKAI', NULL, 12, 4, 'microsoft-office_03.jpg', '0000-00-00'),
(54, 'AXX213FF', 'mouse logitech', NULL, 'Wireless', 1, 'DIPAKAI', NULL, 12, 3, 'logitech-b100-large2.jpg', '0000-00-00'),
(55, '6789IJKL01', 'Hard disk External', NULL, '1 Tera', 1, 'DIPAKAI', NULL, 12, 3, 'R.jpeg', '0000-00-00'),
(56, 'MA947CX', 'Proyektor Canon', NULL, '1500 Lumens LED ', 1, 'DIPAKAI', NULL, 13, 3, 'OIP.jpeg', '0000-00-00'),
(57, 'MC93PZA', 'Laptop Acer Nitro', NULL, 'AMD Ryzen 7, RAM 8GB, SSD 512GB, VGA Nvidia 1660 TI MaxQ 6GB', 1, 'DIPAKAI', NULL, 13, 3, 'laptop3.jpg', '0000-00-00'),
(58, 'MLC0993A', 'mouse logitech', NULL, 'Wireless', 1, 'DIPAKAI', NULL, 13, 3, 'logitech-b100-large3.jpg', '0000-00-00'),
(59, 'ms-office6', 'Microsoft Office 2019', NULL, 'Microsoft Office 2019', 1, 'DIPAKAI', NULL, 13, 4, 'microsoft-office_04.jpg', '0000-00-00'),
(60, '9Q112MCN', 'Printer Epson', NULL, 'Printer dan Scanner', 1, 'DIPAKAI', NULL, 13, 3, 'SC-P6002.jpg', '0000-00-00'),
(62, 'ms-office7', 'Microsoft Office 2019', NULL, 'Microsoft Office 2019', 1, 'DIPAKAI', NULL, 14, 4, 'microsoft-office_05.jpg', '0000-00-00'),
(63, 'XA039411', 'Laptop Dell XPS 13 ', NULL, 'Intel Core i5 gen 10, RAM 8GB, SSD 512GB, VGA Nvidia GTX 1080 4GB', 1, 'DIPAKAI', NULL, 14, 3, 'laptop4.jpg', '0000-00-00'),
(64, 'KA0029FA', 'mouse logitech', NULL, 'Kabel', 1, 'DIPAKAI', NULL, 14, 3, 'logitech-b100-large4.jpg', '0000-00-00'),
(65, 'HX00923', 'Hard disk External', NULL, '512GB', 1, 'DIPAKAI', NULL, 14, 3, 'R2.jpeg', '0000-00-00'),
(66, 'MK901A', 'Webcam Logitech C310', NULL, 'HD720', 1, 'DIPAKAI', NULL, 14, 3, 'Logitech_960_000585_C310_HD_Webcam_7095991.jpg', '0000-00-00'),
(67, 'MX30219', 'Laptop Acer Nitro', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060', 1, 'DIPAKAI', NULL, 15, 3, 'laptop5.jpg', '0000-00-00'),
(68, 'NC03491X', 'Laptop Lenovo Legion', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060', 1, 'DIPAKAI', NULL, 16, 3, 'laptop6.jpg', '0000-00-00'),
(69, 'NCK09841X', 'PC', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060', 1, 'DIPAKAI', NULL, 17, 3, 'dell_hr4w0_optiplex_5040_mini_tower_12339221.jpg', '0000-00-00'),
(70, 'MADK9043', 'Keyboard Lenovo', NULL, 'Mechanical', 1, 'DIPAKAI', NULL, 17, 3, 'lenovo-sk-8823-16711844601.jpg', '0000-00-00'),
(71, 'KDJ0201A', 'Monitor LG 27GL83A-B', NULL, '144Hz', 1, 'DIPAKAI', NULL, 17, 3, 'lg_22mk400h_b_22_full_hd_radeon_14450831.jpg', '0000-00-00'),
(72, 'MSA0930', 'mouse logitech', NULL, 'Wireless', 1, 'DIPAKAI', NULL, 17, 3, 'logitech-b100-large5.jpg', '0000-00-00'),
(73, 'MAK3902', 'mouse logitech', NULL, 'Wireless', 1, 'DIPAKAI', NULL, 16, 3, 'logitech-b100-large6.jpg', '0000-00-00'),
(74, 'L09934', 'Laptop Lenovo Legion', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060', 2, 'DIPAKAI', NULL, 18, 3, 'laptop7.jpg', '0000-00-00'),
(75, 'L075832', 'Laptop Lenovo Legion', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060', 2, 'DIPAKAI', NULL, 19, 3, 'laptop8.jpg', '0000-00-00'),
(76, 'LX9384', 'Laptop Asus Vivobook', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060', 2, 'DIPAKAI', NULL, 20, 3, 'laptop9.jpg', '0000-00-00'),
(77, 'LX913S', 'Laptop Asus Vivobook', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060', 2, 'DIPAKAI', NULL, 21, 3, 'laptop10.jpg', '0000-00-00'),
(78, 'MCX9341', 'Laptop Lenovo Ideapad', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060', 2, 'DIPAKAI', NULL, 22, 3, 'laptop11.jpg', '0000-00-00'),
(79, 'MAS2903', 'Laptop MSI GF63', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060', 2, 'DIPAKAI', NULL, 23, 3, 'laptop12.jpg', '0000-00-00'),
(80, 'MC0109', 'Macbook Pro 16', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060', 2, 'DIPAKAI', NULL, 24, 3, 'laptop13.jpg', '0000-00-00'),
(81, 'MZS9128', 'Laptop Asus Zenbook', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060', 2, 'DIPAKAI', NULL, 25, 3, 'laptop14.jpg', '0000-00-00'),
(82, 'LXS9994', 'Laptop HP Pavilion', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060', 2, 'DIPAKAI', NULL, 26, 3, 'laptop15.jpg', '0000-00-00'),
(83, 'NCS9012', 'Laptop Acer Aspire', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060', 2, 'DIPAKAI', NULL, 27, 3, 'laptop16.jpg', '0000-00-00'),
(84, 'MCS292', 'Laptop Acer Predator', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060', 4, 'DIPAKAI', NULL, 28, 3, 'laptop17.jpg', '0000-00-00'),
(85, 'MCK932', 'Laptop Asus Vivobook', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060', 4, 'DIPAKAI', NULL, 29, 3, 'laptop18.jpg', '0000-00-00'),
(86, 'NCA903', 'Macbook Pro 18', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060', 4, 'DIPAKAI', NULL, 30, 3, 'laptop19.jpg', '0000-00-00'),
(87, 'OSK928', 'Laptop Acer Aspire', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060', 4, 'DIPAKAI', NULL, 31, 3, 'laptop20.jpg', '0000-00-00'),
(88, 'KDM9381', 'Laptop Lenovo Legion', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060', 4, 'DIPAKAI', NULL, 32, 3, 'laptop21.jpg', '0000-00-00'),
(89, 'MSD123', 'Laptop Acer Aspire', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060', 4, 'DIPAKAI', NULL, 33, 3, 'laptop22.jpg', '0000-00-00'),
(90, 'CS8821', 'Laptop Dell XPS 13 ', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060	', 4, 'DIPAKAI', NULL, 34, 3, 'laptop23.jpg', '0000-00-00'),
(91, 'MX46162', 'Macbook Pro 18', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Intel Graphic	', 4, 'DIPAKAI', NULL, 35, 3, 'laptop24.jpg', '0000-00-00'),
(92, 'XA737DS', 'Laptop Lenovo Legion', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060	', 4, 'DIPAKAI', NULL, 36, 3, 'laptop25.jpg', '0000-00-00'),
(93, 'NXL3771', 'Laptop Acer Aspire', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060	', 4, 'DIPAKAI', NULL, 37, 3, 'laptop26.jpg', '0000-00-00'),
(94, 'AX736K', 'Laptop Lenovo Legion', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060	', 5, 'DIPAKAI', NULL, 38, 3, 'laptop27.jpg', '0000-00-00'),
(95, 'DX3422K', 'Laptop Lenovo Legion', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060	', 5, 'DIPAKAI', NULL, 39, 3, 'laptop28.jpg', '0000-00-00'),
(96, 'CF6687Z', 'Laptop Dell XPS 13 ', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060	', 5, 'DIPAKAI', NULL, 40, 3, 'laptop29.jpg', '0000-00-00'),
(97, 'JK5433X', 'Laptop Acer Predator', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060	', 5, 'DIPAKAI', NULL, 41, 3, 'laptop30.jpg', '0000-00-00'),
(98, 'NA8372S', 'Laptop Dell XPS 13 ', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060	', 5, 'DIPAKAI', NULL, 42, 3, 'laptop31.jpg', '0000-00-00'),
(99, 'NXA88831', 'Laptop Asus Vivobook', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060	', 5, 'DIPAKAI', NULL, 43, 3, 'laptop32.jpg', '0000-00-00'),
(100, 'AW3838L', 'Laptop Acer Nitro', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060	', 5, 'DIPAKAI', NULL, 44, 3, 'laptop33.jpg', '0000-00-00'),
(101, 'JX93911A', 'Laptop Acer Predator', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060	', 5, 'DIPAKAI', NULL, 45, 3, 'laptop34.jpg', '0000-00-00'),
(102, 'MD8821Z', 'Laptop Asus Vivobook', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060	', 5, 'DIPAKAI', NULL, 46, 3, 'laptop35.jpg', '0000-00-00'),
(103, 'NDS7D22', 'Laptop Asus Vivobook', NULL, 'Intel Core i7 Gen10, RAM 4GB, SSD 512, VGA Nvidia GTX 1060	', 5, 'DIPAKAI', NULL, 46, 3, 'laptop36.jpg', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `problemcategories`
--

CREATE TABLE `problemcategories` (
  `kategori_id` int(11) NOT NULL,
  `nama_kategori` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `problemcategories`
--

INSERT INTO `problemcategories` (`kategori_id`, `nama_kategori`) VALUES
(1, 'Data'),
(2, 'Jaringan'),
(3, 'Hardware'),
(4, 'Aplikasi'),
(5, 'Otomasi'),
(6, 'Geographic Information System');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `nama_role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `nama_role`) VALUES
(1, 'Administator'),
(2, 'Karyawan'),
(3, 'Teknisi');

-- --------------------------------------------------------

--
-- Table structure for table `supportticket`
--

CREATE TABLE `supportticket` (
  `id` int(11) NOT NULL,
  `request_id` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `perangkat_id` int(11) NOT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `status` varchar(15) DEFAULT NULL,
  `deskripsi_permasalahan` text DEFAULT NULL,
  `prioritas` varchar(10) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `tanggal_dibuat` datetime DEFAULT NULL,
  `tanggal_ditangani` datetime DEFAULT NULL,
  `catatan` varchar(100) DEFAULT NULL,
  `penanggung_jawab_perbaikan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supportticket`
--

INSERT INTO `supportticket` (`id`, `request_id`, `user_id`, `role_id`, `perangkat_id`, `kategori_id`, `department_id`, `status`, `deskripsi_permasalahan`, `prioritas`, `foto`, `tanggal_dibuat`, `tanggal_ditangani`, `catatan`, `penanggung_jawab_perbaikan`) VALUES
(42, 'REQ0001', 2, 2, 28, 3, 3, 'DIPAKAI', 'Ga Nyala', 'High', 'fotor-ai-20230918234958.jpg', '2023-09-28 13:51:38', '2023-09-28 14:14:18', 'Bisa Nyala Lagi karena RAM Kotor', 5),
(43, 'REQ0002', 2, 2, 28, 3, 3, 'RUSAK', 'Ga nyala lagi bang', 'High', 'jamu-temulawak.jpg', '2023-09-28 14:15:49', '2023-09-28 14:16:42', 'Gabisa dibenerin kali ini', 5),
(44, 'REQ0003', 2, 2, 29, 4, 3, 'DIPAKAI', 'GA JALAN', 'High', 'ss1.jpg', '2023-10-05 14:31:10', '2023-10-05 17:53:06', 'Aman bang', 5),
(45, 'REQ0004', 2, 2, 28, 3, 3, 'DIBATALKAN', 'Cek kabel2nya lagi aja bang', 'High', 'Jamu_Manunggal.png', '2023-10-05 14:38:49', NULL, NULL, NULL),
(46, 'REQ0005', 2, 2, 27, 4, 3, 'PROSES', 'Klik kanan ga jalan', 'High', 'Cara-Membuat-Beras-Kencur-Resep-dan-Manfaatnya-Bagi-Kesehatan.jpg', '2023-10-05 14:44:06', NULL, NULL, 9),
(47, 'REQ0006', 2, 2, 30, 4, 3, 'DIBATALKAN', 'Butuh Aktivasi', 'High', 'wedang-jahe.jpg', '2023-10-05 18:09:52', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `karyawan_id` varchar(50) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `foto_user` varchar(100) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `departemen_id` int(11) DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `status` enum('Aktif','Tidak Aktif') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `karyawan_id`, `nama`, `username`, `email`, `password`, `foto_user`, `role_id`, `departemen_id`, `kategori_id`, `status`) VALUES
(2, 'KAR0001', 'Reyhan Adriana Deris', 'Reyhanadr', 'reyhanadr@gmail.com', '202cb962ac59075b964b07152d234b70', 'LRM_EXPORT_20230616_102536-PhotoRoom_png-PhotoRoom.png', 2, 3, NULL, 'Aktif'),
(4, 'KAR0003', 'Indro', 'indro', 'indro@gmail.com', '202cb962ac59075b964b07152d234b70', 'indro.jpg', 2, 1, NULL, 'Aktif'),
(5, 'TEK00001', 'Farhan Raihan Wahidin', 'farhan', 'farhan@gmail.com', '202cb962ac59075b964b07152d234b70', 'fp_ebiet_g_ade.jpg', 3, 3, 3, 'Aktif'),
(6, 'KAR0004', 'Setyo Arie Anggara', 'Setyo', 'setyoarie@gmail.com', '202cb962ac59075b964b07152d234b70', 'setyo.jpg', 2, 3, NULL, 'Aktif'),
(7, 'ADM0001', 'Wawan Hermawan', 'wawan', 'wawan@gmail.com', '202cb962ac59075b964b07152d234b70', 'reyhanadr.jpg', 1, 3, NULL, 'Aktif'),
(8, 'TEK00002', 'Maman Hemaman', 'Maman', 'maman@gmail.com', '202cb962ac59075b964b07152d234b70', 'reyhanadr.jpg', 3, 3, 2, 'Aktif'),
(9, 'TEK00003', 'Icam Suricam', 'icam', 'icam@gmail.com', '202cb962ac59075b964b07152d234b70', 'icam.jpg', 3, 3, 3, 'Aktif'),
(10, 'ADM0002', 'Babang Tamvan', 'admin', 'admin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'fp_ebiet_g_ade2.jpg', 1, 3, NULL, 'Aktif'),
(11, 'KAR0002', 'Siti Rahayu', 'sitirahayu456', 'sitirahayu456@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 1, NULL, 'Aktif'),
(12, 'KAR0005', 'Eko Sutrisno', 'eko_sutrisno', 'eko.sutrisno@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 1, NULL, 'Aktif'),
(13, 'KAR0006', 'Rina Fitriani', 'rinafitriani7', 'rina.fitriani@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 1, NULL, 'Aktif'),
(14, 'KAR0007', 'Iwan Santoso', 'iwan_santoso99', 'iwan.santoso@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 1, NULL, 'Aktif'),
(15, 'KAR0008', 'Maya Utami', 'maya_utami45', 'maya.utami@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 1, NULL, 'Aktif'),
(16, 'KAR0009', 'Dedy Kurniawan', 'dedykurniawan1', 'dedy.kurniawan@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 1, NULL, 'Aktif'),
(17, 'KAR0010', 'Wulan Sari', 'wulansari88', 'wulan.sari@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 1, NULL, 'Aktif'),
(18, 'KAR0011', 'Hadi Purnomo', 'hadipurnomo33', 'hadi.purnomo@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 2, NULL, 'Aktif'),
(19, 'KAR0012', 'Retno Wulandari', 'retnowulandari4', 'retno.wulandari@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 2, NULL, 'Aktif'),
(20, 'KAR0013', 'Ari Wijaya', 'ariwijaya55', 'ari.wijaya@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 2, NULL, 'Aktif'),
(21, 'KAR0014', 'Rini Anggraini', 'rinianggraini9', 'rini.anggraini@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 2, NULL, 'Aktif'),
(22, 'KAR0015', 'Andi Sutanto', 'andisutanto10', 'andi.sutanto@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 2, NULL, 'Aktif'),
(23, 'KAR0016', 'Nisa Rachmawati', 'nisarachmawati12', 'rachmawati@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 2, NULL, 'Aktif'),
(24, 'KAR0017', 'Dian Pratama', 'dianpratama66', 'dian.pratama@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 2, NULL, 'Aktif'),
(25, 'KAR0018', 'Eka Setiawan', 'ekasetiawan22', 'eka.setiawan@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 2, NULL, 'Aktif'),
(26, 'KAR0019', 'Indra Saputra', 'indrasaputra77', 'indra.saputra@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 2, NULL, 'Aktif'),
(27, 'KAR0020', 'Rina Puspita', 'rinapuspita5', 'rina.puspita@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 2, NULL, 'Aktif'),
(28, 'KAR0021', 'Doni Susilo', 'donisusilo44', 'doni.susilo@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 4, NULL, 'Aktif'),
(29, 'KAR0022', 'Sari Wijaya', 'sariwijaya1', 'sari.wijaya@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 4, NULL, 'Aktif'),
(30, 'KAR0023', 'Bima Pradana', 'bimapradana21', 'bima.pradana@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 4, NULL, 'Aktif'),
(31, 'KAR0024', 'Maya Hidayat', 'mayahidayat8', 'maya.hidayat@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 4, NULL, 'Aktif'),
(32, 'KAR0025', 'Rian Saputra', 'riansaputra13', 'rian.saputra@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 4, NULL, 'Aktif'),
(33, 'KAR0026', 'Ratna Sari', 'ratnasari76', 'ratna.sari@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 4, NULL, 'Aktif'),
(34, 'KAR0027', 'Irfan Setiawan', 'irfansetiawan55', 'irfan.setiawan@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 4, NULL, 'Aktif'),
(35, 'KAR0028', 'Nia Kusuma', 'niakusuma99', 'nia.kusuma@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 4, NULL, 'Aktif'),
(36, 'KAR0029', 'Eko Pratama', 'ekopratama34', 'eko.pratama@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 4, NULL, 'Aktif'),
(37, 'KAR0030', 'Dina Susanti', 'dinasusanti23', 'dina.susanti@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 4, NULL, 'Aktif'),
(38, 'KAR0031', 'Ari Wibowo', 'ariwibowo67', 'ari.wibowo@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 5, NULL, 'Aktif'),
(39, 'KAR0032', 'Siti Rizki', 'sitirizki12', 'siti.rizki@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 5, NULL, 'Aktif'),
(40, 'KAR0033', 'Wawan Sutrisno', 'wawansutrisno7', 'wawan.sutrisno@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 5, NULL, 'Aktif'),
(41, 'KAR0034', 'Nia Pratiwi', 'niapratiwi99', 'nia.pratiwi@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 5, NULL, 'Aktif'),
(42, 'KAR0035', 'Budi Santoso', 'budisantoso45', 'budi.santoso@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 5, NULL, 'Aktif'),
(43, 'KAR0036', 'Maya Sari', 'mayasari88', 'maya.sari@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 5, NULL, 'Aktif'),
(44, 'KAR0037', 'Eko Kusuma', 'ekokusuma1', 'eko.kusuma@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 5, NULL, 'Aktif'),
(45, 'KAR0038', 'Rini Setiawan', 'rinisetiawan33', 'rini.setiawan@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 5, NULL, 'Aktif'),
(46, 'KAR0039', 'Rian Pratama', 'rianpratama77', 'rian.pratama@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 5, NULL, 'Aktif'),
(47, 'KAR0040', 'Sari Wibowo', 'sariwibowo12', 'sari.wibowo@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 5, NULL, NULL),
(48, 'KAR0041', 'Doni Hidayat', 'donihidayat44', 'doni.hidayat@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 6, NULL, NULL),
(49, 'KAR0042', 'Retno Saputra', 'retnosaputra55', 'retno.saputra@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 6, NULL, NULL),
(50, 'KAR0043', 'Bima Kusuma', 'bimakusuma99', 'bima.kusuma@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 6, NULL, NULL),
(51, 'KAR0044', 'Nisa Pratiwi', 'nisapratiwi76', 'nisa.pratiwi@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 6, NULL, NULL),
(52, 'KAR0045', 'Irfan Setiawan', 'irfansetiawan23', 'irfan.setiawan@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 6, NULL, NULL),
(53, 'KAR0046', 'Nia Susanti', 'niasusanti21', 'nia.susanti@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 6, NULL, NULL),
(54, 'KAR0047', 'Dina Sari', 'dinasari1', 'dina.sari@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 6, NULL, NULL),
(55, 'KAR0048', 'Ari Hidayat', 'arihidayat8', 'ari.hidayat@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 6, NULL, NULL),
(56, 'KAR0049', 'Siti Pratama', 'sitipratama55', 'siti.pratama@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 6, NULL, NULL),
(57, 'KAR0050', 'Wawan Saputra', 'wawansaputra12', 'wawan.saputra@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 6, NULL, NULL),
(58, 'KAR0051', 'Ratna Setiawan', 'ratnasetiawan33', 'ratna.setiawan@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 7, NULL, NULL),
(59, 'KAR0052', 'Budi Wibowo', 'budiwibowo77', 'budi.wibowo@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 7, NULL, NULL),
(60, 'KAR0053', 'Eka Hidayat', 'ekahidayat12', 'hidayat@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 7, NULL, NULL),
(61, 'KAR0054', 'Maya Pratiwi', 'mayapratiwi99', 'maya.pratiwi@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 7, NULL, NULL),
(62, 'KAR0055', 'Doni Susanti', 'donisusanti45', 'doni.susanti@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 7, NULL, NULL),
(63, 'KAR0056', 'Rini Saputra', 'rinisaputra5', 'rini.saputra@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 7, NULL, NULL),
(64, 'KAR0057', 'Nisa Kusuma', 'nisakusuma44', 'nisa.kusuma@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 7, NULL, NULL),
(65, 'KAR0058', 'Ari Setiawan', 'arisetiawan12', 'ari.setiawan@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 7, NULL, NULL),
(66, 'KAR0059', 'Sari Hidayat', 'sarihidayat55', 'sari.hidayat@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 7, NULL, NULL),
(67, 'KAR0060', 'Rian Wibowo', 'rianwibowo99', 'rian.wibowo@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 7, NULL, NULL),
(68, 'KAR0061', 'Eko Pratiwi', 'ekopratiwi33', 'eko.pratiwi@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 8, NULL, NULL),
(69, 'KAR0062', 'Dina Kusuma', 'dinakusuma1', 'dina.kusuma@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 8, NULL, NULL),
(70, 'KAR0063', 'Budi Saputra', 'budisaputra23', 'budi.saputra@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 8, NULL, NULL),
(71, 'KAR0064', 'Nia Wibowo', 'niawibowo12', 'nia.wibowo@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 8, NULL, NULL),
(72, 'KAR0065', 'Wawan Hidayat', 'wawanhidayat76', 'wawan.hidayat@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 8, NULL, NULL),
(73, 'KAR0066', 'Maya Susanti', 'mayasusanti7', 'maya.susanti@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 8, NULL, NULL),
(74, 'KAR0067', 'Doni Kusuma', 'donikusuma45', 'doni.kusuma@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 8, NULL, NULL),
(75, 'KAR0068', 'Sari Saputra', 'sarisaputra55', 'sari.saputra@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 8, NULL, NULL),
(76, 'KAR0069', 'Rini Hidayat', 'rinihidayat33', 'rini.hidayat@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 8, NULL, NULL),
(77, 'KAR0070', 'Nisa Wibowo', 'nisawibowo99', 'nisa.wibowo@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 8, NULL, NULL),
(78, 'KAR0071', 'Ari Pratiwi', 'aripratiwi1', 'ari.pratiwi@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 9, NULL, NULL),
(79, 'KAR0072', 'Eko Susanti', 'ekosusanti12', 'eko.susanti@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 9, NULL, NULL),
(80, 'KAR0073', 'Budi Kusuma', 'budikusuma44', 'budi.kusuma@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 9, NULL, NULL),
(81, 'KAR0074', 'Ratna Wibowo', 'ratnawibowo7', 'ratna.wibowo@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 9, NULL, NULL),
(82, 'KAR0075', 'Siti Hidayat', 'sitihidayat45', 'siti.hidayat@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 9, NULL, NULL),
(83, 'KAR0076', 'Wawan Pratiwi', 'wawanpratiwi33', 'wawan.pratiwi@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 9, NULL, NULL),
(84, 'KAR0077', 'Dina Saputra', 'dinasaputra99', 'dina.saputra@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 9, NULL, NULL),
(85, 'KAR0078', 'Nia Susanti', 'niasusanti12', 'nia.susanti@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 9, NULL, NULL),
(86, 'KAR0079', 'Maya Kusuma', 'mayakusuma23', 'maya.kusuma@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 9, NULL, NULL),
(87, 'KAR0080', 'Eka Wibowo', 'ekawibowo33', 'eka.wibowo@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 9, NULL, NULL),
(88, 'KAR0081', 'Doni Hidayat', 'donihidayat1', 'doni.hidayat@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 10, NULL, NULL),
(89, 'KAR0082', 'Ari Saputra', 'arisaputra7', 'ari.saputra@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 10, NULL, NULL),
(90, 'KAR0083', 'Sari Pratiwi', 'saripratiwi45', 'sari.pratiwi@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 10, NULL, NULL),
(91, 'KAR0084', 'Rini Susanti', 'rinisusanti99', 'rini.susanti@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 10, NULL, NULL),
(92, 'KAR0085', 'Budi Kusuma', 'budikusuma12', 'budi.kusuma@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 10, NULL, NULL),
(93, 'KAR0086', 'Ratna Wibowo', 'ratnawibowo33', 'ratna.wibowo@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 10, NULL, NULL),
(94, 'KAR0087', 'Siti Hidayat', 'sitihidayat7', 'siti.hidayat@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 10, NULL, NULL),
(95, 'KAR0088', 'Wawan Pratiwi', 'wawanpratiwi45', 'wawan.pratiwi@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 10, NULL, NULL),
(96, 'KAR0089', 'Dina Saputra', 'dinasaputra12', 'dina.saputra@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 10, NULL, NULL),
(97, 'KAR0090', 'Nia Susanti', 'niasusanti76', 'nia.susanti@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 10, NULL, NULL),
(98, 'KAR0091', 'Maya Kusuma', 'mayakusuma55', 'maya.kusuma@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 11, NULL, NULL),
(99, 'KAR0092', 'Eka Wibowo', 'ekawibowo23', 'eka.wibowo@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 11, NULL, NULL),
(100, 'KAR0093', 'Doni Hidayat', 'donihidayat99', 'doni.hidayat@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 11, NULL, NULL),
(101, 'KAR0094', 'Ari Saputra', 'arisaputra1', 'ari.saputra@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 11, NULL, NULL),
(102, 'KAR0095', 'Sari Pratiwi', 'saripratiwi7', 'sari.pratiwi@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 11, NULL, NULL),
(103, 'KAR0096', 'Rini Susanti', 'rinisusanti44', 'rini.susanti@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 11, NULL, NULL),
(104, 'KAR0097', 'Budi Kusuma', 'budikusuma23', 'budi.kusuma@gmail.com', 'dac155643bddcf28e7e70264227a10dc', 'user.jpg', 2, 11, NULL, NULL),
(105, 'KAR0098', 'Ratna Wibowo', 'ratnawibowo12', 'ratna.wibowo@yahoo.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 11, NULL, NULL),
(106, 'KAR0099', 'Siti Hidayat', 'sitihidayat1', 'siti.hidayat@gmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 3, NULL, NULL),
(107, 'KAR0100', 'Dimas Anggar', 'dimasanggara2', 'dimas.anggara@hotmail.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 2, 3, NULL, NULL),
(108, 'TEK00004', 'Budi Santoso', 'budisantoso123', 'budisantoso123@example.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 3, 3, 2, NULL),
(109, 'TEK00005', ' Ida Purnama', 'idapurnama456', 'idapurnama456@example.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 3, 3, 1, NULL),
(110, 'TEK00006', 'Joko Susilo', 'jokosusilo789', 'jokosusilo789@example.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 3, 3, 1, NULL),
(111, 'TEK00007', 'Siti Rahayu', 'sitirahayu555', 'sitirahayu555@example.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 3, 3, 4, NULL),
(112, 'TEK00008', 'Agus Prasetyo', 'agusprasetyo007', 'agusprasetyo007@example.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 3, 3, 4, NULL),
(113, 'TEK00009', 'Dewi Puspita', 'dewipuspita789', 'dewipuspita789@example.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 3, 3, 5, NULL),
(114, 'TEK00010', 'Rudi Setiawan', 'rudisetiawan456', 'rudisetiawan456@example.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 3, 3, 5, NULL),
(115, 'TEK00011', 'Nita Wulandari', 'nitawulandari567', 'nitawulandari567@example.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 3, 3, 6, NULL),
(116, 'TEK00012', 'Bambang Wijaya', 'bambangwijaya123', 'bambangwijaya123@example.com', '202cb962ac59075b964b07152d234b70', 'user.jpg', 3, 3, 6, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`departemen_id`);

--
-- Indexes for table `historymessage`
--
ALTER TABLE `historymessage`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `relasi_history_kategori` (`kategori_id`),
  ADD KEY `relasi_history_receiver` (`receiver_id`),
  ADD KEY `relasi_history_sesi` (`sesi_pesan`),
  ADD KEY `relasi_history_status` (`status`),
  ADD KEY `relasi_history_sender` (`sender_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relasi_sender_user` (`sender_id`),
  ADD KEY `relasi_chat_kategori` (`kategori_id`),
  ADD KEY `relasi_receiver_user` (`receiver_id`),
  ADD KEY `sesi_pesan` (`sesi_pesan`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relasi_notif_user` (`user_id`),
  ADD KEY `relasi_notif_role` (`role_id`),
  ADD KEY `relasi_notif_depart` (`department_id`),
  ADD KEY `relasi_notif_kategori` (`kategori_id`),
  ADD KEY `relasi_notif_req` (`request_id`),
  ADD KEY `relasi_notif_sesi` (`sesi_pesan`),
  ADD KEY `relasi_notif_receiver` (`teknisi_id`);

--
-- Indexes for table `perangkat`
--
ALTER TABLE `perangkat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `status_perangkat` (`status_perangkat`),
  ADD KEY `relasi_perangkat_kategori` (`kategori_id`),
  ADD KEY `relasi_perangkat_departemen` (`departemen_id`);

--
-- Indexes for table `problemcategories`
--
ALTER TABLE `problemcategories`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `supportticket`
--
ALTER TABLE `supportticket`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `request_id` (`request_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `kategori_id` (`kategori_id`),
  ADD KEY `supporttickets_ibfk_3` (`perangkat_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `supportticket_ibfk_5` (`role_id`),
  ADD KEY `status` (`status`),
  ADD KEY `penanggung_jawab_perbaikan` (`penanggung_jawab_perbaikan`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `karyawan_id` (`karyawan_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `departemen_id` (`departemen_id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `historymessage`
--
ALTER TABLE `historymessage`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=279;

--
-- AUTO_INCREMENT for table `perangkat`
--
ALTER TABLE `perangkat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `supportticket`
--
ALTER TABLE `supportticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `historymessage`
--
ALTER TABLE `historymessage`
  ADD CONSTRAINT `relasi_history_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `problemcategories` (`kategori_id`),
  ADD CONSTRAINT `relasi_history_receiver` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `relasi_history_sender` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `relasi_history_sesi` FOREIGN KEY (`sesi_pesan`) REFERENCES `messages` (`sesi_pesan`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `relasi_chat_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `problemcategories` (`kategori_id`),
  ADD CONSTRAINT `relasi_receiver_user` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `relasi_sender_user` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `relasi_notif_depart` FOREIGN KEY (`department_id`) REFERENCES `departments` (`departemen_id`),
  ADD CONSTRAINT `relasi_notif_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `problemcategories` (`kategori_id`),
  ADD CONSTRAINT `relasi_notif_receiver` FOREIGN KEY (`teknisi_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `relasi_notif_req` FOREIGN KEY (`request_id`) REFERENCES `supportticket` (`request_id`),
  ADD CONSTRAINT `relasi_notif_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  ADD CONSTRAINT `relasi_notif_sesi` FOREIGN KEY (`sesi_pesan`) REFERENCES `messages` (`sesi_pesan`),
  ADD CONSTRAINT `relasi_notif_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `perangkat`
--
ALTER TABLE `perangkat`
  ADD CONSTRAINT `relasi_perangkat_departemen` FOREIGN KEY (`departemen_id`) REFERENCES `departments` (`departemen_id`),
  ADD CONSTRAINT `relasi_perangkat_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `problemcategories` (`kategori_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relasi_perangkat_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `supportticket`
--
ALTER TABLE `supportticket`
  ADD CONSTRAINT `penanggung_jawab_perbaikan` FOREIGN KEY (`penanggung_jawab_perbaikan`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `relasi_req_depart` FOREIGN KEY (`department_id`) REFERENCES `departments` (`departemen_id`),
  ADD CONSTRAINT `relasi_req_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `problemcategories` (`kategori_id`),
  ADD CONSTRAINT `relasi_req_perangkat` FOREIGN KEY (`perangkat_id`) REFERENCES `perangkat` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `relasi_req_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  ADD CONSTRAINT `relasi_req_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `relasi_user_depart` FOREIGN KEY (`departemen_id`) REFERENCES `departments` (`departemen_id`),
  ADD CONSTRAINT `relasi_user_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `problemcategories` (`kategori_id`),
  ADD CONSTRAINT `relasi_user_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
