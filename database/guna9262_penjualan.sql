-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 27, 2021 at 01:00 AM
-- Server version: 10.3.27-MariaDB-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `guna9262_penjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang_laris`
--

CREATE TABLE `barang_laris` (
  `kode_barang` varchar(30) DEFAULT NULL,
  `nama_barang` varchar(50) DEFAULT NULL,
  `jumlah` bigint(21) DEFAULT NULL,
  `satuan` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(50) NOT NULL,
  `posisi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `nama_menu`, `posisi`) VALUES
(4, 'Barang', 2),
(5, 'Master', 1),
(6, 'Transaksi', 3),
(7, 'Laporan', 5),
(8, 'Retur Barang', 4);

-- --------------------------------------------------------

--
-- Table structure for table `modul`
--

CREATE TABLE `modul` (
  `id_modul` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `nama_modul` varchar(150) NOT NULL,
  `link_menu` text NOT NULL,
  `posisi` int(11) NOT NULL,
  `icon_menu` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modul`
--

INSERT INTO `modul` (`id_modul`, `id_menu`, `nama_modul`, `link_menu`, `posisi`, `icon_menu`) VALUES
(1, 4, 'Kategori Barang', 'med.php?mod=kategori', 1, 'fa fa-folder-open'),
(2, 4, 'Data Barang', 'med.php?mod=barang', 2, 'fa fa-cubes'),
(3, 5, 'Data Pelanggan', 'med.php?mod=pelanggan', 1, 'fa fa-group'),
(4, 5, 'Data Supplier', 'med.php?mod=supplier', 2, 'fa fa-user'),
(5, 6, 'Transaksi Penjualan', 'med.php?mod=penjualan', 1, 'fa fa-shopping-cart'),
(6, 6, 'Data Transaksi Penjualan', 'med.php?mod=penjualan&act=list', 2, 'fa fa-book'),
(7, 6, 'Data Transaksi Pembelian', 'med.php?mod=pembelian', 3, 'fa fa-truck'),
(8, 6, 'Data Transaksi Pengeluaran', 'med.php?mod=pengeluaran', 4, 'fa fa-money'),
(9, 6, 'Transaksi Servis', 'med.php?mod=servis', 5, 'fa fa-gear'),
(10, 6, 'Data Transaksi Servis', 'med.php?mod=servis&act=list', 6, 'fa fa-book'),
(15, 8, 'Retur Penjualan', 'med.php?mod=returpenjualan', 1, 'fa fa-cart-arrow-down'),
(16, 8, 'Retur Pembelian', 'med.php?mod=returpembelian', 2, 'fa fa-cart-arrow-down'),
(17, 7, 'Laporan Stok Barang', 'med.php?mod=laporan&act=stokbarang', 1, 'fa fa-line-chart'),
(18, 7, 'Laporan Barang Terlaris', 'med.php?mod=laplaris', 2, 'fa fa-pie-chart'),
(19, 7, 'Laporan Transaksi Pembelian', 'med.php?mod=lappemblian', 3, 'fa fa-print'),
(20, 7, 'Laporan Transaksi Penjualan', 'med.php?mod=lappenjualan', 4, 'fa fa-print'),
(21, 7, 'Laporan Transaksi Servis', 'med.php?mod=lapservis', 4, 'fa fa-print'),
(22, 7, 'Laporan Transaksi Pengeluaran', 'med.php?mod=lapengeluaran', 4, 'fa fa-print');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `kode_barang` varchar(30) NOT NULL,
  `nama_barang` varchar(200) NOT NULL,
  `deskripsi` text NOT NULL,
  `tgl_input` date NOT NULL,
  `harga_beli` double(10,2) NOT NULL,
  `harga_jual` double(10,2) NOT NULL,
  `kategori_id` char(5) NOT NULL,
  `jml_stok` int(11) NOT NULL,
  `satuan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`kode_barang`, `nama_barang`, `deskripsi`, `tgl_input`, `harga_beli`, `harga_jual`, `kategori_id`, `jml_stok`, `satuan`) VALUES
('AD00006', 'ADAPTOR ASUS ORI', '-', '2016-07-28', 130000.00, 360000.00, 'C002', 9, 'UNIT'),
('AD00007', 'ADAPTOR ASUS ORI PETAK', '-', '2016-07-28', 185000.00, 40000.00, 'C002', 10, 'UNIT'),
('AD00008', 'ADAPTOR ASUS ORI EPC19V-1.75A', '-', '2016-07-28', 148000.00, 350000.00, 'C002', 10, 'UNIT'),
('AD00009', 'ADAPTOR HP JARUM KW', '-', '2016-07-28', 57000.00, 150000.00, 'C002', 10, 'UNIT'),
('AD00010', 'ADAPTOR HP MINI ORI', '-', '2016-07-28', 135000.00, 375000.00, 'C002', 10, 'UNIT'),
('AD00011', 'ADAPTOR HP JARUM ORI', '-', '2016-07-28', 145000.00, 390000.00, 'C002', 10, 'UNIT'),
('AD00012', 'Mouse M-Tech', '', '2020-09-14', 10000.00, 0.00, 'C001', 10, 'UNIT'),
('AD00013', 'TP-Link wifi USB', '', '2020-09-14', 150000.00, 0.00, 'C001', 10, 'UNIT'),
('AD00014', 'Keyboard Logitech', '', '2020-09-14', 140000.00, 0.00, 'C001', 5, 'UNIT'),
('AD00015', 'DLINK DIR-806A , AC750 Wireless Router Dual-Band WIFI D-LINK', '', '2020-10-20', 440000.00, 440000.00, 'C003', 93, 'BUAH'),
('AD00016', 'TP-Link MC220L SFP Slot Gigabit to Ethernet Media Converter', '', '2020-10-20', 332000.00, 332000.00, 'C003', 88, 'BUAH'),
('AD00018', 'Mikrotik Cloud Core Router CCR1016-12S-1S+\r\n', '', '2020-10-20', 13000000.00, 13000000.00, 'C003', 100, 'BUAH'),
('AD00019', 'D-Link DES-1016D 16 Port 10/100mbps Unmanaged Switch', '', '2020-10-20', 590000.00, 590000.00, 'C003', 97, 'BUAH'),
('AD00020', 'DGS-1100-18 Switch DLINK 16 Port Gigabit + 2 SFP Smart Managed ', '', '2020-10-20', 2733000.00, 2733000.00, 'C003', 95, 'BUAH'),
('AD00021', 'Fiber optic DW 1Core\r\n', '', '2020-10-20', 2117000.00, 2117000.00, 'C003', 99, 'BUAH'),
('AD00022', 'Kabel Lan UTP Cat5e\r\n', '', '2020-10-20', 1728000.00, 1728000.00, 'C003', 99, 'BUAH'),
('AD00023', 'RJ45\r\n', '', '2020-10-20', 150000.00, 150000.00, 'C003', 98, 'BUAH'),
('AD00024', 'RJ 45 Belden', '', '2020-10-20', 180000.00, 180000.00, 'C003', 100, 'BUAH'),
('AD00025', 'Fast Connector LC UPC Fiber Optic\r\n', '', '2020-10-20', 54000.00, 54000.00, 'C003', 80, 'BUAH'),
('AD00026', 'Mikrotik SFP S-3553LC20D 1 pair Transceiver gigabit singlemode 20km', '', '2020-10-20', 1313000.00, 1313000.00, 'C003', 94, 'BUAH');

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_pembelian`
--

CREATE TABLE `tb_detail_pembelian` (
  `no_faktur` varchar(30) NOT NULL,
  `kode_barang` varchar(30) NOT NULL,
  `harga_beli` double(10,2) NOT NULL,
  `qty` int(4) NOT NULL,
  `petugas` int(11) NOT NULL,
  `timestmp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_detail_pembelian`
--

INSERT INTO `tb_detail_pembelian` (`no_faktur`, `kode_barang`, `harga_beli`, `qty`, `petugas`, `timestmp`) VALUES
('BEL24042000001', 'AD00003', 111.00, 1, 1, '2020-04-24 12:54:54');

--
-- Triggers `tb_detail_pembelian`
--
DELIMITER $$
CREATE TRIGGER `after_insert_tmp_beli` AFTER INSERT ON `tb_detail_pembelian` FOR EACH ROW BEGIN
	DELETE FROM tb_detail_pembelian_tmp 
	WHERE kode_barang = NEW.kode_barang 
	AND petugas = NEW.petugas;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_pembelian_tmp`
--

CREATE TABLE `tb_detail_pembelian_tmp` (
  `kode_barang` varchar(30) NOT NULL,
  `harga_beli` double(10,2) NOT NULL,
  `qty` int(4) NOT NULL,
  `petugas` int(11) NOT NULL,
  `timestmp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_pengeluaran`
--

CREATE TABLE `tb_detail_pengeluaran` (
  `no_faktur` varchar(30) NOT NULL,
  `nama_barang` varchar(200) NOT NULL,
  `harga_beli` double(10,2) NOT NULL,
  `qty` int(4) NOT NULL,
  `petugas` int(11) NOT NULL,
  `timestmp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_detail_pengeluaran`
--

INSERT INTO `tb_detail_pengeluaran` (`no_faktur`, `nama_barang`, `harga_beli`, `qty`, `petugas`, `timestmp`) VALUES
('OUT19042000001', 'BELBAYGON', 100000.00, 10, 1, '2020-04-19 22:29:25'),
('OUT19042000001', 'BELI SAYUR', 10000.00, 2, 1, '2020-04-19 22:29:25'),
('OUT19042000002', 'BELBAYGON', 100000.00, 10, 1, '2020-04-19 22:32:03'),
('OUT19042000002', 'BELI SAYUR', 10000.00, 2, 1, '2020-04-19 22:32:03'),
('OUT19042000003', 'tahu tempe', 10000.00, 1, 1, '2020-04-19 22:33:06'),
('OUT24042000001', 'a', 111.00, 1, 1, '2020-04-24 12:56:18'),
('OUT27012100001', '555', 222.00, 1, 1, '2021-01-27 00:27:02');

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_pengeluaran_tmp`
--

CREATE TABLE `tb_detail_pengeluaran_tmp` (
  `nama_barang` varchar(200) NOT NULL,
  `harga_beli` double(10,2) NOT NULL,
  `qty` int(4) NOT NULL,
  `petugas` int(11) NOT NULL,
  `timestmp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_penjualan`
--

CREATE TABLE `tb_detail_penjualan` (
  `no_transaksi` varchar(30) NOT NULL,
  `kode_barang` varchar(30) NOT NULL,
  `qty` int(4) NOT NULL,
  `harga` double(10,2) NOT NULL,
  `disc` double(5,2) NOT NULL,
  `petugas` int(11) NOT NULL,
  `timestmp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_detail_penjualan`
--

INSERT INTO `tb_detail_penjualan` (`no_transaksi`, `kode_barang`, `qty`, `harga`, `disc`, `petugas`, `timestmp`) VALUES
('CA11042000001', 'AD00001', 1, 150000.00, 0.00, 1, '2020-04-11 21:55:30'),
('CA11042000002', 'AD00001', 1, 150000.00, 0.00, 1, '2020-04-11 22:20:51'),
('CA11042000002', 'AD00003', 1, 150000.00, 0.00, 1, '2020-04-11 22:21:25'),
('CA19042000001', 'AD00001', 1, 150000.00, 0.00, 1, '2020-04-19 22:41:39'),
('CA19102000001', 'AD00001', 1, 150000.00, 0.00, 1, '2020-10-19 15:38:20'),
('CA20102000001', 'AD00015', 7, 440000.00, 0.00, 1, '2020-10-20 23:01:05'),
('CA20102000001', 'AD00016', 12, 332000.00, 0.00, 1, '2020-10-20 23:01:20'),
('CA20102000001', 'AD00019', 3, 590000.00, 0.00, 1, '2020-10-20 23:03:19'),
('CA20102000001', 'AD00020', 5, 2733000.00, 0.00, 1, '2020-10-20 23:03:41'),
('CA20102000001', 'AD00021', 1, 2117000.00, 0.00, 1, '2020-10-20 23:08:00'),
('CA20102000001', 'AD00022', 1, 1728000.00, 0.00, 1, '2020-10-20 23:08:02'),
('CA20102000001', 'AD00023', 2, 150000.00, 0.00, 1, '2020-10-20 23:08:10'),
('CA20102000001', 'AD00025', 20, 54000.00, 0.00, 1, '2020-10-20 23:08:15'),
('CA20102000001', 'AD00026', 6, 1313000.00, 0.00, 1, '2020-10-20 23:02:56'),
('CA27012100001', 'AD00006', 1, 360000.00, 0.00, 1, '2021-01-27 00:35:01');

--
-- Triggers `tb_detail_penjualan`
--
DELIMITER $$
CREATE TRIGGER `after_insert_delete_tmp` AFTER INSERT ON `tb_detail_penjualan` FOR EACH ROW BEGIN
	DELETE FROM tb_detail_penjualan_tmp 
	WHERE kode_barang = NEW.kode_barang 
	AND petugas = NEW.petugas;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_penjualan_tmp`
--

CREATE TABLE `tb_detail_penjualan_tmp` (
  `kode_barang` varchar(50) NOT NULL,
  `harga` double(10,2) NOT NULL,
  `disc` double(10,2) NOT NULL,
  `qty` int(4) NOT NULL,
  `petugas` int(11) NOT NULL,
  `timestmp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_servis`
--

CREATE TABLE `tb_detail_servis` (
  `no_transaksi` varchar(30) NOT NULL,
  `kode_servis` int(10) NOT NULL,
  `jenis` varchar(30) NOT NULL,
  `seri` varchar(50) NOT NULL,
  `keluhan` text NOT NULL,
  `kelengkapan` varchar(100) NOT NULL,
  `kerusakan` text NOT NULL,
  `biaya` double(10,2) NOT NULL,
  `garansi` varchar(30) NOT NULL,
  `qty` int(4) NOT NULL,
  `petugas` int(11) NOT NULL,
  `timestmp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_detail_servis_tmp`
--

CREATE TABLE `tb_detail_servis_tmp` (
  `kode_servis` int(10) NOT NULL,
  `jenis` varchar(30) NOT NULL,
  `seri` varchar(50) NOT NULL,
  `keluhan` text NOT NULL,
  `kelengkapan` varchar(100) NOT NULL,
  `kerusakan` text NOT NULL,
  `biaya` double(10,2) NOT NULL,
  `garansi` varchar(30) NOT NULL,
  `qty` int(4) NOT NULL,
  `petugas` int(11) NOT NULL,
  `timestmp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kategori_barang`
--

CREATE TABLE `tb_kategori_barang` (
  `kategori_id` char(5) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_kategori_barang`
--

INSERT INTO `tb_kategori_barang` (`kategori_id`, `nama_kategori`) VALUES
('C001', 'LAPTOP'),
('C002', 'ADAPTOR'),
('C003', 'JARINGAN');

-- --------------------------------------------------------

--
-- Table structure for table `tb_log`
--

CREATE TABLE `tb_log` (
  `id_log` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `timestmp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_log`
--

INSERT INTO `tb_log` (`id_log`, `deskripsi`, `timestmp`) VALUES
(26, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA03081600001', '2016-08-03 21:07:25'),
(27, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA03081600002', '2016-08-03 21:13:24'),
(28, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA04081600001', '2016-08-04 13:33:06'),
(29, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA04081600001', '2016-08-04 13:34:36'),
(30, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA15041900001', '2019-04-15 23:20:30'),
(31, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA15041900001', '2019-04-16 00:10:05'),
(32, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA03081600002', '2019-04-16 00:10:07'),
(33, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA03081600001', '2019-04-16 00:10:08'),
(34, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA16041900001', '2019-04-16 13:24:34'),
(35, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA16041900002', '2019-04-16 13:25:53'),
(36, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA09042000001', '2020-04-09 21:28:59'),
(37, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA11042000001', '2020-04-11 21:15:29'),
(38, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA11042000001', '2020-04-11 21:41:30'),
(39, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA09042000001', '2020-04-11 21:41:32'),
(40, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA16041900002', '2020-04-11 21:41:33'),
(41, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA16041900001', '2020-04-11 21:41:34'),
(42, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA16041900001', '2020-04-11 21:43:30'),
(43, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA16041900002', '2020-04-11 21:43:30'),
(44, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA16041900003', '2020-04-11 21:43:30'),
(45, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA17041900001', '2020-04-11 21:43:30'),
(46, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA17041900002', '2020-04-11 21:43:30'),
(47, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA17041900003', '2020-04-11 21:43:30'),
(48, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA17041900004', '2020-04-11 21:43:30'),
(49, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA17041900005', '2020-04-11 21:43:30'),
(50, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA17041900006', '2020-04-11 21:43:30'),
(51, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA17041900007', '2020-04-11 21:43:30'),
(52, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA17041900008', '2020-04-11 21:43:30'),
(53, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA17041900009', '2020-04-11 21:43:30'),
(54, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA17041900009', '2020-04-11 21:43:54'),
(55, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA17041900008', '2020-04-11 21:43:55'),
(56, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA17041900007', '2020-04-11 21:43:56'),
(57, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA17041900006', '2020-04-11 21:43:57'),
(58, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA17041900005', '2020-04-11 21:43:58'),
(59, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA17041900004', '2020-04-11 21:43:59'),
(60, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA17041900003', '2020-04-11 21:44:00'),
(61, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA17041900002', '2020-04-11 21:44:00'),
(62, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA17041900001', '2020-04-11 21:44:01'),
(63, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA16041900003', '2020-04-11 21:44:02'),
(64, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA16041900002', '2020-04-11 21:44:02'),
(67, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA16041900001', '2020-04-11 21:45:33'),
(71, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA11042000001', '2020-04-11 21:53:42'),
(72, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA11042000001', '2020-04-11 21:54:56'),
(73, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA17041900009', '2020-04-11 21:54:58'),
(74, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA17041900008', '2020-04-11 21:54:59'),
(75, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA17041900007', '2020-04-11 21:55:00'),
(76, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA17041900006', '2020-04-11 21:55:01'),
(77, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA17041900005', '2020-04-11 21:55:02'),
(78, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA17041900004', '2020-04-11 21:55:02'),
(79, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA17041900003', '2020-04-11 21:55:03'),
(80, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA17041900002', '2020-04-11 21:55:04'),
(81, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA17041900001', '2020-04-11 21:55:05'),
(82, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA16041900003', '2020-04-11 21:55:06'),
(83, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA16041900002', '2020-04-11 21:55:07'),
(84, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA16041900001', '2020-04-11 21:55:08'),
(85, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA11042000001', '2020-04-11 21:55:39'),
(86, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA11042000002', '2020-04-11 22:23:20'),
(87, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA11042000002', '2020-04-19 22:40:24'),
(88, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA11042000001', '2020-04-19 22:40:27'),
(89, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA19042000001', '2020-04-19 22:41:54'),
(90, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA19042000001', '2020-04-24 12:53:38'),
(91, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA19102000001', '2020-10-19 15:38:52'),
(92, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA20102000001', '2020-10-20 23:09:15'),
(93, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA20102000001', '2021-01-27 00:26:31'),
(94, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA19102000001', '2021-01-27 00:26:33'),
(95, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA27012100001', '2021-01-27 00:35:13');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `kode_pelanggan` varchar(20) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `nomor_telp` varchar(50) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`kode_pelanggan`, `nama_pelanggan`, `nomor_telp`, `alamat`) VALUES
('P00001', 'UNIVERSITAS PALANGKA RAYA', '08', 'JALAN YOS SUDARSO');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembelian`
--

CREATE TABLE `tb_pembelian` (
  `no_faktur` varchar(30) NOT NULL,
  `kode_supplier` varchar(10) NOT NULL,
  `nama_toko` varchar(50) NOT NULL,
  `tgl_beli` date NOT NULL,
  `nama_kasir` varchar(50) NOT NULL,
  `petugas` int(11) NOT NULL,
  `timestmp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengeluaran`
--

CREATE TABLE `tb_pengeluaran` (
  `no_faktur` varchar(30) NOT NULL,
  `nama_toko` varchar(50) NOT NULL,
  `tgl_beli` date NOT NULL,
  `nama_kasir` varchar(50) NOT NULL,
  `petugas` int(11) NOT NULL,
  `timestmp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_penjualan`
--

CREATE TABLE `tb_penjualan` (
  `no_transaksi` varchar(30) NOT NULL,
  `kode_pelanggan` varchar(20) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `petugas` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `bayar` double(10,2) NOT NULL,
  `potongan` double(10,2) NOT NULL,
  `timestmp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_penjualan`
--

INSERT INTO `tb_penjualan` (`no_transaksi`, `kode_pelanggan`, `nama_pelanggan`, `tgl_transaksi`, `petugas`, `status`, `bayar`, `potongan`, `timestmp`) VALUES
('CA27012100001', 'P00001', 'UNIVERSITAS PALANGKA RAYA', '2021-01-27', 1, 'LUNAS', 400000.00, 0.00, '2021-01-27 00:35:13');

--
-- Triggers `tb_penjualan`
--
DELIMITER $$
CREATE TRIGGER `after_delete_penjualan` AFTER DELETE ON `tb_penjualan` FOR EACH ROW BEGIN
	INSERT INTO tb_log(deskripsi, timestmp) 
	VALUES(CONCAT("<span class='w3-text-red'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :", OLD.no_transaksi), NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_insert_penjualan` AFTER INSERT ON `tb_penjualan` FOR EACH ROW BEGIN
	INSERT INTO tb_log(deskripsi, timestmp) 
	VALUES(CONCAT("<span class='w3-text-green'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>", NEW.no_transaksi), NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_retur_pembelian`
--

CREATE TABLE `tb_retur_pembelian` (
  `no_faktur` varchar(30) NOT NULL,
  `kode_barang` varchar(30) NOT NULL,
  `harga_beli` double(10,2) NOT NULL,
  `qty` int(4) NOT NULL,
  `petugas` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `timestmp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_retur_penjualan`
--

CREATE TABLE `tb_retur_penjualan` (
  `no_transaksi` varchar(30) NOT NULL,
  `kode_barang` varchar(30) NOT NULL,
  `qty` int(4) NOT NULL,
  `harga` double(10,2) NOT NULL,
  `disc` double(5,2) NOT NULL,
  `petugas` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `timestmp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_satuan_barang`
--

CREATE TABLE `tb_satuan_barang` (
  `id_satuan` int(11) NOT NULL,
  `nama_satuan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_satuan_barang`
--

INSERT INTO `tb_satuan_barang` (`id_satuan`, `nama_satuan`) VALUES
(18, 'PCS'),
(19, 'UNIT');

-- --------------------------------------------------------

--
-- Table structure for table `tb_servis`
--

CREATE TABLE `tb_servis` (
  `no_transaksi` varchar(30) NOT NULL,
  `kode_pelanggan` varchar(10) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `tgl_servis_masuk` date NOT NULL,
  `tgl_servis_keluar` date DEFAULT NULL,
  `petugas` int(11) NOT NULL,
  `status` text DEFAULT NULL,
  `bayar` double(10,2) DEFAULT NULL,
  `potongan` double(10,2) DEFAULT NULL,
  `timestmp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_supplier`
--

CREATE TABLE `tb_supplier` (
  `kode_supplier` varchar(10) NOT NULL,
  `nama_toko` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_lengkap` varchar(45) NOT NULL,
  `usernm` varchar(20) NOT NULL,
  `passwd` varchar(50) NOT NULL,
  `level` varchar(20) NOT NULL,
  `last_login` datetime NOT NULL,
  `akses_master` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_lengkap`, `usernm`, `passwd`, `level`, `last_login`, `akses_master`) VALUES
(1, 'ADMINISTRATOR', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', '2021-01-26 23:47:51', ''),
(2, 'CACA', 'caca', 'd2104a400c7f629a197f33bb33fe80c0', 'user', '2019-04-16 00:11:06', 'pelanggan, supplier');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `modul`
--
ALTER TABLE `modul`
  ADD PRIMARY KEY (`id_modul`);

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`kode_barang`),
  ADD KEY `FK_tb_produk_tb_kategori_produk` (`kategori_id`);

--
-- Indexes for table `tb_detail_pembelian`
--
ALTER TABLE `tb_detail_pembelian`
  ADD PRIMARY KEY (`no_faktur`,`kode_barang`),
  ADD KEY `FK_tb_detailbeli_tb_produk` (`kode_barang`);

--
-- Indexes for table `tb_detail_pembelian_tmp`
--
ALTER TABLE `tb_detail_pembelian_tmp`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `tb_detail_pengeluaran`
--
ALTER TABLE `tb_detail_pengeluaran`
  ADD PRIMARY KEY (`no_faktur`,`nama_barang`),
  ADD KEY `FK_tb_detailbeli_tb_produk` (`nama_barang`);

--
-- Indexes for table `tb_detail_pengeluaran_tmp`
--
ALTER TABLE `tb_detail_pengeluaran_tmp`
  ADD PRIMARY KEY (`nama_barang`);

--
-- Indexes for table `tb_detail_penjualan`
--
ALTER TABLE `tb_detail_penjualan`
  ADD PRIMARY KEY (`no_transaksi`,`kode_barang`),
  ADD KEY `FK_tb_detailproduk_tb_produk` (`kode_barang`);

--
-- Indexes for table `tb_detail_penjualan_tmp`
--
ALTER TABLE `tb_detail_penjualan_tmp`
  ADD PRIMARY KEY (`petugas`,`kode_barang`);

--
-- Indexes for table `tb_detail_servis`
--
ALTER TABLE `tb_detail_servis`
  ADD PRIMARY KEY (`no_transaksi`,`kode_servis`),
  ADD KEY `FK_tb_detailbeli_tb_produk` (`jenis`);

--
-- Indexes for table `tb_detail_servis_tmp`
--
ALTER TABLE `tb_detail_servis_tmp`
  ADD PRIMARY KEY (`kode_servis`,`petugas`),
  ADD KEY `FK_tb_detailbeli_tb_produk` (`jenis`);

--
-- Indexes for table `tb_kategori_barang`
--
ALTER TABLE `tb_kategori_barang`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `tb_log`
--
ALTER TABLE `tb_log`
  ADD PRIMARY KEY (`id_log`);

--
-- Indexes for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`kode_pelanggan`);

--
-- Indexes for table `tb_pembelian`
--
ALTER TABLE `tb_pembelian`
  ADD PRIMARY KEY (`no_faktur`);

--
-- Indexes for table `tb_pengeluaran`
--
ALTER TABLE `tb_pengeluaran`
  ADD PRIMARY KEY (`no_faktur`);

--
-- Indexes for table `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD PRIMARY KEY (`no_transaksi`);

--
-- Indexes for table `tb_retur_pembelian`
--
ALTER TABLE `tb_retur_pembelian`
  ADD PRIMARY KEY (`no_faktur`,`kode_barang`),
  ADD KEY `FK_tb_detailbeli_tb_produk` (`kode_barang`);

--
-- Indexes for table `tb_retur_penjualan`
--
ALTER TABLE `tb_retur_penjualan`
  ADD PRIMARY KEY (`kode_barang`,`no_transaksi`);

--
-- Indexes for table `tb_satuan_barang`
--
ALTER TABLE `tb_satuan_barang`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indexes for table `tb_servis`
--
ALTER TABLE `tb_servis`
  ADD PRIMARY KEY (`no_transaksi`);

--
-- Indexes for table `tb_supplier`
--
ALTER TABLE `tb_supplier`
  ADD PRIMARY KEY (`kode_supplier`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `modul`
--
ALTER TABLE `modul`
  MODIFY `id_modul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tb_detail_servis_tmp`
--
ALTER TABLE `tb_detail_servis_tmp`
  MODIFY `kode_servis` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_log`
--
ALTER TABLE `tb_log`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `tb_satuan_barang`
--
ALTER TABLE `tb_satuan_barang`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
