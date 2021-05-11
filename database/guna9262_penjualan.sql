-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 11, 2021 at 11:16 AM
-- Server version: 10.3.28-MariaDB-cll-lve
-- PHP Version: 7.3.27

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
('B00001', 'Catride Canon 810 Hitam Original', 'Catride Printer Canon Original 810 Hitam', '2021-01-27', 230000.00, 250000.00, 'C001', 10, 'pcs'),
('B00002', 'Catride Canon 811 Warna Original', 'Catride Canon 811 Warna Original', '2021-01-27', 250000.00, 270000.00, 'C001', 10, 'pcs'),
('B00003', 'SSD ADATA 240GB', '-', '2021-02-04', 0.00, 650000.00, 'C001', 1, 'BUAH'),
('B00004', 'CHARGER LAPTOP FOR HP MINI', '', '2021-02-19', 0.00, 250000.00, 'C001', 0, 'BUAH'),
('B00005', 'SPLITTER HDMI', '', '2021-02-20', 0.00, 150000.00, 'C002', 0, 'BUAH'),
('B00006', 'MOUSE NISUTA USB OPTIAL MOUSE', '-', '2021-02-20', 0.00, 20000.00, 'C001', 0, '-'),
('B00007', 'BATERAI CMOS', '', '2021-02-22', 0.00, 5000.00, 'C001', 0, 'BUAH'),
('B00008', 'MOUSE NISUTA USB OPTIAL MOUSE', '', '2021-02-23', 0.00, 20000.00, 'C001', 0, 'BUAH'),
('B00009', 'RAM PATRIOT DDR3 4GB', '-', '2021-03-02', 0.00, 300000.00, 'C001', 0, 'BUAH'),
('B00010', 'TINTA EPSON  MATSUYA BLACK', '-', '2021-03-03', 0.00, 35000.00, 'C001', 0, 'BUAH'),
('B00011', 'CHARGER LAPTOP ACER', '-', '2021-03-03', 0.00, 250000.00, 'C001', 0, 'BUAH'),
('B00012', 'MATSUYA UNIVERSAL', '-', '2021-03-04', 0.00, 35000.00, 'C004', 0, 'BUAH'),
('B00013', 'CADDY DVD ', '-', '2021-03-04', 0.00, 100000.00, 'C001', 0, 'BUAH'),
('B00014', 'FLASHDISK 16 GB', '-', '2021-03-04', 0.00, 90000.00, 'C001', 0, 'BUAH'),
('B00015', 'INFUS PRINTER', '-', '2021-03-04', 0.00, 100000.00, 'C004', 0, 'BUAH'),
('B00016', 'SPEAKER ADVANCE ', '-', '2021-03-04', 0.00, 65000.00, 'C002', 10, 'BUAH'),
('B00017', 'SCREEN CLEANING', '-', '2021-03-04', 0.00, 15000.00, 'C001', 5, 'BUAH'),
('B00018', 'TINTA CANON SUBLIME', '-', '2021-03-04', 0.00, 100000.00, 'C001', 0, 'BUAH'),
('B00019', 'R DRIVER', '-', '2021-03-04', 0.00, 100000.00, 'C002', 1, 'BUAH'),
('B00020', 'US DONGLE', '-', '2021-03-04', 0.00, 50000.00, 'C002', 0, 'BUAH'),
('B00021', 'KABEL HARDISK PC', '-', '2021-03-05', 0.00, 10000.00, 'C002', 0, 'BUAH'),
('B00022', 'SOUND CARD USB', '-', '2021-03-10', 0.00, 50000.00, 'C001', 0, 'BUAH'),
('B00023', 'FLASHDISK 16 GB', '-', '2021-03-16', 0.00, 90000.00, 'C001', 1, 'BUAH'),
('B00024', 'CHARGER LAPTOP ASUS', '-', '2021-03-18', 0.00, 350000.00, 'C001', 1, 'BUAH'),
('B00025', 'CHARGER LAPTOP ASUS', '-', '2021-03-18', 0.00, 300000.00, 'C001', 1, 'BUAH'),
('B00026', 'Keyboard + Mouse LOGITECH USB (MK120)', '-', '2021-03-19', 0.00, 200000.00, 'C001', 0, 'PCS'),
('B00027', 'Keyboard USB Multimedia Mini', '-', '2021-03-19', 0.00, 75000.00, 'C001', 0, 'PCS'),
('B00028', 'Keyboard USB LOGITECH K120', '', '2021-03-19', 0.00, 140000.00, 'C001', 0, 'PCS'),
('B00029', 'Keyboard USB VOTRE', '', '2021-03-19', 0.00, 80000.00, 'C001', 0, 'PCS'),
('B00030', 'Keyboard USB Flexible', '', '2021-03-19', 0.00, 75000.00, 'C001', 0, 'PCS'),
('B00031', 'Mouse USB LOGITECH B100', '', '2021-03-19', 0.00, 80000.00, 'C001', 0, 'PCS'),
('B00032', 'Mouse GAMING REXUS G4', '', '2021-03-19', 0.00, 150000.00, 'C001', 0, 'PCS'),
('B00033', 'Mouse Wireless MTECH', '', '2021-03-19', 0.00, 60000.00, 'C001', 0, 'PCS'),
('B00034', 'Mouse Pad GAMING RAZER Sedang (32x24 cm) Dus', '', '2021-03-19', 0.00, 30000.00, 'C001', 0, 'PCS'),
('B00035', 'Mouse Pad GAMING Gambar Jahit Pinggir', '', '2021-03-19', 0.00, 20000.00, 'C001', 0, 'PCS'),
('B00036', 'Speaker ADVANCE Duo 040', '', '2021-03-20', 0.00, 50000.00, 'C001', 0, 'PCS'),
('B00037', 'Kabel Power Laptop/Notebook Biasa ~ 120cm', '', '2021-03-20', 0.00, 15000.00, 'C002', 0, 'PCS'),
('B00038', 'Kabel Power SATA', '', '2021-03-20', 0.00, 10000.00, 'C002', 0, 'PCS'),
('B00039', 'Kabel Power CPU Listrik (AC) Biasa ~ 115 cm', '', '2021-03-20', 0.00, 15000.00, 'C002', 0, 'PCS'),
('B00040', 'Kabel Power Printer (2 lubang)', '', '2021-03-20', 0.00, 15000.00, 'C002', 0, 'PCS'),
('B00041', 'Kabel VGA 1,5m Standar', '', '2021-03-20', 0.00, 20000.00, 'C002', 0, 'PCS'),
('B00042', 'Kabel HDMI 3m FLAT (Jaring disc Rp. 5000)', '', '2021-03-20', 0.00, 50000.00, 'C002', 0, 'PCS'),
('B00043', 'Cooling Pad Laptop SQ One N-19', '', '2021-03-20', 0.00, 75000.00, 'C002', 0, 'PCS'),
('B00044', 'Keyboard Protector Laptop 11.6&quot; / 14&quot;', '', '2021-03-20', 0.00, 10000.00, 'C001', 0, 'PCS'),
('B00045', 'Keyboard Protector Laptop 10&quot;', '', '2021-03-20', 0.00, 10000.00, 'C001', 0, 'PCS'),
('B00046', 'LCD Protector / Screen Guard 14&quot;', '', '2021-03-20', 0.00, 25000.00, 'C001', 0, 'PCS'),
('B00047', 'Skin Laptop 14&quot; Gambar / Transparan', '', '2021-03-20', 0.00, 40000.00, 'C001', 0, 'PCS'),
('B00048', 'LCD Protector 10&quot; / 11.6&quot;', '', '2021-03-20', 0.00, 25000.00, 'C001', 0, 'PCS'),
('B00049', 'DVD-R GT-Pro Apple (Tanpa Cone)', '', '2021-03-20', 0.00, 4000.00, 'C001', 0, 'PCS'),
('B00050', 'Fan Casing 8cm Transparan Lampu', '', '2021-03-20', 0.00, 25000.00, 'C001', 0, 'PCS'),
('B00051', 'Fan Casing 12cm Armageddon BLADE Blue/Red', '', '2021-03-20', 0.00, 100000.00, 'C001', 0, 'PCS'),
('B00052', 'USB HUB 7 port Digigear USB 3.0 (~2.75)', '', '2021-03-20', 0.00, 130000.00, 'C001', 0, 'PCS'),
('B00053', 'Kabel Data USB Micro Color TOPLES (isi 50)', '', '2021-03-20', 0.00, 15000.00, 'C001', 0, 'PCS'),
('B00054', 'Kabel USB for HDD Eksternal USB 3.0', '', '2021-03-20', 0.00, 25000.00, 'C001', 0, 'PCS'),
('B00055', 'Kabel Printer USB 1.5m NETLINE', '', '2021-03-20', 0.00, 15000.00, 'C001', 0, 'PCS'),
('B00056', 'Kabel Harddisk SATA Jepit / Klip', '', '2021-03-20', 0.00, 10000.00, 'C001', 0, 'PCS'),
('B00057', 'Pad for Mouse Biasa NINGBO', '', '2021-03-20', 0.00, 10000.00, 'C001', 0, 'PCS'),
('B00058', 'Casing ARMAGEDDON Vulcan V1X (w/o psu)', '', '2021-03-20', 0.00, 800000.00, 'C001', 0, 'PCS'),
('B00059', 'Charger Laptop for ASUS (19V - 3.42A)', '', '2021-03-20', 0.00, 250000.00, 'C002', 0, 'PCS'),
('B00060', 'Charger Laptop for HP Mini (19V-1.58A - 1.7mm) ADAPTER', '', '2021-03-20', 0.00, 250000.00, 'C002', 0, 'PCS'),
('B00061', 'Charger Laptop for HP (18.5V-3.5A - 1.7mm)', '', '2021-03-20', 0.00, 250000.00, 'C002', 0, 'PCS'),
('B00062', 'Charger Laptop for HP (18.5V-3.5A - 1.7mm)', '', '2021-03-20', 0.00, 250000.00, 'C002', 0, 'PCS'),
('B00063', 'Charger Laptop for HP Jarum', '', '2021-03-20', 0.00, 250000.00, 'C002', 0, 'PCS'),
('B00064', 'Charger Laptop for ACER Small (19V-3.42A - 1.7mm)', '', '2021-03-20', 0.00, 250000.00, 'C002', 0, 'PCS'),
('B00065', 'Charger Laptop for TOSHIBA (19V- 3.42A - 2.5mm)', '', '2021-03-20', 0.00, 250000.00, 'C002', 0, 'PCS'),
('B00066', 'Charger Laptop Universal 96W', '', '2021-03-20', 0.00, 150000.00, 'C002', 0, 'PCS'),
('B00067', 'Charger Laptop ACER Small ORIGINAL (19V-3.42A)', '', '2021-03-20', 0.00, 250000.00, 'C002', 0, 'PCS'),
('B00068', 'Charger Laptop TOSHIBA ORIGINAL (19V-3.42A - 2.5mm)', '', '2021-03-20', 0.00, 250000.00, 'C002', 0, 'PCS'),
('B00069', 'Charger Laptop ASUS Kotak ORIGINAL (19V-1.75A)', '', '2021-03-20', 0.00, 250000.00, 'C002', 0, 'PCS'),
('B00070', 'Adaptor LCD Monitor 12V - 5A', '', '2021-03-20', 0.00, 200000.00, 'C002', 0, 'PCS'),
('B00071', 'Adaptor LCD Monitor LG 19V - 1.75A', '', '2021-03-20', 0.00, 200000.00, 'C002', 0, 'PCS'),
('B00072', 'Adaptor LCD Monitor LG 19V - 2.1A', '', '2021-03-20', 0.00, 200000.00, 'C002', 0, 'PCS'),
('B00073', 'Casing HDD Ext. 2.5&quot; R-One', '', '2021-03-20', 0.00, 100000.00, 'C001', 0, 'PCS'),
('B00074', 'HDD Ext. 2.5&quot; SATA WD Passport USB 3.0 1 tb', '', '2021-03-20', 0.00, 900000.00, 'C001', 0, 'PCS'),
('B00075', 'GamePad Single Hitam WELCOM', '', '2021-03-20', 0.00, 50000.00, 'C001', 0, 'PCS'),
('B00076', 'Baterai CMOS/Baterai BIOS Lithium 2032', '', '2021-03-20', 0.00, 15000.00, 'C001', 0, 'PCS'),
('B00077', 'LCD Cleaner Kit (Dus Kecil)', '', '2021-03-20', 0.00, 15000.00, 'C001', 0, 'PCS'),
('B00078', 'Converter Speaker / Headphone 2 jact to 1 jack Audio', '', '2021-03-20', 0.00, 25000.00, 'C002', 0, 'PCS'),
('B00079', 'Flashdisk Sandisk 16GB OTG USB 3.0', '', '2021-03-20', 0.00, 120000.00, 'C001', 0, 'PCS'),
('B00080', 'THERMAL PASTE Deep Cool Z5', '', '2021-03-20', 0.00, 53000.00, 'C001', 0, 'PCS'),
('B00081', 'THERMAL PASTE / Pasta Prosesor Suntik Std', '', '2021-03-20', 0.00, 25000.00, 'C001', 0, 'PCS'),
('B00082', 'Headset Gaming Rexus RX 995', '', '2021-03-20', 0.00, 150000.00, 'C001', 0, 'PCS'),
('B00083', 'USB WIFI TP-LINK WN725N', '', '2021-03-20', 0.00, 150000.00, 'C003', 0, 'PCS'),
('B00084', 'Mouse ETEK', '', '2021-03-20', 0.00, 85000.00, 'C001', 0, 'PCS'),
('B00085', 'Mouse LOGITECH M170', '', '2021-03-20', 0.00, 140000.00, 'C001', 0, 'PCS'),
('B00086', 'Mouse ASUS', '', '2021-03-20', 0.00, 50000.00, 'C001', 0, 'PCS'),
('B00087', 'Mouse LENOVO', '', '2021-03-20', 0.00, 50000.00, 'C001', 0, 'PCS'),
('B00088', 'Mouse VOTRE KM610', '', '2021-03-20', 0.00, 25000.00, 'C001', 0, 'PCS'),
('B00089', 'Mouse VOTRE KM609', '', '2021-03-20', 0.00, 25000.00, 'C001', 0, 'PCS'),
('B00090', 'Mouse VOTRE KM309', '', '2021-03-20', 0.00, 25000.00, 'C001', 0, 'PCS'),
('B00091', 'Speaker Genius SP-HF160', '', '2021-03-20', 0.00, 150000.00, 'C001', 0, 'PCS'),
('B00092', 'Headphone SONY MDR-XB450AP', '', '2021-03-20', 0.00, 80000.00, 'C001', 0, 'PCS'),
('B00093', 'AR Protection Film', '', '2021-03-20', 0.00, 0.00, 'C001', 0, 'PCS'),
('B00094', 'CrystalGuardMB', '', '2021-03-20', 0.00, 200000.00, 'C001', 0, 'PCS'),
('B00095', 'Headphone MTECH MEGA A4', '', '2021-03-20', 0.00, 75000.00, 'C001', 0, 'PCS'),
('B00096', 'Headphone MTECH MT-07', '', '2021-03-20', 0.00, 75000.00, 'C001', 0, 'PCS'),
('B00097', 'Headphone LOGITECH h150', '', '2021-03-20', 0.00, 150000.00, 'C001', 0, 'PCS'),
('B00098', 'Earphone ASUS', '', '2021-03-20', 0.00, 100000.00, 'C001', 0, 'PCS'),
('B00099', 'NYK Converter USB-VGA', '', '2021-03-20', 0.00, 150000.00, 'C001', 0, 'PCS'),
('B00100', 'NYK Converter Mini HDMI-VGA', '', '2021-03-20', 0.00, 150000.00, 'C001', 0, 'PCS'),
('B00101', 'NYK Converter HDMI-VGA Audio', '', '2021-03-20', 0.00, 150000.00, 'C001', 0, 'PCS'),
('B00102', 'HDMI WIFI Display Reciever', '', '2021-03-20', 0.00, 150000.00, 'C001', 0, 'PCS'),
('B00103', 'REMAX Cable Quick Charge', '', '2021-03-20', 0.00, 50000.00, 'C001', 0, 'PCS'),
('B00104', 'Micro SD V-GEN 8GB', '', '2021-03-20', 0.00, 55000.00, 'C001', 0, 'PCS'),
('B00105', 'Flashdisk Boneka 8GB', '', '2021-03-20', 0.00, 100000.00, 'C001', 0, 'PCS'),
('B00106', 'Flashdisk Caviar 16GB', '', '2021-03-20', 0.00, 80000.00, 'C001', 0, 'PCS'),
('B00107', 'Cooler Master Mastergel Maker', '', '2021-03-20', 0.00, 200000.00, 'C001', 0, 'PCS'),
('B00108', 'Casing Komputer OPTIMAX', '', '2021-03-20', 0.00, 35000.00, 'C001', 0, 'PCS'),
('B00109', 'Kabel HDMI VENTION', '', '2021-03-20', 0.00, 100000.00, 'C002', 0, 'PCS'),
('B00110', 'Cartridge Canon 811', '', '2021-03-20', 0.00, 270000.00, 'C004', 0, 'PCS'),
('B00111', 'Cartridge Canon 810', '', '2021-03-20', 0.00, 260000.00, 'C004', 0, 'PCS'),
('B00112', 'Cartridge PIXMA 746', '', '2021-03-20', 0.00, 270000.00, 'C004', 0, 'PCS'),
('B00113', 'UME Cable ENJOY USB iPhone', '', '2021-03-20', 0.00, 50000.00, 'C002', 0, 'PCS'),
('B00114', 'Tinta DataPrint DP41 Color Suntik', '', '2021-03-20', 0.00, 35000.00, 'C004', 0, 'PCS'),
('B00115', 'Tinta DataPrint DP40 Black Suntik', '', '2021-03-20', 0.00, 35000.00, 'C004', 0, 'PCS'),
('B00116', 'CORSAIR DDR2 512MB 200-PIN', '', '2021-03-20', 0.00, 100000.00, 'C004', 0, 'PCS'),
('B00117', 'CORSAIR DDR3 2GB 1600MHz LONGDIMM PC', '', '2021-03-20', 0.00, 250000.00, 'C004', 0, 'PCS'),
('B00118', 'KINGSTON 2GB PC2-6400', '', '2021-03-20', 0.00, 350000.00, 'C001', 0, 'PCS'),
('B00119', 'HYNIX 4GB 2Rx8 PC3-12800S', '', '2021-03-20', 0.00, 450000.00, 'C001', 0, 'PCS'),
('B00120', 'VGEN DDR3 2GB PC-10600', '', '2021-03-20', 0.00, 250000.00, 'C001', 0, 'PCS'),
('B00121', 'VGEN DDR3L 2GB PC-12800', '', '2021-03-20', 0.00, 350000.00, 'C001', 0, 'PCS'),
('B00122', 'VGEN DDR3L 4GB PC-12800', '', '2021-03-20', 0.00, 550000.00, 'C001', 0, 'PCS'),
('B00123', 'VGEN DDR4 4GB PC4-2400T', '', '2021-03-20', 0.00, 450000.00, 'C001', 0, 'PCS'),
('B00124', 'VGEN SSD 120GB', '', '2021-03-20', 0.00, 500000.00, 'C001', 0, 'PCS'),
('B00125', 'HGST HDD 500GB 5400RPM', '', '2021-03-20', 0.00, 600000.00, 'C001', 0, 'PCS'),
('B00126', 'Obeng Kecil Multi Fungsi SUNSHINE', '', '2021-03-20', 0.00, 50000.00, 'C001', 0, 'PCS'),
('B00127', 'Obeng Besar Multi HSJ', '', '2021-03-20', 0.00, 25000.00, 'C001', 0, 'PCS'),
('B00128', 'Kabel Converter VGA MacBook', '', '2021-03-20', 0.00, 150000.00, 'C001', 0, 'PCS'),
('B00129', 'Bluetooth USB Adapter ES-388', '', '2021-03-20', 0.00, 25000.00, 'C002', 0, 'PCS'),
('B00130', 'Converter VGA to DVI', '', '2021-03-20', 0.00, 25000.00, 'C002', 0, 'PCS'),
('B00131', 'Laser Pointer M-TECH 2.4G', '', '2021-03-20', 0.00, 150000.00, 'C001', 0, 'PCS'),
('B00132', 'LCD 14&quot;', '', '2021-03-20', 0.00, 900000.00, 'C001', 0, 'PCS'),
('B00133', 'F1 Tinta Kuning Botol Buram', '', '2021-03-20', 0.00, 25000.00, 'C004', 0, 'PCS'),
('B00134', 'F1 Tinta Biru Botol Buram', '', '2021-03-20', 0.00, 25000.00, 'C004', 0, 'PCS'),
('B00135', 'F1 Tinta Merah Botol Buram', '', '2021-03-20', 0.00, 25000.00, 'C004', 0, 'PCS'),
('B00136', 'F1 Tinta Hitam Botol Buram', '', '2021-03-20', 0.00, 25000.00, 'C004', 0, 'PCS'),
('B00137', 'F1 Tinta Kuning Botol Bening', '', '2021-03-20', 0.00, 25000.00, 'C004', 0, 'PCS'),
('B00138', 'F1 Tinta Biru Botol Bening', '', '2021-03-20', 0.00, 25000.00, 'C004', 0, 'PCS'),
('B00139', 'F1 Tinta Merah Botol Bening', '', '2021-03-20', 0.00, 25000.00, 'C004', 0, 'PCS'),
('B00140', 'F1 Tinta Hitam Botol Bening', '', '2021-03-20', 0.00, 25000.00, 'C004', 0, 'PCS'),
('B00141', 'BluePrint Tinta Biru Botol', '', '2021-03-20', 0.00, 35000.00, 'C004', 0, 'PCS'),
('B00142', 'Set Tangki Tinta Infus Luar', '', '2021-03-20', 0.00, 185000.00, 'C004', 0, 'PCS'),
('B00143', 'Botol Suntik OneMed', '', '2021-03-20', 0.00, 10000.00, 'C004', 0, 'PCS'),
('B00144', 'BluePrint Thermal Paper Roll 80*80', '', '2021-03-20', 0.00, 25000.00, 'C001', 0, 'PCS'),
('B00145', 'BluePrint Thermal Paper Roll 57*47', '', '2021-03-20', 0.00, 15000.00, 'C001', 0, 'PCS'),
('B00146', 'PJL Thermal Paper Roll', '', '2021-03-20', 0.00, 15000.00, 'C001', 0, 'PCS'),
('B00147', 'Keyboard Laptop ACER 4755', '', '2021-03-20', 0.00, 350000.00, 'C001', 0, 'PCS'),
('B00148', 'Keyboard Laptop ACER 756', '', '2021-03-20', 0.00, 350000.00, 'C001', 0, 'PCS'),
('B00149', 'Keyboard Laptop TOSHIBA C800', '', '2021-03-20', 0.00, 350000.00, 'C001', 0, 'PCS'),
('B00150', 'Keyboard Laptop ASUS X44 &amp; X43 Series Frame Hitam', '', '2021-03-20', 0.00, 350000.00, 'C001', 0, 'PCS'),
('B00151', 'Keyboard Laptop ASUS X44 &amp; X43 Series Frame', '', '2021-03-20', 0.00, 350000.00, 'C001', 0, 'PCS'),
('B00152', 'Keyboard Laptop ASUS X45 Series', '', '2021-03-20', 0.00, 350000.00, 'C001', 0, 'PCS'),
('B00153', 'Keyboard Laptop AXIOO HNM', '', '2021-03-20', 0.00, 350000.00, 'C001', 0, 'PCS'),
('B00154', 'Barcode Scanner', '', '2021-03-20', 0.00, 1000000.00, 'C001', 0, 'PCS'),
('B00155', 'Laptop ASUS X555QA (NEW)', '', '2021-03-20', 0.00, 6000000.00, 'C001', 0, 'PCS'),
('B00156', 'Laptop Lenovo 330 (NEW)', '', '2021-03-20', 0.00, 5700000.00, 'C001', 0, 'PCS'),
('B00157', 'Laptop ASUS A450L biru (Second)', '', '2021-03-20', 0.00, 3500000.00, 'C001', 0, 'PCS'),
('B00158', 'Laptop Axioo MNC NEON (Second)', '', '2021-03-20', 0.00, 1500000.00, 'C001', 0, 'PCS'),
('B00159', 'Laptop ASUS Putih X452C (Second)', '', '2021-03-20', 0.00, 3000000.00, 'C001', 0, 'PCS'),
('B00160', 'Printer CANON IP2770', '', '2021-03-20', 0.00, 670000.00, 'C004', 0, 'PCS'),
('B00161', 'Printer CANON MP287', '', '2021-03-20', 0.00, 1150000.00, 'C004', 0, 'PCS'),
('B00162', 'Printer CANON MX497', '', '2021-03-20', 0.00, 1500000.00, 'C004', 0, 'PCS'),
('B00163', 'Printer EPSON L120', '', '2021-03-20', 0.00, 1650000.00, 'C004', 0, 'PCS'),
('B00164', 'Catride HP 802', '', '2021-03-20', 0.00, 0.00, 'C004', 0, 'PCS'),
('B00165', 'Catride HP 680 Black', '', '2021-03-20', 0.00, 0.00, 'C004', 0, 'PCS'),
('B00166', 'Catride CANON 40', '', '2021-03-20', 0.00, 0.00, 'C004', 0, 'PCS'),
('B00167', 'Charger LAPTOP SONY VAIO 19v ORIGINAL', '', '2021-03-20', 0.00, 250000.00, 'C001', 0, 'PCS'),
('B00168', 'Thermal Receipt Printer', '', '2021-03-20', 0.00, 1500000.00, 'C004', 0, 'PCS'),
('B00169', 'Vakum Catride', '', '2021-03-20', 0.00, 75000.00, 'C004', 0, 'PCS'),
('B00170', 'Keyboard Axioo MNC', '', '2021-03-20', 0.00, 350000.00, 'C001', 0, 'PCS'),
('B00171', 'Charger Lenovo 29v-3,25A', '', '2021-03-20', 0.00, 250000.00, 'C002', 0, 'PCS'),
('B00172', 'Calculator Micro Lithium CELL', '', '2021-03-20', 0.00, 23000.00, 'C001', 0, 'PCS'),
('B00173', 'Screen Cleaning KIT', '', '2021-03-20', 0.00, 15000.00, 'C001', 0, 'PCS'),
('B00174', 'TOTO LINK Wirelless N  150mbps', '', '2021-03-20', 0.00, 150000.00, 'C003', 0, 'PCS'),
('B00175', 'CD-Rom Second HDD Caddy', '', '2021-03-20', 0.00, 100000.00, 'C001', 0, 'PCS'),
('B00176', 'Infrared Thermometer GM320', '', '2021-03-20', 0.00, 0.00, 'C001', 0, 'PCS'),
('B00177', 'XSHOCK2', '', '2021-03-20', 0.00, 60000.00, 'C001', 0, 'PCS'),
('B00178', 'HDMI Dongle', '', '2021-03-20', 0.00, 150000.00, 'C001', 0, 'PCS'),
('B00179', 'Azube Biade 120mm', '', '2021-03-20', 0.00, 100000.00, 'C001', 0, 'PCS'),
('B00180', 'Converter IPHONE', '', '2021-03-20', 0.00, 30000.00, 'C001', 0, 'PCS'),
('B00181', 'Karet Penutup Notebok', '', '2021-03-20', 0.00, 25000.00, 'C001', 0, 'PCS'),
('B00182', 'Keyboard Havit', '', '2021-03-20', 0.00, 80000.00, 'C001', 0, 'PCS'),
('B00183', 'Charger Laptop AC 12V-2.1A', '', '2021-03-20', 0.00, 200000.00, 'C001', 0, 'PCS'),
('B00184', 'Charger Laptop AC 12V-1.75A', '', '2021-03-20', 0.00, 200000.00, 'C002', 0, 'PCS'),
('B00185', 'Charger Laptop AC 12V-5A', '', '2021-03-20', 0.00, 200000.00, 'C001', 0, 'PCS'),
('B00186', 'Batrei Laptop ASUS', '', '2021-03-20', 0.00, 650000.00, 'C001', 0, 'PCS'),
('B00187', 'Batrei Laptop ASUS k42', '', '2021-03-20', 0.00, 650000.00, 'C001', 0, 'PCS'),
('B00188', 'Kabel USB 1m', '', '2021-03-20', 0.00, 15000.00, 'C001', 0, 'PCS'),
('B00189', 'Hardisk Second', '', '2021-03-20', 0.00, 0.00, 'C001', 0, 'PCS'),
('B00190', 'LAPTOP HP ENVY X360 15 - DS1010WM - RYZEN 5 4500 - 8GB - 256GB - TOUCH - WIN10', '-', '2021-03-25', 0.00, 11500000.00, 'C001', 1, 'BUAH'),
('B00191', 'RAM VGEN PLATINUM 4GB DDR4', '', '2021-03-27', 45000.00, 550000.00, 'C001', 10, 'PCS'),
('B00192', 'MOUSE + KEYBOARD + HEADPHONE + MOUSEPAD GAMING KOMIC CMG570', '', '2021-03-27', 350000.00, 350000.00, 'C005', 1, 'PCS'),
('B00193', 'KABEL UTP CAT 5e', '', '2021-04-19', 0.00, 2500000.00, 'C005', 0, 'KOTAK'),
('B00194', 'RJ 45 (ISI 100)', '-', '2021-04-19', 0.00, 180000.00, 'C005', 0, 'KOTAK'),
('B00195', 'KABEL LISTRIK ', '', '2021-04-19', 0.00, 500000.00, 'C005', 0, 'ROLL'),
('B00196', 'TERMINAL 3 SLOT', '', '2021-04-19', 0.00, 25000.00, 'C002', 0, 'BUAH'),
('B00197', 'LAKBAN', '', '2021-04-19', 0.00, 25000.00, 'C005', 0, 'BUAH'),
('B00198', 'ISOLASI LISTRIK', '', '2021-04-19', 0.00, 25000.00, 'C005', 0, 'BUAH'),
('B00199', 'PAKU KLEM BETON', '', '2021-04-19', 0.00, 25000.00, 'C005', 0, 'BUNGKUS'),
('B00200', 'OPERASIONAL', '', '2021-04-19', 0.00, 40000.00, 'C005', 0, 'Org/hari'),
('B00201', 'TRANSPORTASI ANGKUTAN BARANG ', '', '2021-04-19', 0.00, 2015000.00, 'C005', 0, 'LS'),
('B00202', 'BATERAI A3', '', '2021-04-19', 0.00, 20000.00, 'C005', 0, 'KOTAK'),
('B00203', 'BATERAI A2', '', '2021-04-19', 0.00, 20000.00, 'C005', 0, 'KOTAK'),
('B00204', 'GENSET (BAHAN BAKAR DAN TEKNISI)', '', '2021-04-19', 0.00, 8000000.00, 'C005', 0, 'LS'),
('B00205', 'DLINK DIR-806A , AC750 Wireless Router Dual-Band WIFI D-LINK', '', '2021-04-19', 0.00, 440000.00, 'C003', 0, '-'),
('B00206', 'TP-Link MC220L SFP Slot Gigabit to Ethernet Media Converter', '', '2021-04-19', 0.00, 332000.00, 'C003', 0, '-'),
('B00207', 'Microtik SFP S-3553LC20D 1 pair Transceiver  gigabit singlemode 20km', '', '2021-04-19', 0.00, 1005000.00, 'C005', 0, '-'),
('B00208', 'D-Link DES-1016D Port 10/100mbps Unmanaged Switch', '', '2021-04-19', 0.00, 590000.00, 'C003', 0, '-'),
('B00209', 'DGS-1100-18 Switch DLINK Port Gigabit + 2 SFP Smart Managed', '', '2021-04-19', 0.00, 2733000.00, 'C003', 0, '-'),
('B00210', 'FIBER optic DW 1Core', '', '2021-04-19', 0.00, 1983000.00, 'C005', 0, '-'),
('B00211', 'KABEL LAN UTP CAT 5e', '', '2021-04-19', 0.00, 1728000.00, 'C005', 0, '-'),
('B00212', 'RJ45', '', '2021-04-19', 0.00, 150000.00, 'C005', 0, '-'),
('B00213', 'Fast Conector LC UPC Fiber Optic', '', '2021-04-19', 0.00, 1313000.00, 'C005', 0, '-'),
('B00214', 'Pipa Besi diameter 2,5 in + Pengecoran', '', '2021-04-19', 0.00, 350000.00, 'C005', 0, '-'),
('B00215', 'Microtik RBLHG-HPnD-XL', '', '2021-04-19', 0.00, 2250000.00, 'C005', 0, '-'),
('B00216', 'Kawat Galvanis 3mm', '', '2021-04-19', 0.00, 542000.00, 'C005', 0, '-'),
('B00217', 'DLINK DIR-806A , AC750 Wireless Router Dual-Band ', '', '2021-04-19', 0.00, 440000.00, 'C003', 0, '-'),
('B00218', 'KABEL LAN UTP CAT 5e', '', '2021-04-19', 0.00, 1728000.00, 'C005', 0, '-'),
('B00219', 'SIKU RAK', '', '2021-04-19', 0.00, 10000.00, 'C005', 0, '-'),
('B00220', 'Konsumsi 1', '', '2021-04-27', 0.00, 40000.00, 'C005', 0, 'Org/hari'),
('B00221', 'Konsumsi 2', '', '2021-04-27', 0.00, 40000.00, 'C005', 0, 'Org/hari'),
('B00222', 'Konsumsi 3', '', '2021-04-27', 0.00, 40000.00, 'C005', 0, 'Org/hari'),
('B00223', 'Konsumsi 4', '', '2021-04-27', 0.00, 40000.00, 'C005', 0, 'Org/hari'),
('B00224', 'Konsumsi 5', '', '2021-04-27', 0.00, 40000.00, 'C005', 0, 'Org/hari'),
('B00225', 'KABEL POWER CPU (SECOND)', '-', '2021-05-06', 0.00, 10000.00, 'C002', 0, '-'),
('B00226', 'KEYBOARD DAN MOUSE ALCATROZ', '-', '2021-05-08', 0.00, 450000.00, 'C005', 0, '-'),
('B00227', 'KEYBOARD+MOUSE LOGITECH', '-', '2021-05-08', 0.00, 300000.00, 'C005', 0, '-'),
('B00228', 'KEYBOARD DAN MOUSE LOGITECH', '-', '2021-05-08', 0.00, 300000.00, 'C005', 0, '0'),
('B00229', 'KEYBOARD DAN MOUSE LOGITECH', '-', '2021-05-08', 0.00, 0.00, 'C001', 0, '-');

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
('OUT01022100001', 'AIR MINERAL PROFE', 22000.00, 1, 3, '2021-02-01 08:11:12'),
('OUT02032100001', 'AYAM', 28000.00, 1, 3, '2021-03-02 13:47:58'),
('OUT02032100001', 'BAWANG PUTIH + BAWANG MERAH', 7000.00, 1, 3, '2021-03-02 13:47:58'),
('OUT02032100001', 'BUMBU RACIK', 5000.00, 1, 3, '2021-03-02 13:47:58'),
('OUT02032100001', 'TAHU', 6000.00, 1, 3, '2021-03-02 13:47:58'),
('OUT02032100001', 'TEMPE', 7000.00, 1, 3, '2021-03-02 13:47:58'),
('OUT02032100002', 'TISU PASEO', 10000.00, 1, 3, '2021-03-02 17:17:57'),
('OUT03022100001', 'AIR GALON ', 5000.00, 3, 3, '2021-02-03 11:42:05'),
('OUT03042100001', 'AIR GALON', 5000.00, 3, 3, '2021-04-03 11:23:39'),
('OUT04022100001', 'MINYAK GORENG FORTUNE 2L', 29500.00, 1, 3, '2021-02-04 13:12:02'),
('OUT04022100001', 'RINSO ', 21300.00, 1, 3, '2021-02-04 13:12:02'),
('OUT04022100001', 'SUNLIGHT MINT', 16900.00, 1, 3, '2021-02-04 13:12:02'),
('OUT04032100001', 'GULA', 15000.00, 1, 3, '2021-03-04 08:02:54'),
('OUT04032100001', 'KUE KERING', 22000.00, 1, 3, '2021-03-04 08:02:54'),
('OUT04032100001', 'TERANG BULAN', 25000.00, 1, 3, '2021-03-04 08:02:54'),
('OUT04032100002', 'AIR GALON', 5000.00, 3, 3, '2021-03-04 10:13:00'),
('OUT04032100002', 'AIR GALON ISI ULANG', 0.00, 3, 3, '2021-03-04 10:13:00'),
('OUT04032100003', 'PROF', 24000.00, 2, 3, '2021-03-04 13:20:18'),
('OUT06032100001', 'MINYAK GORENG', 31000.00, 1, 3, '2021-03-06 12:19:34'),
('OUT06032100002', 'MIE ', 3000.00, 4, 3, '2021-03-06 12:20:14'),
('OUT07042100001', 'AYAM 1KG + BAWANG MERAH DAN PUTIH', 33000.00, 1, 3, '2021-04-07 10:09:23'),
('OUT07042100002', 'KABEL TIES', 25000.00, 1, 3, '2021-04-07 10:11:06'),
('OUT08022100001', 'PROFE GELAS', 22000.00, 2, 3, '2021-02-08 10:33:22'),
('OUT08022100002', 'AYAM JONTOR', 17500.00, 2, 3, '2021-02-08 13:35:47'),
('OUT08052100001', 'TOKEN LISTRIK', 502500.00, 1, 3, '2021-05-08 09:19:49'),
('OUT09022100001', 'NASI PADANG AYAM GULAI', 13000.00, 2, 3, '2021-02-09 13:15:42'),
('OUT09022100002', 'TEH KOTAK ', 5000.00, 5, 3, '2021-02-09 13:16:48'),
('OUT09022100002', 'TEH PUCUK', 4000.00, 1, 3, '2021-02-09 13:16:48'),
('OUT09032100001', 'TISU', 10000.00, 1, 3, '2021-03-09 13:50:13'),
('OUT10032100001', 'BERAS HIBRIDA 10 KG', 120000.00, 1, 3, '2021-03-10 13:15:06'),
('OUT10032100001', 'DAHLIA FRESHGO MATIC DIS', 72300.00, 1, 3, '2021-03-10 13:15:06'),
('OUT10032100001', 'TISSU JOLLY 100 GR 2 PLY/20', 37500.00, 1, 3, '2021-03-10 13:15:06'),
('OUT10032100002', 'WALLPAPER DINDING', 200000.00, 1, 3, '2021-03-10 18:02:45'),
('OUT10042100001', 'AYAM+PATIN', 54000.00, 1, 3, '2021-04-10 08:35:38'),
('OUT10042100002', 'TISU PASEO', 10000.00, 1, 3, '2021-04-10 08:35:55'),
('OUT10052100001', 'TISU', 10000.00, 1, 3, '2021-05-10 08:00:06'),
('OUT11032100001', 'GAS 5.5 KG', 77000.00, 1, 3, '2021-03-11 11:18:56'),
('OUT13022100001', 'TP LINK 150MBPS', 150000.00, 1, 3, '2021-02-13 16:30:18'),
('OUT15022100001', 'PLASTIK BARANG', 1000.00, 4, 3, '2021-02-15 08:52:16'),
('OUT15022100001', 'PLASTIK SAMPAH', 25000.00, 2, 3, '2021-02-15 08:52:16'),
('OUT15032100001', 'MARTABAK', 20000.00, 1, 3, '2021-03-15 13:43:04'),
('OUT15032100001', 'TERANG BULAN', 10000.00, 2, 3, '2021-03-15 13:43:04'),
('OUT15032100002', 'NASI PADANG', 13000.00, 4, 3, '2021-03-15 13:45:06'),
('OUT15032100002', 'PARKIR', 2000.00, 1, 3, '2021-03-15 13:45:06'),
('OUT16042100001', 'PROF', 23000.00, 3, 3, '2021-04-16 10:18:50'),
('OUT17032100001', 'BAYAR ONGKIR', 34000.00, 1, 3, '2021-03-17 18:27:01'),
('OUT19022100001', 'TISU PASEO', 10000.00, 1, 3, '2021-02-19 10:53:22'),
('OUT19032100001', 'PROFE', 22000.00, 2, 3, '2021-03-19 09:25:02'),
('OUT19032100002', 'TAHU TEK', 15000.00, 4, 3, '2021-03-19 09:25:26'),
('OUT19032100003', 'SAJIKU+ROYCO+LADAKU', 8000.00, 1, 3, '2021-03-19 09:26:03'),
('OUT19032100004', 'TOMAT+BUMBU SOP', 3000.00, 1, 3, '2021-03-19 09:47:59'),
('OUT20022100001', 'TISU PASEO', 10000.00, 1, 3, '2021-02-20 08:23:10'),
('OUT20022100002', 'BERAS 10KG DAN MAKANAN KUCING', 130000.00, 1, 3, '2021-02-20 10:43:50'),
('OUT20022100003', 'PROFE', 22000.00, 2, 3, '2021-02-20 14:33:30'),
('OUT20032100001', 'AYAM 1KG', 41000.00, 1, 3, '2021-03-20 11:14:26'),
('OUT20032100001', 'TELUR', 2000.00, 10, 3, '2021-03-20 11:14:26'),
('OUT20042100001', 'KABEL DUCT NISO TF 10.20', 15000.00, 1, 3, '2021-04-20 14:51:38'),
('OUT20042100001', 'KABEL DUCT NISO TF 16.25', 20000.00, 1, 3, '2021-04-20 14:51:38'),
('OUT20042100001', 'UTICON OB/S ARDE 6Lb 168', 27000.00, 1, 3, '2021-04-20 14:51:38'),
('OUT20042100002', 'PANCIS', 3000.00, 1, 3, '2021-04-20 15:07:54'),
('OUT23022100001', 'AIR GALON ', 5000.00, 3, 3, '2021-02-23 09:20:19'),
('OUT23022100002', 'TELUR', 2000.00, 10, 3, '2021-02-23 12:44:26'),
('OUT23032100001', 'IS ULANG GALON', 5000.00, 3, 3, '2021-03-23 08:32:08'),
('OUT23042100001', 'TISU PASEO', 10000.00, 1, 3, '2021-04-23 15:39:56'),
('OUT23042100002', 'STELA MATIC REFF FLOWER', 28700.00, 1, 3, '2021-04-23 16:38:57'),
('OUT23042100002', 'STELA PARFUM GREEN FANT', 60000.00, 1, 3, '2021-04-23 16:38:57'),
('OUT24042100001', 'KABEL DUCT NISO TF 10.20', 15000.00, 6, 3, '2021-04-24 15:04:29'),
('OUT26022100001', 'AYAM DAN SAYUR', 33000.00, 1, 3, '2021-02-26 12:17:07'),
('OUT26022100002', 'MIE ', 3000.00, 3, 3, '2021-02-26 12:17:53'),
('OUT26032100001', 'TISU', 10000.00, 1, 3, '2021-03-26 09:52:14'),
('OUT26042100001', 'AYAM 1KG', 32000.00, 1, 3, '2021-04-26 09:50:39'),
('OUT26042100001', 'Ikan Patin 7ons', 19000.00, 1, 3, '2021-04-26 09:50:39'),
('OUT26042100001', 'Sayur Sop', 10000.00, 1, 3, '2021-04-26 09:50:39'),
('OUT26042100001', 'Telur ', 2000.00, 16, 3, '2021-04-26 09:50:39'),
('OUT26042100002', 'Beras 10 KG', 110000.00, 1, 3, '2021-04-26 09:53:51'),
('OUT27012100003', 'MINYAK GORENG', 35000.00, 1, 1, '2021-01-27 14:46:54'),
('OUT27022100001', 'AYAM 1/2KG DAN TAHU', 30000.00, 1, 3, '2021-02-27 12:20:55'),
('OUT28042100001', 'BAYAR ONGKIR', 2500.00, 1, 3, '2021-04-28 10:42:25'),
('OUT28042100001', 'BAYAR TAGIHAN KARTU HALO', 43214.00, 1, 3, '2021-04-28 10:42:25'),
('OUT28042100002', 'MINYA GORENG BIMOLI 2L', 30000.00, 1, 3, '2021-04-28 12:59:20'),
('OUT29042100001', 'ISI ULANG GALON', 5000.00, 3, 3, '2021-04-29 10:04:54');

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
('CA02032100001', 'B00009', 1, 300000.00, 0.00, 3, '2021-03-02 14:09:27'),
('CA02042100001', 'B00013', 1, 100000.00, 0.00, 3, '2021-04-02 14:16:19'),
('CA03032100001', 'B00010', 1, 35000.00, 0.00, 3, '2021-03-03 16:49:00'),
('CA03032100002', 'B00011', 1, 250000.00, 0.00, 3, '2021-03-03 16:51:23'),
('CA04022100002', 'B00003', 1, 650000.00, 0.00, 3, '2021-02-04 15:53:45'),
('CA05032100001', 'B00021', 1, 10000.00, 0.00, 3, '2021-03-05 14:58:44'),
('CA06052100001', 'B00225', 1, 10000.00, 0.00, 3, '2021-05-06 12:20:19'),
('CA06052100002', 'B00011', 1, 250000.00, 0.00, 3, '2021-05-06 15:02:20'),
('CA06052100003', 'B00011', 1, 250000.00, 0.00, 3, '2021-05-06 15:05:02'),
('CA07042100001', 'B00037', 1, 15000.00, 0.00, 3, '2021-04-07 10:12:52'),
('CA07052100001', 'B00011', 1, 250000.00, 0.00, 3, '2021-05-07 16:07:36'),
('CA08052100001', 'B00228', 1, 300000.00, 0.00, 3, '2021-05-08 13:54:30'),
('CA08052100002', 'B00069', 1, 250000.00, 0.00, 3, '2021-05-08 14:15:08'),
('CA09042100001', 'B00069', 1, 250000.00, 0.00, 3, '2021-04-09 09:53:06'),
('CA10032100001', 'B00022', 1, 50000.00, 0.00, 3, '2021-03-10 15:46:19'),
('CA16032100001', 'B00014', 1, 90000.00, 0.00, 3, '2021-03-16 11:51:49'),
('CA16032100002', 'B00014', 1, 90000.00, 0.00, 3, '2021-03-16 11:53:04'),
('CA16042100001', 'B00131', 1, 150000.00, 0.00, 3, '2021-04-16 16:31:46'),
('CA16042100002', 'B00131', 1, 150000.00, 0.00, 3, '2021-04-16 16:32:54'),
('CA18032100002', 'B00025', 1, 300000.00, 0.00, 3, '2021-03-18 10:53:23'),
('CA19022100001', 'B00004', 1, 250000.00, 0.00, 3, '2021-02-19 14:25:00'),
('CA19042100009', 'B00193', 2, 2500000.00, 0.00, 3, '2021-04-19 15:34:02'),
('CA19042100009', 'B00194', 4, 180000.00, 0.00, 3, '2021-04-19 15:34:17'),
('CA19042100009', 'B00195', 5, 500000.00, 0.00, 3, '2021-04-19 15:34:47'),
('CA19042100009', 'B00196', 10, 25000.00, 0.00, 3, '2021-04-19 15:36:48'),
('CA19042100009', 'B00197', 5, 25000.00, 0.00, 3, '2021-04-19 15:37:10'),
('CA19042100009', 'B00198', 5, 25000.00, 0.00, 3, '2021-04-19 15:37:22'),
('CA19042100009', 'B00199', 5, 25000.00, 0.00, 3, '2021-04-19 15:37:32'),
('CA19042100009', 'B00200', 60, 40000.00, 0.00, 3, '2021-04-19 15:37:40'),
('CA19042100009', 'B00201', 1, 2015000.00, 0.00, 3, '2021-04-19 15:38:57'),
('CA19042100009', 'B00202', 45, 20000.00, 0.00, 3, '2021-04-19 15:39:05'),
('CA19042100009', 'B00203', 45, 20000.00, 0.00, 3, '2021-04-19 15:40:04'),
('CA19042100010', 'B00193', 1, 2500000.00, 0.00, 3, '2021-04-19 15:43:04'),
('CA19042100010', 'B00194', 2, 180000.00, 0.00, 3, '2021-04-19 15:43:13'),
('CA19042100010', 'B00195', 2, 500000.00, 0.00, 3, '2021-04-19 15:44:02'),
('CA19042100010', 'B00196', 2, 25000.00, 0.00, 3, '2021-04-19 15:44:14'),
('CA19042100010', 'B00197', 2, 25000.00, 0.00, 3, '2021-04-19 15:44:20'),
('CA19042100010', 'B00198', 2, 25000.00, 0.00, 3, '2021-04-19 15:44:26'),
('CA19042100010', 'B00199', 2, 25000.00, 0.00, 3, '2021-04-19 15:44:33'),
('CA19042100010', 'B00200', 60, 40000.00, 0.00, 3, '2021-04-19 15:44:37'),
('CA19042100010', 'B00202', 25, 20000.00, 0.00, 3, '2021-04-19 15:46:11'),
('CA19042100010', 'B00203', 25, 20000.00, 0.00, 3, '2021-04-19 15:46:48'),
('CA19042100010', 'B00204', 1, 8000000.00, 0.00, 3, '2021-04-19 15:47:38'),
('CA19042100011', 'B00193', 1, 2500000.00, 0.00, 3, '2021-04-19 15:52:05'),
('CA19042100011', 'B00194', 2, 180000.00, 0.00, 3, '2021-04-19 15:52:07'),
('CA19042100011', 'B00195', 2, 500000.00, 0.00, 3, '2021-04-19 15:52:12'),
('CA19042100011', 'B00196', 4, 25000.00, 0.00, 3, '2021-04-19 15:52:21'),
('CA19042100011', 'B00197', 4, 25000.00, 0.00, 3, '2021-04-19 15:52:35'),
('CA19042100011', 'B00198', 4, 25000.00, 0.00, 3, '2021-04-19 15:52:43'),
('CA19042100011', 'B00199', 4, 25000.00, 0.00, 3, '2021-04-19 15:52:52'),
('CA19042100011', 'B00200', 60, 40000.00, 0.00, 3, '2021-04-19 15:53:01'),
('CA19042100012', 'B00193', 1, 2500000.00, 0.00, 3, '2021-04-19 15:56:08'),
('CA19042100012', 'B00194', 2, 180000.00, 0.00, 3, '2021-04-19 15:56:13'),
('CA19042100012', 'B00195', 2, 500000.00, 0.00, 3, '2021-04-19 15:56:30'),
('CA19042100012', 'B00196', 2, 25000.00, 0.00, 3, '2021-04-19 15:56:44'),
('CA19042100012', 'B00197', 2, 25000.00, 0.00, 3, '2021-04-19 15:56:50'),
('CA19042100012', 'B00198', 2, 25000.00, 0.00, 3, '2021-04-19 15:56:57'),
('CA19042100012', 'B00199', 2, 25000.00, 0.00, 3, '2021-04-19 15:57:03'),
('CA19042100012', 'B00200', 60, 40000.00, 0.00, 3, '2021-04-19 15:57:09'),
('CA19042100012', 'B00202', 70, 20000.00, 0.00, 3, '2021-04-19 15:58:59'),
('CA19042100012', 'B00203', 70, 20000.00, 0.00, 3, '2021-04-19 16:00:42'),
('CA19042100013', 'B00193', 2, 2500000.00, 0.00, 3, '2021-04-19 16:05:10'),
('CA19042100013', 'B00194', 2, 180000.00, 0.00, 3, '2021-04-19 16:05:14'),
('CA19042100013', 'B00195', 2, 500000.00, 0.00, 3, '2021-04-19 16:05:26'),
('CA19042100013', 'B00196', 2, 25000.00, 0.00, 3, '2021-04-19 16:06:10'),
('CA19042100013', 'B00197', 2, 25000.00, 0.00, 3, '2021-04-19 16:06:16'),
('CA19042100013', 'B00198', 2, 25000.00, 0.00, 3, '2021-04-19 16:06:22'),
('CA19042100013', 'B00199', 2, 25000.00, 0.00, 3, '2021-04-19 16:06:27'),
('CA19042100013', 'B00200', 60, 40000.00, 0.00, 3, '2021-04-19 16:06:36'),
('CA19042100013', 'B00202', 100, 20000.00, 0.00, 3, '2021-04-19 16:09:05'),
('CA19042100013', 'B00203', 100, 20000.00, 0.00, 3, '2021-04-19 16:11:27'),
('CA19042100013', 'B00204', 1, 8000000.00, 0.00, 3, '2021-04-19 16:14:16'),
('CA19042100014', 'B00205', 7, 440000.00, 0.00, 3, '2021-04-19 16:16:39'),
('CA19042100014', 'B00206', 12, 332000.00, 0.00, 3, '2021-04-19 16:17:56'),
('CA19042100014', 'B00207', 6, 1313000.00, 0.00, 3, '2021-04-19 16:18:45'),
('CA19042100014', 'B00208', 3, 590000.00, 0.00, 3, '2021-04-19 16:20:27'),
('CA19042100014', 'B00209', 5, 2733000.00, 0.00, 3, '2021-04-19 16:20:44'),
('CA19042100014', 'B00210', 1, 2117000.00, 0.00, 3, '2021-04-19 16:20:55'),
('CA19042100014', 'B00211', 1, 1728000.00, 0.00, 3, '2021-04-19 16:21:06'),
('CA19042100014', 'B00212', 2, 150000.00, 0.00, 3, '2021-04-19 16:21:11'),
('CA19042100014', 'B00213', 20, 54000.00, 0.00, 3, '2021-04-19 16:21:18'),
('CA19042100015', 'B00206', 2, 332000.00, 0.00, 3, '2021-04-19 16:24:56'),
('CA19042100015', 'B00207', 1, 1313000.00, 0.00, 3, '2021-04-19 16:25:04'),
('CA19042100015', 'B00208', 4, 590000.00, 0.00, 3, '2021-04-19 16:25:13'),
('CA19042100015', 'B00214', 6, 350000.00, 0.00, 3, '2021-04-19 16:25:37'),
('CA19042100015', 'B00215', 2, 2250000.00, 0.00, 3, '2021-04-19 16:25:55'),
('CA19042100015', 'B00216', 1, 542000.00, 0.00, 3, '2021-04-19 16:26:05'),
('CA19042100015', 'B00217', 6, 440000.00, 0.00, 3, '2021-04-19 16:26:13'),
('CA19042100015', 'B00218', 1, 1728000.00, 0.00, 3, '2021-04-19 16:26:27'),
('CA19042100015', 'B00219', 20, 10000.00, 0.00, 3, '2021-04-19 16:27:24'),
('CA20022100001', 'B00005', 1, 150000.00, 0.00, 3, '2021-02-20 12:08:03'),
('CA22032100001', 'B00014', 1, 90000.00, 0.00, 3, '2021-03-22 08:19:22'),
('CA23042100001', 'B00193', 2, 2500000.00, 0.00, 3, '2021-04-23 08:32:31'),
('CA23042100001', 'B00194', 4, 180000.00, 0.00, 3, '2021-04-23 08:32:41'),
('CA23042100001', 'B00195', 5, 500000.00, 0.00, 3, '2021-04-23 08:32:49'),
('CA23042100001', 'B00196', 10, 25000.00, 0.00, 3, '2021-04-23 08:33:10'),
('CA23042100001', 'B00197', 5, 25000.00, 0.00, 3, '2021-04-23 08:33:25'),
('CA23042100001', 'B00198', 5, 25000.00, 0.00, 3, '2021-04-23 08:33:39'),
('CA23042100001', 'B00199', 5, 25000.00, 0.00, 3, '2021-04-23 08:33:48'),
('CA23042100001', 'B00202', 45, 20000.00, 0.00, 3, '2021-04-23 08:35:21'),
('CA23042100001', 'B00203', 45, 20000.00, 0.00, 3, '2021-04-23 08:36:09'),
('CA23042100002', 'B00193', 1, 2500000.00, 0.00, 3, '2021-04-23 08:42:05'),
('CA23042100002', 'B00194', 2, 180000.00, 0.00, 3, '2021-04-23 08:42:11'),
('CA23042100002', 'B00195', 2, 500000.00, 0.00, 3, '2021-04-23 08:42:19'),
('CA23042100002', 'B00196', 2, 25000.00, 0.00, 3, '2021-04-23 08:48:28'),
('CA23042100002', 'B00197', 2, 25000.00, 0.00, 3, '2021-04-23 08:48:34'),
('CA23042100002', 'B00198', 2, 25000.00, 0.00, 3, '2021-04-23 08:48:40'),
('CA23042100002', 'B00199', 2, 25000.00, 0.00, 3, '2021-04-23 08:48:43'),
('CA23042100002', 'B00202', 25, 20000.00, 0.00, 3, '2021-04-23 08:49:29'),
('CA23042100002', 'B00203', 25, 20000.00, 0.00, 3, '2021-04-23 08:49:00'),
('CA23042100003', 'B00193', 1, 2500000.00, 0.00, 3, '2021-04-23 08:56:10'),
('CA23042100003', 'B00194', 2, 180000.00, 0.00, 3, '2021-04-23 08:56:12'),
('CA23042100003', 'B00195', 2, 500000.00, 0.00, 3, '2021-04-23 08:56:43'),
('CA23042100003', 'B00196', 4, 25000.00, 0.00, 3, '2021-04-23 08:57:02'),
('CA23042100003', 'B00197', 4, 25000.00, 0.00, 3, '2021-04-23 08:57:10'),
('CA23042100003', 'B00198', 4, 25000.00, 0.00, 3, '2021-04-23 08:57:24'),
('CA23042100003', 'B00199', 4, 25000.00, 0.00, 3, '2021-04-23 08:57:30'),
('CA23042100004', 'B00193', 1, 2500000.00, 0.00, 3, '2021-04-23 08:59:22'),
('CA23042100004', 'B00194', 2, 180000.00, 0.00, 3, '2021-04-23 08:59:28'),
('CA23042100004', 'B00195', 2, 500000.00, 0.00, 3, '2021-04-23 08:59:34'),
('CA23042100004', 'B00196', 2, 25000.00, 0.00, 3, '2021-04-23 08:59:41'),
('CA23042100004', 'B00197', 2, 25000.00, 0.00, 3, '2021-04-23 08:59:46'),
('CA23042100004', 'B00198', 2, 25000.00, 0.00, 3, '2021-04-23 08:59:52'),
('CA23042100004', 'B00199', 2, 25000.00, 0.00, 3, '2021-04-23 08:59:58'),
('CA23042100004', 'B00202', 70, 20000.00, 0.00, 3, '2021-04-23 09:02:19'),
('CA23042100004', 'B00203', 70, 20000.00, 0.00, 3, '2021-04-23 09:01:01'),
('CA23042100005', 'B00193', 2, 2500000.00, 0.00, 3, '2021-04-23 09:05:04'),
('CA23042100005', 'B00194', 2, 180000.00, 0.00, 3, '2021-04-23 09:07:14'),
('CA23042100005', 'B00195', 2, 500000.00, 0.00, 3, '2021-04-23 09:07:20'),
('CA23042100005', 'B00196', 2, 25000.00, 0.00, 3, '2021-04-23 09:07:27'),
('CA23042100005', 'B00197', 2, 25000.00, 0.00, 3, '2021-04-23 09:07:30'),
('CA23042100005', 'B00198', 2, 25000.00, 0.00, 3, '2021-04-23 09:07:35'),
('CA23042100005', 'B00199', 2, 25000.00, 0.00, 3, '2021-04-23 09:07:39'),
('CA23042100005', 'B00202', 100, 20000.00, 0.00, 3, '2021-04-23 09:09:19'),
('CA23042100005', 'B00203', 100, 20000.00, 0.00, 3, '2021-04-23 09:07:51'),
('CA23042100006', 'B00205', 7, 440000.00, 0.00, 3, '2021-04-23 09:12:39'),
('CA23042100006', 'B00206', 12, 332000.00, 0.00, 3, '2021-04-23 09:13:08'),
('CA23042100006', 'B00207', 6, 1313000.00, 0.00, 3, '2021-04-23 09:13:49'),
('CA23042100006', 'B00208', 3, 590000.00, 0.00, 3, '2021-04-23 09:14:06'),
('CA23042100006', 'B00209', 5, 2733000.00, 0.00, 3, '2021-04-23 09:14:15'),
('CA23042100006', 'B00210', 1, 2117000.00, 0.00, 3, '2021-04-23 09:14:25'),
('CA23042100006', 'B00211', 1, 1728000.00, 0.00, 3, '2021-04-23 09:14:46'),
('CA23042100006', 'B00212', 2, 150000.00, 0.00, 3, '2021-04-23 09:15:10'),
('CA23042100006', 'B00213', 20, 54000.00, 0.00, 3, '2021-04-23 09:15:32'),
('CA25032100001', 'B00190', 1, 11500000.00, 0.00, 3, '2021-03-25 17:04:49'),
('CA26032100001', 'B00006', 1, 20000.00, 0.00, 3, '2021-03-26 14:04:26'),
('CA27032100001', 'B00069', 1, 250000.00, 0.00, 3, '2021-03-27 15:27:09'),
('CA27032100002', 'B00191', 1, 550000.00, 0.00, 3, '2021-03-27 16:13:30'),
('CA27032100002', 'B00192', 1, 350000.00, 0.00, 3, '2021-03-27 16:13:16'),
('CA27042100001', 'B00193', 2, 2500000.00, 0.00, 3, '2021-04-27 09:26:15'),
('CA27042100001', 'B00194', 4, 180000.00, 0.00, 3, '2021-04-27 09:26:22'),
('CA27042100001', 'B00195', 5, 500000.00, 0.00, 3, '2021-04-27 09:27:04'),
('CA27042100001', 'B00196', 10, 25000.00, 0.00, 3, '2021-04-27 09:27:21'),
('CA27042100001', 'B00197', 1, 25000.00, 0.00, 3, '2021-04-27 09:27:38'),
('CA27042100001', 'B00198', 5, 25000.00, 0.00, 3, '2021-04-27 09:27:47'),
('CA27042100001', 'B00199', 5, 25000.00, 0.00, 3, '2021-04-27 09:28:08'),
('CA27042100001', 'B00202', 46, 20000.00, 0.00, 3, '2021-04-27 09:28:27'),
('CA27042100001', 'B00203', 46, 20000.00, 0.00, 3, '2021-04-27 09:29:45'),
('CA27042100001', 'B00208', 2, 590000.00, 0.00, 3, '2021-04-27 09:26:46'),
('CA27042100002', 'B00193', 1, 2500000.00, 0.00, 3, '2021-04-27 09:34:14'),
('CA27042100002', 'B00194', 2, 180000.00, 0.00, 3, '2021-04-27 09:34:20'),
('CA27042100002', 'B00195', 2, 500000.00, 0.00, 3, '2021-04-27 09:34:29'),
('CA27042100002', 'B00196', 2, 25000.00, 0.00, 3, '2021-04-27 09:35:01'),
('CA27042100002', 'B00197', 2, 25000.00, 0.00, 3, '2021-04-27 09:35:10'),
('CA27042100002', 'B00198', 2, 25000.00, 0.00, 3, '2021-04-27 09:35:15'),
('CA27042100002', 'B00199', 2, 25000.00, 0.00, 3, '2021-04-27 09:35:21'),
('CA27042100002', 'B00202', 25, 20000.00, 0.00, 3, '2021-04-27 09:36:08'),
('CA27042100002', 'B00203', 25, 20000.00, 0.00, 3, '2021-04-27 09:35:32'),
('CA27042100003', 'B00193', 2, 2500000.00, 0.00, 3, '2021-04-27 09:38:18'),
('CA27042100003', 'B00194', 2, 180000.00, 0.00, 3, '2021-04-27 09:38:31'),
('CA27042100003', 'B00195', 2, 500000.00, 0.00, 3, '2021-04-27 09:39:12'),
('CA27042100003', 'B00196', 4, 25000.00, 0.00, 3, '2021-04-27 09:39:21'),
('CA27042100003', 'B00197', 4, 25000.00, 0.00, 3, '2021-04-27 09:39:34'),
('CA27042100003', 'B00198', 4, 25000.00, 0.00, 3, '2021-04-27 09:39:42'),
('CA27042100003', 'B00199', 4, 25000.00, 0.00, 3, '2021-04-27 09:39:56'),
('CA27042100003', 'B00208', 2, 590000.00, 0.00, 3, '2021-04-27 09:38:50'),
('CA27042100004', 'B00193', 1, 2500000.00, 0.00, 3, '2021-04-27 09:41:24'),
('CA27042100004', 'B00194', 2, 180000.00, 0.00, 3, '2021-04-27 09:41:28'),
('CA27042100004', 'B00195', 2, 500000.00, 0.00, 3, '2021-04-27 09:41:34'),
('CA27042100004', 'B00196', 2, 25000.00, 0.00, 3, '2021-04-27 09:41:42'),
('CA27042100004', 'B00197', 2, 25000.00, 0.00, 3, '2021-04-27 09:41:50'),
('CA27042100004', 'B00198', 2, 25000.00, 0.00, 3, '2021-04-27 09:41:55'),
('CA27042100004', 'B00199', 2, 25000.00, 0.00, 3, '2021-04-27 09:42:00'),
('CA27042100004', 'B00202', 70, 20000.00, 0.00, 3, '2021-04-27 09:44:51'),
('CA27042100004', 'B00203', 70, 20000.00, 0.00, 3, '2021-04-27 09:42:08'),
('CA27042100005', 'B00193', 3, 2500000.00, 0.00, 3, '2021-04-27 09:47:51'),
('CA27042100005', 'B00194', 6, 180000.00, 0.00, 3, '2021-04-27 09:47:58'),
('CA27042100005', 'B00195', 4, 500000.00, 0.00, 3, '2021-04-27 10:09:09'),
('CA27042100005', 'B00196', 2, 25000.00, 0.00, 3, '2021-04-27 10:09:29'),
('CA27042100005', 'B00197', 2, 25000.00, 0.00, 3, '2021-04-27 10:09:35'),
('CA27042100005', 'B00198', 3, 25000.00, 0.00, 3, '2021-04-27 10:09:41'),
('CA27042100005', 'B00199', 2, 25000.00, 0.00, 3, '2021-04-27 10:09:57'),
('CA27042100005', 'B00202', 100, 20000.00, 0.00, 3, '2021-04-27 10:13:54'),
('CA27042100005', 'B00203', 100, 20000.00, 0.00, 3, '2021-04-27 10:10:48'),
('CA27042100005', 'B00206', 2, 332000.00, 0.00, 3, '2021-04-27 10:04:56'),
('CA27042100005', 'B00207', 2, 1005000.00, 0.00, 3, '2021-04-27 10:07:21'),
('CA27042100005', 'B00210', 1, 1983000.00, 0.00, 3, '2021-04-27 10:04:39'),
('CA27042100005', 'B00213', 1, 1313000.00, 0.00, 3, '2021-04-27 10:08:49'),
('CA27042100006', 'B00220', 75, 40000.00, 0.00, 3, '2021-04-27 10:39:08'),
('CA27042100006', 'B00221', 75, 40000.00, 0.00, 3, '2021-04-27 10:41:07'),
('CA27042100006', 'B00222', 75, 40000.00, 0.00, 3, '2021-04-27 10:41:38'),
('CA27042100006', 'B00223', 75, 40000.00, 0.00, 3, '2021-04-27 10:42:44'),
('CA27042100006', 'B00224', 75, 40000.00, 0.00, 3, '2021-04-27 10:42:47'),
('CA29042100001', 'B00069', 1, 250000.00, 0.00, 3, '2021-04-29 15:48:06');

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

--
-- Dumping data for table `tb_detail_servis`
--

INSERT INTO `tb_detail_servis` (`no_transaksi`, `kode_servis`, `jenis`, `seri`, `keluhan`, `kelengkapan`, `kerusakan`, `biaya`, `garansi`, `qty`, `petugas`, `timestmp`) VALUES
('SER01032100001', 1, 'PRINTER', 'CANON IP2770', 'CATRIDGE HITAM + INFUS BERMASALAH', '-', 'SERVICE + GANTAI CATRIDGE HITAM', 500000.00, '-', 1, 3, '2021-03-01 08:04:30'),
('SER01032100001', 2, 'PRINTER', 'CANON MX397', 'ERROR (CATRIDGE TINTA TIDAK DIDUKUNG)', '-', 'SERVICE + GANTI CATRIDGE 1 SET', 610000.00, '-', 1, 3, '2021-03-01 08:06:23'),
('SER01032100001', 3, 'PRINTER', 'CANON MX397', 'CATRIDGE HITAM + WARNA CACAT', '-', 'SERVICE + GANTI CATRIDGE 1 SET', 610000.00, '-', 1, 3, '2021-03-01 08:07:52'),
('SER01032100001', 4, 'PRINTER', 'CANON MX537', 'HASIL TINTA CATRIDGE TIDAK BAGUS', '-', 'SERVICE + GANTI CATRIDGE 1 SET', 610000.00, '-', 1, 3, '2021-03-01 08:09:21'),
('SER01032100001', 5, 'PRINTER', 'CANON MX537', 'ERROR 5B02 (TIDAK BISA RESET)', '-', 'SERVICE + GANTI CATRIDGE HITAM + GANTI MOBO', 580000.00, '-', 1, 3, '2021-03-01 08:10:48'),
('SER01032100001', 6, 'PRINTER', 'CANON MX426', 'CATRIDGE HITAM CACAT, CATRIDGE WARNA KURANG BAGUS', '-', 'SERVICE + GANTI CATRIDGE 1 SET', 550000.00, '-', 1, 3, '2021-03-01 08:13:00'),
('SER01032100002', 1, 'LAPTOP', 'ACER', 'INSTAL ULANG', 'TAS', '-', 75000.00, '-', 1, 3, '2021-03-01 11:11:40'),
('SER01032100003', 1, 'PRINTER', 'CANON E400', 'TINTA TIDAK KELUAR', '-', '-', 0.00, '-', 1, 3, '2021-03-01 14:53:14'),
('SER01052100001', 1, 'LAPTOP', 'ACER E5-411', 'MATI MENDADAK', 'CHARGER', 'GANTI KEYBOARD', 350000.00, '3 BULAN', 1, 3, '2021-05-01 10:59:08'),
('SER01052100001', 2, 'PRINTER', 'CANON IP2770', 'KERTAS MENARIK SENDIRI', '-', 'SENSOR KERTAS', 150000.00, '-', 1, 3, '2021-05-01 10:59:52'),
('SER01052100001', 3, 'KOMPUTER', 'PC AIO', 'WINDOWS ERROR', 'PC AIO', 'INSTALL ULANG WINDOWS + APLIKASI + JASA ANTAR', 100000.00, '1 BULAN', 1, 3, '2021-05-01 11:06:26'),
('SER01052100002', 1, 'LAPTOP', 'ASUS E202S', 'STUCK', '-', 'INSTAL ULANG', 75000.00, '-', 1, 3, '2021-05-01 14:02:02'),
('SER01052100002', 2, 'LAPTOP', 'ASUS', 'WIFI', 'CHARGER', '-', 0.00, '-', 1, 3, '2021-05-01 14:03:31'),
('SER02022100002', 1, 'PRINTER', 'EPSON L310', 'TIDAK BISA PRINT', 'PRINTER', 'RESET + MAINTENANCE + ONGKOS BONGKAR', 100000.00, '-', 1, 3, '2021-02-02 15:37:28'),
('SER02032100001', 1, 'LAPTOP', 'ASES', 'MATI TOTAL', 'TAS DAN CHARGER', '-', 0.00, '-', 1, 3, '2021-03-02 09:37:50'),
('SER02042100001', 3, 'LAPTOP', 'LENOVO', 'KEYBOARD ', '-', 'GANTI KEYBOARD', 0.00, '0', 1, 3, '2021-04-02 16:27:22'),
('SER03022100001', 1, 'LAPTOP', 'ASUS N43S', 'PANAS + TIDAK BISA MASUK OS', 'LAPTOP', 'INSTAL ULANG + MAINTENANCE + GANTI HARDISK SEAGATE 500 GB BARU', 750000.00, 'HARDISK 3 BULAN', 1, 3, '2021-02-03 07:57:02'),
('SER03022100002', 1, 'PRINTER', 'IP2770', 'GANTI CATRIDE', '-', 'CATRIDE HITAM 810', 250000.00, '1 BULAN', 1, 3, '2021-02-03 08:19:21'),
('SER03022100003', 1, 'LAPTOP', 'ASUS X200NAH', 'KEYBOARD EROR', 'CHARGER', 'GANTI KEYBOARD', 350000.00, '3 BULAN', 1, 3, '2021-02-03 11:23:15'),
('SER03022100004', 1, 'LAPTOP', 'ASUS A456U', 'INSTAL ULANG', 'CHARGER', 'INSTAL ULANG', 75000.00, '-', 1, 3, '2021-02-03 11:47:53'),
('SER03032100001', 1, 'PRINTER', 'CANON', 'TIDAK BISA NGEPRINT', '-', '-', 0.00, '-', 1, 3, '2021-03-03 10:48:46'),
('SER03032100001', 2, 'KOMPUTER', '-', 'LELET', '-', '-', 0.00, '-', 1, 3, '2021-03-03 10:50:06'),
('SER03032100002', 1, 'KOMPUTER', 'LENOVO', 'MATI TOTAL', '-', '-', 0.00, '-', 1, 3, '2021-03-03 16:31:03'),
('SER03042100001', 1, 'LAPTOP', 'AVITA', 'TIDAK KONEK KEYBOARD', 'CHARGER', '-', 0.00, '-', 1, 3, '2021-04-03 15:06:44'),
('SER03052100001', 1, 'PRINTER', 'EPSON L3110', 'CEKET PAS PRINT ', '-', '-', 380000.00, '-', 1, 3, '2021-05-03 08:45:05'),
('SER03052100001', 2, 'LAPTOP', 'ASUS', 'TIDAK BISA HIDUP', 'CHARGER', '-', 0.00, '-', 1, 3, '2021-05-03 08:45:39'),
('SER03052100002', 2, 'LAPTOP', 'LENOVO G40', 'ENTER TIDAK BISA DAN CURSOR TIDAK BISA', 'CHARGER DAN TAS', 'GANTI KEYBOARD', 350000.00, '3 BULAN', 1, 3, '2021-05-03 12:59:53'),
('SER04032100001', 1, 'LAPTOP', 'ASUS', 'INSTAL MS.WORD 2016', 'CHARGER', '-', 0.00, '-', 1, 3, '2021-03-04 12:18:19'),
('SER04032100002', 1, 'LAPTOP', 'ASUS', 'PASANG SPEAKER', '-', '-', 50000.00, '-', 1, 3, '2021-03-04 13:27:34'),
('SER05022100001', 1, 'LAINNYA', 'PROYEKTOR TOSHIBA', 'BOHLAM DAN POWER', 'TAS', '-', 0.00, '-', 1, 3, '2021-02-05 15:25:00'),
('SER05022100003', 1, 'KOMPUTER', 'PC', 'INSTAL APLIKASI', 'KABEL VGA DAN POWER', '-', 20000.00, '-', 1, 3, '2021-02-05 16:49:07'),
('SER05022100004', 1, 'LAPTOP', 'ACER ASPIRE 314', 'AKTIVASI OFFICE DAN FULL CEK LAPTOP', '-', 'AKTIVASI WINDOWS DAN AKTIVASI OFFICE', 20000.00, '-', 1, 3, '2021-02-05 16:56:30'),
('SER05032100001', 1, 'PRINTER', 'EPSON', 'TINTA TIDAK KELUAR', 'KABEL', '-', 0.00, '-', 1, 3, '2021-03-05 08:35:01'),
('SER05042100001', 1, 'LAPTOP', 'MSI', 'ENGSEL DAN SSD KADANG TIDAK TERBACA', 'CHARGER', '-', 0.00, '-', 1, 3, '2021-04-05 12:48:48'),
('SER05052100001', 1, 'LAPTOP', 'ACER 4349', 'TIDAK MAU HIDUP', 'TAS DAN CHARGER', '-', 0.00, '-', 1, 3, '2021-05-05 08:26:57'),
('SER05052100002', 1, 'PRINTER', 'MP237', 'SENSOR KERTAS', '-', 'GANTI SENSOR KERTAS', 200000.00, '-', 1, 3, '2021-05-05 08:33:01'),
('SER06032100001', 1, 'PRINTER', 'L360', 'BAU DAN LAMPU INDIKATOR MENYALA', 'KABEL', 'GANTI SCANNER', 700000.00, '-', 1, 3, '2021-03-06 16:38:44'),
('SER06042100002', 1, 'PRINTER', 'KYOCERA', 'DEVOL UNIT KYOCERA ORIGINAL', '-', 'HASIL CETAK TIDAK KELUAR', 2400000.00, '6 BULAN', 1, 3, '2021-04-06 09:09:37'),
('SER06042100002', 2, 'PRINTER', 'KYOCERA', '-', '-', 'JASA SERVIS', 100000.00, '-', 1, 3, '2021-04-06 09:10:17'),
('SER06042100003', 2, 'PRINTER', 'PRINTER BROTHER DCP-T710W MFC-T810W MFC-T910DW', 'CETAK HITAM TIDAK BAGUS', '-', 'HEAD UNIT,', 2400000.00, '6 BULAN', 1, 3, '2021-04-06 09:14:33'),
('SER06042100003', 3, 'PRINTER', '-', '-', '-', 'JASA SERVIS', 100000.00, '-', 1, 3, '2021-04-06 09:15:09'),
('SER06042100004', 1, 'LAPTOP', 'ACER', 'WIFI TIDAK BISA', 'TAS DAN CHARGER', 'WIFI CARD', 50000.00, '-', 1, 3, '2021-04-06 17:54:09'),
('SER06052100001', 1, 'LAPTOP', 'ASUS ', 'SUSAH CHARGER DAN LAYAR TERBAGI DUA DAN INSTAL ULANG\r\n\r\n', 'TAS', '-', 0.00, '-', 1, 3, '2021-05-06 09:56:03'),
('SER06052100002', 2, 'KOMPUTER', 'ALL IN ONE ASUS', 'LELET ', 'CHARGER', 'INSTAL ULANG', 75000.00, '-', 2, 3, '2021-05-06 11:25:41'),
('SER06052100002', 3, 'PRINTER', 'L6190', 'MATI TOTAL', '-', '-', 0.00, '-', 1, 3, '2021-05-06 11:27:08'),
('SER06052100002', 4, 'PRINTER', 'EPSON L555', 'KERTAS MACET MIRING', '-', '-', 0.00, '-', 1, 3, '2021-05-08 11:02:40'),
('SER07042100001', 1, 'PRINTER', 'CANON MP287', 'TIDAK BISA NGEPRINT', 'KABEL DAN KOTAK', '-', 500000.00, '-', 1, 3, '2021-04-07 13:35:49'),
('SER07052100001', 1, 'LAPTOP', 'ASUS ', 'INSTAL ULANG', 'CHARGER ', '-', 50000.00, '-', 1, 3, '2021-05-07 10:18:25'),
('SER07052100002', 2, 'LAPTOP', 'HP', 'CHARGER LONGGAR', 'CHARGER', 'GANTI CHARGER ORIGINAL', 250000.00, '-', 1, 3, '2021-05-07 10:22:34'),
('SER08032100001', 1, 'LAPTOP', 'AXIOO', 'INSTAL ULANG WIN7', '-', 'INSTAL ULANG + ENGSEL + TP LINK 150MBPS', 250000.00, '-', 1, 3, '2021-03-08 09:16:49'),
('SER08032100002', 1, 'LAPTOP', 'LENOVO', 'INSTAL ULANG', 'CHARGER', '-', 0.00, '-', 1, 3, '2021-03-08 10:04:09'),
('SER08032100003', 2, 'LAPTOP', 'HP', 'INSTAL ULANG', '-', 'INSTAL ULANG', 75000.00, '-', 1, 3, '2021-03-08 12:19:38'),
('SER08052100001', 1, 'PRINTER', 'CANON MX377', 'ERROR 5100', '-', 'SERVICE PRINTER CANON MX377', 250000.00, '-', 1, 3, '2021-05-08 10:31:24'),
('SER08052100001', 2, 'PRINTER', 'CANON MP287', 'ERROR 5100', '-', 'SERVICE PRINTER CANON MP287', 250000.00, '-', 1, 3, '2021-05-08 10:31:41'),
('SER08052100002', 1, 'LAPTOP', 'ASUS X441N', 'LELET', 'CHARGER', 'GANTI HARDISK 500 GB', 650000.00, '3 BULAN', 1, 3, '2021-05-08 11:08:55'),
('SER08052100003', 1, 'LAPTOP', 'ASUS X455L', 'CUMA MAU DIINSTAL AJA', 'TAS DAN CHARGER', 'INSTAL ULANG', 75000.00, '-', 1, 3, '2021-05-08 16:17:09'),
('SER09032100001', 1, 'LAPTOP', 'MSI', 'INSTAL ULANG', 'CHARGER', '-', 75000.00, '-', 1, 3, '2021-03-09 09:36:01'),
('SER09032100002', 1, 'LAPTOP', 'ACER', 'INSTAL ULANG DAN WIFI TIDAK BISA CONECT OTOMATIS.', 'TAS DAN CHARGER', '-', 0.00, '-', 1, 3, '2021-03-09 09:41:52'),
('SER09032100003', 1, 'LAPTOP', 'ACER', 'CEK HARDDISK', '-', 'GANTI HDD WD 1 TB', 900000.00, '6 BULAN', 1, 3, '2021-03-09 13:37:30'),
('SER09032100003', 2, 'LAPTOP', 'ACER', 'INSTAL ULANG', '-', '-', 50000.00, '-', 1, 3, '2021-03-15 08:16:04'),
('SER09042100001', 1, 'LAPTOP', 'ASUS X454Y', 'TOUCHPAD', 'LAPTOP', 'INSTAL ULANG', 75000.00, '0', 1, 3, '2021-04-09 10:32:52'),
('SER09042100002', 1, 'LAPTOP', 'MSI', 'KESING LAPTOP', '-', 'KESING LAPTOP MSI GL638 RC', 800000.00, '-', 1, 3, '2021-04-09 14:21:39'),
('SER10032100001', 1, 'LAPTOP', 'TOSHIBA', 'BLUE SCREEN + INSTAL ULANG', 'CHARGER', 'INSTAL ULANG + MAINTENANCE', 140000.00, '-', 1, 3, '2021-03-10 19:57:24'),
('SER10042100001', 1, 'LAPTOP', 'LENOVO', 'KEYBOARD ERROR', 'CHARGER', '-', 0.00, '-', 1, 3, '2021-04-10 13:25:25'),
('SER10052100001', 1, 'LAPTOP', 'LENOVO ', 'CEKET', 'TAS DAN CHARGER', 'INSTAL ULANG = GRAMMARLY FOR MICROSOFT, SPSS, MENDELEY', 75000.00, '-', 1, 3, '2021-05-10 15:27:48'),
('SER11032100001', 1, 'LAPTOP', 'asus x441m', 'lelet', '-', 'INSTAL ULANG + Standar', 75000.00, '-', 1, 3, '2021-03-11 10:43:09'),
('SER11032100002', 1, 'LAPTOP', 'HP', 'XAMPP ERROR', 'TAS DAN CHARGER', 'INSTAL ULANG', 50000.00, '-', 1, 3, '2021-03-11 13:53:34'),
('SER11052100001', 1, 'KOMPUTER', 'ALL IN OEN HP', 'INSTAL ULANG', '-', 'INSTAL ULANG', 50000.00, '-', 1, 3, '2021-05-11 09:22:23'),
('SER11052100002', 1, 'PRINTER', 'MP287', 'PRINT WARNA HITAM JADI BIRU + CEK FOTOCOPY', 'KABEL DAN PERLENGKAPAN', '-', 0.00, '-', 1, 3, '2021-05-11 09:26:49'),
('SER12032100001', 1, 'LAPTOP', 'HP', 'INSTAL ULANG', '-', '-', 0.00, '-', 1, 3, '2021-03-12 07:59:04'),
('SER12032100002', 1, 'LAPTOP', 'ASUS A455L', 'KEYBOARD DAN INSTAL ULANG', 'TAS DAN CHARGER', 'INSTAL ULANG DAN MAINTENANCE KEYBOARD', 50000.00, '-', 1, 3, '2021-03-12 12:44:31'),
('SER13022100001', 1, 'LAPTOP', 'ASUS A451L', 'SPEAKER PECAH', 'LAPTOP', 'GANTI SPEAKER', 0.00, '-', 1, 3, '2021-02-13 10:47:32'),
('SER13022100002', 1, 'PRINTER', 'CANON MP237', 'ERROR 5B00', 'PRINTER DAN KABEL', 'CATRIDGE 810 TIDAK BAGUS', 270000.00, '-', 1, 3, '2021-02-13 10:49:00'),
('SER13022100003', 1, 'PRINTER', 'CANON MX328', 'CATRIDGE HITAM JELEK', 'PRINTER DAN KABEL', 'CATRIDGE HITAM DAN WARNA\r\n(GANTI HITAM SAJA)', 270000.00, '-', 1, 3, '2021-02-13 10:51:26'),
('SER14042100001', 1, 'LAPTOP', 'ASUS A455L', 'INSTAL ULANG', 'CHARGER', 'INSTAL ULANG', 0.00, '-', 1, 3, '2021-04-14 10:07:51'),
('SER14042100002', 1, 'LAPTOP', 'ASUS FX553V', 'MATI MENDADAK', 'CHARGER', '-', 1000000.00, '-', 1, 3, '2021-04-14 11:13:49'),
('SER14042100002', 2, 'PRINTER', 'CANON MP287', 'ERROR 5100', '-', 'MEMPERBAIKI INFUS', 100000.00, '-', 1, 3, '2021-04-23 08:24:47'),
('SER14042100002', 3, 'PRINTER', 'CANON MX377', 'ERROR 5100', '-', 'MEMPERBIAKI INFUS', 100000.00, '-', 1, 3, '2021-04-23 08:25:58'),
('SER14042100002', 6, 'LAPTOP', 'DELL', 'LCD ', 'CHARGER', 'LCD DAN BIOS', 1500000.00, '-', 1, 3, '2021-04-29 16:30:59'),
('SER14042100002', 7, 'PRINTER', 'Brother MFC-5890CN', 'hasil cetak tidak bagus', 'PRINTER', 'HEAD PRINT', 3500000.00, '3 BULAN', 1, 3, '2021-04-30 18:35:33'),
('SER14042100003', 1, 'LAPTOP', 'ASUS FX553V', 'MATI MENDADAK', 'CHARGER', '-', 0.00, '-', 1, 3, '2021-04-14 11:15:25'),
('SER15022100001', 2, 'LAPTOP', 'ASUS', 'INSTAL ULANG', 'TAS', 'INSTAL ULANG', 50000.00, '-', 1, 3, '2021-02-15 17:33:21'),
('SER15022100002', 1, 'PRINTER', 'MX537', 'FULL CEK', 'PRINTER', 'GANTI CATRIDGE WARNA ', 330000.00, '-', 1, 3, '2021-02-15 17:38:59'),
('SER15022100002', 2, 'PRINTER', 'MX537', 'FULL CEK', 'PRINTER', 'GANTI INFUS', 200000.00, '-', 1, 3, '2021-02-15 17:39:14'),
('SER15022100003', 1, 'PRINTER', 'MX537', 'INFUS TURUN', 'PRINTER', 'GANTI INFUS', 200000.00, '-', 1, 3, '2021-02-15 17:40:50'),
('SER15032100001', 2, 'LAPTOP', 'ACER ASPIRE E1-432 ORIGINAL', '-', 'CHARGER', 'GANTI MOTHERBOARD', 1600000.00, '6 BULAN', 1, 3, '2021-03-15 08:25:47'),
('SER15032100002', 2, 'PRINTER', 'CANON MP287', '-', '-', 'GANTI CATDRIGDE HITAM 810', 350000.00, '-', 1, 3, '2021-03-15 12:01:51'),
('SER15032100002', 3, 'PRINTER', 'MX377', '-', '-', 'GANTI CATDRIGDE WARNA 741', 400000.00, '-', 1, 3, '2021-03-15 12:03:08'),
('SER15032100002', 4, 'PRINTER', 'MX377', '-', '-', 'GANTI INFUS', 250000.00, '-', 1, 3, '2021-03-15 12:04:04'),
('SER15032100002', 5, 'PRINTER', 'MP237', '-', '-', 'GANTI CATRIDGE HITAM 810 ORI', 350000.00, '-', 1, 3, '2021-03-15 12:05:05'),
('SER15032100002', 6, 'PRINTER', 'KABEL SECOND PC KE PRINTER', '-', '-', '-', 25000.00, '-', 1, 3, '2021-03-15 12:12:28'),
('SER15032100002', 9, 'LAPTOP', 'CANON IP110', '-', '-', 'MAINTENANCE DAN ISI ULANG CATRIDGE', 180000.00, '-', 1, 3, '2021-03-15 13:27:45'),
('SER15032100003', 1, 'KOMPUTER', '-', '-', '-', 'MAINTENANCE', 125000.00, '-', 1, 3, '2021-03-15 13:30:28'),
('SER15032100003', 4, 'LAPTOP', 'SSD ADATA 240 GB', '-', '-', '-', 800000.00, '-', 2, 3, '2021-03-15 13:35:34'),
('SER15032100003', 6, 'KOMPUTER', 'AIO LENOVO', '-', '-', 'MAINTENANCE', 125000.00, '-', 1, 3, '2021-03-15 13:36:35'),
('SER15032100004', 1, 'LAPTOP', 'ASUS VIVOBOOK', 'INSTAL ULANG DAN DOKUMEN TIDAK BISA TERBACA', 'CHARGER', '-', 0.00, '-', 1, 3, '2021-03-15 14:56:28'),
('SER15032100005', 1, 'LAPTOP', 'ALIENWARE', 'MATI TOTAL', 'CHARGER', '-', 0.00, '-', 1, 3, '2021-03-15 15:26:15'),
('SER15032100006', 1, 'LAPTOP', 'ASUS VIVOBOOK', 'INSTAL ULANG DAN DOKUMEN TIDAK BISA TERBACA', 'CHARGER', '-', 75000.00, '-', 1, 3, '2021-03-15 17:31:45'),
('SER16042100001', 1, 'LAPTOP', 'ASUS X441M', 'BLACK SCREEN + UPDATE', 'TAS', 'INSTAL ULANG', 75000.00, '-', 1, 3, '2021-04-16 15:30:25'),
('SER17022100001', 1, 'LAPTOP', 'ASUS X453', 'INSTAL APLIKASI', '-', 'INSTAL SPSS, OFFICE, EVIEWS', 0.00, '-', 1, 3, '2021-02-17 12:24:21'),
('SER17032100001', 1, 'LAPTOP', 'ASUS', '-', '-', 'INSTAL AVAST', 0.00, '-', 1, 3, '2021-03-17 07:59:18'),
('SER17032100003', 1, 'KOMPUTER', '-', 'INSTAL ULANG ', '-', '-', 100000.00, '-', 1, 3, '2021-03-17 09:49:58'),
('SER17032100005', 1, 'KOMPUTER', 'ASUS', 'INSTAL ULANG ', '-', '-', 75000.00, '-', 2, 3, '2021-03-17 11:34:45'),
('SER17032100006', 1, 'LAPTOP', 'LENOVO', 'INSTAL ULANG', 'CHARGER', '-', 75000.00, '-', 1, 3, '2021-03-17 12:19:25'),
('SER17032100007', 1, 'LAPTOP', 'ASUS', 'LELET', 'CHARGER', 'INSTAL ULANG + AUTOCAD 2019', 75000.00, '-', 1, 3, '2021-03-17 17:25:39'),
('SER17032100008', 1, 'PRINTER', 'CANON IP2770', 'MAINTENANCE', '-', '-', 30000.00, '-', 1, 3, '2021-03-17 18:24:20'),
('SER18022100001', 2, 'LAPTOP', 'ASUS', 'lelet', 'TAS', '', 0.00, '-', 1, 3, '2021-02-18 12:00:10'),
('SER18022100002', 1, 'LAPTOP', 'ASUS', '', '-', 'engsel', 0.00, '-', 1, 3, '2021-02-18 15:11:37'),
('SER18022100003', 1, 'PRINTER', 'CANON MP287', '-', '-', 'GANTI CATRIDGE HITAM 810 ORIGINAL BARU', 324000.00, '-', 1, 3, '2021-02-18 16:25:16'),
('SER18022100003', 2, 'PRINTER', 'CANON MX377', '-', '-', 'GANTI CSTRIDGE WARNA 741 ORI = Rp. 330.000 + GANTI INFUS = Rp. 200.000', 530000.00, '-', 1, 3, '2021-02-18 16:27:24'),
('SER18022100003', 3, 'PRINTER', 'CANON IP110', '-', '-', 'MAITENANCE + ISI ULANG CATRIDGE', 180000.00, '-', 1, 3, '2021-02-18 16:30:20'),
('SER18022100003', 4, 'PRINTER', 'CANON MP237', '-', '-', 'GANTI CSTRIDGE HITAM 810 ORI BARU', 324000.00, '-', 1, 3, '2021-02-18 16:31:12'),
('SER18022100003', 5, 'KOMPUTER', '-', 'MATI TOTAL', '-', 'MAINTENACE', 120000.00, '-', 1, 3, '2021-02-18 16:33:35'),
('SER18022100003', 6, 'LAINNYA', 'SSD 240', '-', '-', 'PEMBELIAN SPAREPART SSD ADATA 240 GB', 780000.00, '-', 1, 3, '2021-02-18 16:36:18'),
('SER18022100003', 7, 'PRINTER', 'BROTHER MFC-J3720', 'TINTA TIDAK KELUAR', '-', '-', 0.00, '-', 1, 3, '2021-03-11 15:30:42'),
('SER18022100003', 8, 'KOMPUTER', 'AIO LENOVO', 'KEYBOARD DAM MOUSE TIDAK DETECT', 'KEYBOARD DAN MOUSE', 'MAINTENANCE', 60000.00, '-', 1, 3, '2021-03-11 15:36:27'),
('SER18022100003', 9, 'LAINNYA', 'KABEL PC KE PRINTER', '-', '-', 'PEMBELIAN KABEL PC KE PRINTER SECOND', 12000.00, '-', 1, 3, '2021-03-11 15:38:33'),
('SER18022100004', 1, 'PRINTER', 'MX497', 'CATRIDGE HITAM DAN WARNA BERGARIS', '-', 'MAINTENANCE\r\n\r\n', 250000.00, '-', 1, 3, '2021-02-18 16:40:26'),
('SER18022100004', 2, 'PRINTER', 'IP2770', 'CATRIDGE HITAM DAN WARNA BERGARIS', '-', 'MAINTENANCE\r\n\r\n', 250000.00, '-', 1, 3, '2021-02-18 16:41:06'),
('SER18022100004', 3, 'PRINTER', 'MP237', 'CATRIDGE HITAM DAN WARNA TIDAK BAGUS', '-', 'GANTI CATRIDGE SEPASANG + SERVICE\r\n\r\n', 670000.00, '-', 1, 3, '2021-02-18 16:43:13'),
('SER18022100004', 4, 'PRINTER', 'MX537', 'CATRIDGE HITAM DAN WARNA BERGARIS', '-', 'MAINTENANCE\r\n\r\n', 200000.00, '-', 1, 3, '2021-02-18 16:44:01'),
('SER18022100004', 5, 'KOMPUTER', 'PC', '-', '-', 'INSTAL ULANG \r\n\r\n', 100000.00, '-', 1, 3, '2021-02-18 16:44:45'),
('SER18022100004', 6, 'PRINTER', 'MX497', 'CETAK WARNA TIDAK KELUAR', '', 'CATRIDGE 746  + SERVICE\r\n', 500000.00, '-', 1, 3, '2021-02-18 16:45:43'),
('SER18022100004', 7, 'PRINTER', 'MX537', 'KERTAS TIDAK NARIK', '-', 'GANTI ROLLER DAN PERUMAHAN CATRIDE', 600000.00, '-', 1, 3, '2021-02-18 16:46:26'),
('SER18022100004', 8, 'PRINTER', 'MX237', 'HASIL CETAK TIDAK KELUAR', '-', 'CATRIDGE 810 - 811\r\n\r\n', 600000.00, '-', 1, 3, '2021-02-18 16:47:55'),
('SER18022100004', 9, 'PRINTER', 'MX397', 'HASIL CETAK TIDAK KELUAR', '-', 'MAINTENANCE + SERVICE\r\n', 300000.00, '-', 1, 3, '2021-02-18 16:49:09'),
('SER18022100004', 10, 'LAPTOP', 'LENOVO', 'BATERAI BOCOR', '-', 'INSTAL ULANG DAN GANTI BATERAI ORIGINAL\r\n', 650000.00, '3 BULAN', 1, 3, '2021-02-18 16:49:59'),
('SER18022100004', 11, 'KOMPUTER', 'PC COMPAQ', 'HARDISK 1% DAN TIDAK TERBACA OS', 'PC 1 UNIT', 'INSTAL ULANG + MAINTENANCE', 150000.00, '-', 1, 3, '2021-03-01 01:58:25'),
('SER18022100004', 12, 'PRINTER', 'CANON MX497', 'CATRIDGE HITAM TIDAK BAGUS', '-', 'GANTI CATRIGDE 745  + SERVICE', 500000.00, '-', 1, 3, '2021-03-12 18:40:26'),
('SER18022100004', 13, 'PRINTER', 'CANON MP258', 'CATRIDGE HITAM TIDAK BAGUS', '-', 'GANTI CATRIGDE 810', 250000.00, '-', 1, 3, '2021-03-12 18:42:04'),
('SER18022100004', 14, 'PRINTER', 'CANON MP258', 'CATRIDGE WARNA TIDAK BAGUS', '-', 'GANTI CATRIGDE 811 + SERVICE', 480000.00, '-', 1, 3, '2021-03-12 18:43:35'),
('SER18032100001', 1, 'PRINTER', 'CANON IP2770', 'GANTI CATRIDGE WARNA', 'KABEL', 'GANTI CATRIDGE WARNA', 270000.00, '-', 1, 3, '2021-03-18 07:58:47'),
('SER18032100002', 1, 'KOMPUTER', 'HP', 'LELET', 'KABEL POWER', 'INSTAL ULANG', 50000.00, '-', 1, 3, '2021-03-18 13:41:47'),
('SER19022100001', 1, 'LAPTOP', 'ACER', 'MATI TOTAL', '-', 'GANTI RAM DDR 3 4GB\r\n\r\n', 500000.00, '1 BULAN', 1, 3, '2021-02-19 09:31:30'),
('SER19022100003', 1, 'KOMPUTER', '-', 'MATI TOTAL', '-', '-', 0.00, '-', 1, 3, '2021-02-19 11:35:13'),
('SER19032100002', 1, 'LAPTOP', 'DELL', 'LCD ERROR', 'CHARGER', '-', 0.00, '-', 1, 3, '2021-03-19 16:11:23'),
('SER20042100001', 1, 'LAPTOP', 'ACER', 'LAYAR TIDAK MENYALA', 'CHARGER', '-', 0.00, '-', 1, 3, '2021-04-20 16:47:25'),
('SER21042100001', 1, 'LAPTOP', 'HP', 'UCE POWER', 'TAS DAN CHARGER', '-', 0.00, '-', 1, 3, '2021-04-21 13:21:45'),
('SER21042100001', 2, 'LAPTOP', 'ASUS', 'LCD', '-', '-', 0.00, '-', 1, 3, '2021-04-21 13:22:21'),
('SER21042100002', 1, 'LAPTOP', 'ASUS', 'TOMBOL POWER ERROR', 'CHARGER', 'INSTAL ULANG', 75000.00, '-', 1, 3, '2021-04-21 15:30:16'),
('SER21042100003', 1, 'LAPTOP', 'ASUS', 'INSTAL ULANG', '-', '-', 0.00, '-', 1, 3, '2021-04-21 15:33:52'),
('SER22022100001', 1, 'LAPTOP', 'ACER', 'TIDAK BISA DI CHARGER', 'CHARGER', '-', 0.00, '-', 1, 3, '2021-02-22 16:15:58'),
('SER22032100001', 1, 'KOMPUTER', 'LENOVO ALL IN ONE', 'TIDAK BISA HIDUP BEEP', 'KOTAK FULL SET TANPA KEYBOARD', '-', 0.00, '-', 1, 3, '2021-03-22 12:33:58'),
('SER22042100001', 1, 'PRINTER', 'IP2770', 'ISI TINTA', '-', 'GANTI CATRIDGE SEPASANG, ISI ULANG TINTA', 600000.00, '-', 1, 3, '2021-04-22 12:21:44'),
('SER22042100002', 1, 'LAPTOP', 'TOSHIBA', 'JATUH TIDAK BISA MASUK OS', 'TAS', 'Harddisk Longgar', 20000.00, '-', 1, 3, '2021-04-22 16:49:49'),
('SER23022100001', 1, 'LAPTOP', 'ASUS', 'INSTAL APLIKASI SPSS DAN ZOOM', 'CHARGER', '-', 20000.00, '-', 1, 3, '2021-02-23 11:16:42'),
('SER23022100002', 1, 'LAPTOP', 'ASUS', 'INSTAL ULANG', 'TAS DAN CHARGER', '-', 75000.00, '-', 1, 3, '2021-02-23 12:09:08'),
('SER23032100002', 1, 'LAPTOP', 'ASUS', 'SPEAKER ERROR', '-', '-', 0.00, '-', 1, 3, '2021-03-23 16:07:05'),
('SER23042100001', 1, 'LAPTOP', 'ACER', 'LCD ERROR', 'CHARGER', '-', 0.00, '-', 1, 3, '2021-04-23 10:50:52'),
('SER24022100001', 1, 'PRINTER', 'IP2770', 'GANTI CATRIDGE WARNA', 'KOTAK DAN KABEL', 'GANTI CATRIDGE', 270000.00, '-', 1, 3, '2021-02-24 13:08:55'),
('SER24022100002', 1, 'LAPTOP', 'MSI', 'INSTAL APLIKASI', 'CHARGER', 'INSTAL APLIKASI', 50000.00, '-', 1, 3, '2021-02-24 14:16:41'),
('SER24022100003', 1, 'LAPTOP', 'ACER', 'CEPAT PANAS', 'CHARGER', '-', 100000.00, '-', 1, 3, '2021-02-24 16:34:44'),
('SER24032100001', 1, 'LAPTOP', 'HP ', 'WIFI SILANG', 'TAS DAN CHARGER', '-', 75000.00, '-', 1, 3, '2021-03-24 10:31:19'),
('SER24042100001', 2, 'LAPTOP', 'ASUS', 'INSTAL AUTOCAD 2007', 'CHARGER', '-', 20000.00, '-', 1, 3, '2021-04-24 09:55:48'),
('SER25022100002', 1, 'LAPTOP', 'ADVAN', 'SPASI DAN INSTAL ULANG', 'CHARGER', '-', 75000.00, '-', 1, 3, '2021-02-25 09:08:35'),
('SER25032100001', 1, 'KOMPUTER', 'ALL IN ONE LENOVO', 'LOADING LAMA', 'CHARGER', 'INSTAL ULANG', 100000.00, '-', 1, 3, '2021-03-25 18:14:51'),
('SER25042100001', 1, 'LAPTOP', 'COMPAQ PRESARIO CQ40', 'LCD BERGARIS / BERGETAR', 'LAPTOP + CHARGER', 'GANTI LCD', 700000.00, '1 BULAN', 1, 3, '2021-04-25 20:16:16'),
('SER26042100001', 1, 'LAPTOP', 'TOSHIBA', '-', 'CHARGER', '-', 850000.00, '1 BULAN', 1, 3, '2021-04-26 13:49:32'),
('SER27022100001', 1, 'LAPTOP', 'TOSHIBA', 'KEYBOARD NGETIK SENDIRI', 'CHARGER', 'GANTI KEYBOARD\r\n', 350000.00, '-', 1, 3, '2021-02-27 11:19:31'),
('SER27022100002', 1, 'LAPTOP', 'MACBOOK PRO', 'GANTI HARDDISK DAN INSTAL ULANG WIN10', 'CHARGER', '-', 700000.00, '-', 1, 3, '2021-02-27 13:57:26'),
('SER27032100001', 1, 'LAPTOP', 'ASUS X4157', 'PEMASANGAN SSD DAN RAM', 'LAPTOP', 'INSTALL SKECTHUP, SWEET 3D HOME, IDM, PHOTOSHOP CS 6', 20000.00, '-', 1, 3, '2021-03-27 14:43:43'),
('SER27042100001', 1, 'LAPTOP', 'TOSHIBA', 'Black Screen + Layar Tidak Nyala', 'TAS DAN CHARGER', '-', 0.00, '-', 1, 3, '2021-04-27 11:44:09'),
('SER28022100001', 1, 'PRINTER', 'CANON ', 'TINTA TIDAK KELUAR', 'KABEL', 'GANTI CATRIDGE WARNA 811', 270000.00, '-', 1, 3, '2021-02-28 13:38:06'),
('SER28042100001', 1, 'LAPTOP', 'ASUS', 'INSTAL ULANG ', 'CHARGER', '-', 75000.00, '-', 1, 3, '2021-04-28 10:03:21'),
('SER29032100001', 3, 'LAPTOP', 'ACER', 'INSTAL ULANG + INSTAL DRIVER', '-', 'INSTAL ULANG + INSTAL DRIVER', 150000.00, '-', 1, 3, '2021-03-29 11:38:59'),
('SER29032100002', 1, 'LAPTOP', 'HP', 'SLOW RESPON', 'CHARGER', '-', 0.00, '-', 1, 3, '2021-03-29 15:56:35'),
('SER29042100001', 1, 'PRINTER', 'IP2770', 'KERTAS TIDAK MENARIK', '- ', 'SENSOR KERTAS', 250000.00, '-', 1, 3, '2021-04-29 16:21:50'),
('SER29042100001', 2, 'PRINTER', 'EPSON L5190', 'TIDAK BISA PRINT', '- ', 'RESET + MAINTENANCE', 100000.00, '-', 1, 3, '2021-04-29 16:22:31'),
('SER29042100001', 3, 'LAPTOP', 'LENOVO IP330', 'KEYBOARD HURUF W LEPAS DAN BEBERAPA TOMBOL ERROR', '- ', 'GANTI KEYBOARD', 350000.00, '-', 1, 3, '2021-04-29 16:23:34'),
('SER29042100001', 4, 'KOMPUTER', '-', 'TIDAK BISA MASUK WINDOWS', '- ', 'MESIN', 0.00, '-', 1, 3, '2021-04-29 16:24:22'),
('SER29042100001', 5, 'LAINNYA', 'MONITOR LG', 'GAMBAR GELAP', '- ', 'MESIN', 0.00, '-', 1, 3, '2021-04-29 16:24:49'),
('SER29042100001', 6, 'LAINNYA', 'MONITOR VIEW SONIC', 'OUT OF RANGE', '- ', 'MESIN', 0.00, '-', 1, 3, '2021-04-29 16:25:03'),
('SER29042100001', 7, 'PRINTER', 'EPSON L3110', '-', '- ', '-\r\n\r\n', 0.00, '-', 1, 3, '2021-04-29 16:25:35'),
('SER29042100001', 8, 'PRINTER', 'MX397', 'ROLLER KERTAS', '- ', 'GANTI MESIN + GANTI CATRIDGE SEPASANG + PASANG INFUS', 1230000.00, '-', 1, 3, '2021-04-29 16:27:10'),
('SER30042100001', 1, 'LAPTOP', 'LENOVO ', 'KEYBOARD ANGKA 5', 'CHARGER\r\n', 'GANTI KEYBOARD ', 350000.00, '3 BULAN', 1, 3, '2021-04-30 16:19:50'),
('SER30042100002', 1, 'LAPTOP', 'ACER', 'KEYBOARD LENGKET', '-', 'GANTI KEYBOARD', 250000.00, '3 BULAN', 1, 3, '2021-04-30 16:25:57');

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
('C003', 'JARINGAN'),
('C004', 'PRINTER'),
('C005', 'LAINNYA');

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
(1, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA27012100003', '2021-01-27 14:44:15'),
(2, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA27012100004', '2021-01-27 14:44:59'),
(3, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA27012100004', '2021-01-27 15:00:10'),
(4, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA27012100003', '2021-01-27 15:00:12'),
(5, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA27012100002', '2021-01-27 15:00:13'),
(6, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA27012100001', '2021-01-27 15:00:14'),
(7, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA27012100001', '2021-01-27 15:06:48'),
(8, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA27012100001', '2021-01-27 15:08:10'),
(9, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA27012100001', '2021-01-27 15:08:52'),
(10, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA27012100001', '2021-01-27 15:09:06'),
(11, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA27012100001', '2021-01-27 15:10:11'),
(12, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA27012100001', '2021-01-27 15:11:09'),
(13, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA04022100001', '2021-02-04 15:53:17'),
(14, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA04022100002', '2021-02-04 15:53:52'),
(15, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA04022100001', '2021-02-04 15:56:09'),
(16, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA19022100001', '2021-02-19 14:28:33'),
(17, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA20022100001', '2021-02-20 12:08:48'),
(18, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA02032100001', '2021-03-02 14:10:18'),
(19, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA03032100001', '2021-03-03 16:49:22'),
(20, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA03032100002', '2021-03-03 16:51:45'),
(21, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA05032100001', '2021-03-05 07:32:26'),
(22, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA05032100001', '2021-03-05 07:38:59'),
(23, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA05032100001', '2021-03-05 14:59:05'),
(24, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA10032100001', '2021-03-10 15:46:57'),
(25, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA16032100001', '2021-03-16 11:52:44'),
(26, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA16032100002', '2021-03-16 11:53:22'),
(27, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA18032100001', '2021-03-18 10:49:24'),
(28, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA18032100002', '2021-03-18 10:54:03'),
(29, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA22032100001', '2021-03-22 08:19:55'),
(30, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA22032100002', '2021-03-22 13:41:13'),
(31, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA22032100002', '2021-03-22 13:57:33'),
(32, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA18032100001', '2021-03-22 13:58:32'),
(33, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA25032100001', '2021-03-25 17:07:28'),
(34, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA26032100001', '2021-03-26 14:04:36'),
(35, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA27032100001', '2021-03-27 15:27:35'),
(36, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA27032100002', '2021-03-27 16:18:34'),
(37, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA02042100001', '2021-04-02 14:16:28'),
(38, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA07042100001', '2021-04-07 10:13:23'),
(39, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA09042100001', '2021-04-09 09:53:39'),
(40, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA16042100001', '2021-04-16 16:32:35'),
(41, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA16042100002', '2021-04-16 16:33:09'),
(42, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA17042100001', '2021-04-17 07:44:58'),
(43, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA19042100001', '2021-04-19 09:11:15'),
(44, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA19042100002', '2021-04-19 09:39:12'),
(45, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA19042100003', '2021-04-19 11:19:44'),
(46, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA19042100004', '2021-04-19 11:33:50'),
(47, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA19042100005', '2021-04-19 11:44:30'),
(48, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA19042100006', '2021-04-19 11:58:33'),
(49, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA19042100007', '2021-04-19 12:07:34'),
(50, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA19042100008', '2021-04-19 12:27:00'),
(51, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA19042100009', '2021-04-19 15:42:17'),
(52, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA19042100010', '2021-04-19 15:48:02'),
(53, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA19042100008', '2021-04-19 15:48:32'),
(54, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA19042100007', '2021-04-19 15:48:35'),
(55, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA19042100006', '2021-04-19 15:48:37'),
(56, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA19042100005', '2021-04-19 15:48:40'),
(57, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA19042100004', '2021-04-19 15:48:42'),
(58, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA19042100003', '2021-04-19 15:48:44'),
(59, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA19042100002', '2021-04-19 15:49:07'),
(60, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA17042100001', '2021-04-19 15:49:11'),
(61, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA19042100001', '2021-04-19 15:49:39'),
(62, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA19042100011', '2021-04-19 15:55:03'),
(63, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA19042100012', '2021-04-19 16:03:50'),
(64, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA19042100013', '2021-04-19 16:14:41'),
(65, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA19042100014', '2021-04-19 16:22:30'),
(66, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA19042100015', '2021-04-19 16:28:13'),
(67, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA23042100001', '2021-04-23 08:37:48'),
(68, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA23042100002', '2021-04-23 08:51:19'),
(69, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA23042100003', '2021-04-23 08:58:06'),
(70, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA23042100004', '2021-04-23 09:04:16'),
(71, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA23042100005', '2021-04-23 09:11:43'),
(72, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA23042100006', '2021-04-23 09:17:19'),
(73, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA27042100001', '2021-04-27 09:31:54'),
(74, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA27042100002', '2021-04-27 09:37:12'),
(75, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA27042100003', '2021-04-27 09:40:38'),
(76, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA27042100004', '2021-04-27 09:46:59'),
(77, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA27042100005', '2021-04-27 10:30:03'),
(78, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA27042100006', '2021-04-27 10:59:54'),
(79, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA29042100001', '2021-04-29 15:49:03'),
(80, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA06052100001', '2021-05-06 12:20:31'),
(81, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA06052100002', '2021-05-06 15:03:28'),
(82, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA06052100003', '2021-05-06 15:05:14'),
(83, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA07052100001', '2021-05-07 16:07:52'),
(84, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA08052100001', '2021-05-08 10:35:56'),
(85, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :CA08052100001', '2021-05-08 13:53:18'),
(86, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA08052100001', '2021-05-08 13:54:43'),
(87, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>CA08052100002', '2021-05-08 14:16:27');

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
('P00001', 'UNIVERSITAS PALANGKA RAYA', '08', 'JALAN YOS SUDARSO'),
('P00002', 'WINATA CONFU', '085245451234', 'JALAN BADAK NO 1'),
('P00003', 'GG PRINTER / SUKAWINATA', '085245451234', 'JALAN B KOETIN'),
('P00005', 'IRFAN ', '089630084992', '-'),
('P00006', 'RICHIE', '0895410535786', 'JALAN PANENGAH'),
('P00007', 'MAS ALFRED', '0', '-'),
('P00008', 'BANG ARDI', '088', '-'),
('P00009', 'BU HENDRA', '081228284664', '-'),
('P00010', 'SIGIT', '0895337892993', '-'),
('P00011', 'ANDREAS', '081352726041', '-'),
('P00012', 'YOHANES', '081219956684', '-'),
('P00013', 'DIO', '085345003691', '-'),
('P00014', 'PAK DODI ARGIS', '08125811655', '-'),
('P00015', 'AA SERVICE AC', '082156256211', '-'),
('P00016', '082256316874', 'REGINA BUKIT KEMINTING', '-'),
('P00017', 'MELISA ASUS', '082154191114', '-'),
('P00018', 'LIANY', '085215984999', '-'),
('P00019', 'RAHMAT', '0811527060', '-'),
('P00020', 'NADIA ASUS', '082250132439', '-'),
('P00021', 'CLINT GEREJA BAPTIS', '081395381410', '-'),
('P00022', 'TERE', '081231525316', '-'),
('P00023', 'MAS ANDRE', '082298791812', '-'),
('P00024', 'CHIKA JPIC', '08981254260', '-'),
('P00025', 'RASYID', '081351991436', '-'),
('P00026', 'IMAM UTOMO', '082251627321', '-'),
('P00027', 'BRIAN', '081348000450', '-'),
('P00028', 'SUKAWINATA GG PRINTER', '085282279255', '-'),
('P00029', 'BU HENNI', '081352850006', '-'),
('P00030', 'RONY', '0895705776632', '-'),
('P00031', 'SAMSURI JOGJA CELL', '085246093293', '-'),
('P00032', 'KA DEVI', '085386580834', '-'),
('P00033', 'BU FIRLY', '085249819917', '-'),
('P00034', 'KA BELLA', '082158103574', '-'),
('P00035', 'DENI MACBOOK', '082256181647', '-'),
('P00036', 'KA NORMA', '081331092595', '-'),
('P00037', 'KA WESSA', '085246304503', '-'),
('P00038', 'MAS SATYA', '085246098789', '-'),
('P00039', 'LILO', '085246091102', '-'),
('P00040', 'KA DESSI', '082353510528', '-'),
('P00041', 'RILO ARSITEK UPR', '082148481467', '-'),
('P00042', 'MAS WILY', '082154654814', '-'),
('P00043', 'I.B.GEDE ASTAWA', '085249126577', '-'),
('P00044', 'David', '6282299778390', '-'),
('P00045', 'P2KLH', '6282151434419', '-'),
('P00046', 'Nandot', '6281251711125', '-'),
('P00047', 'Sandi ', '6281348174490', '-'),
('P00048', 'Reno ', '6282256929306', '-'),
('P00049', 'Aminah ', '6285705453246', '-'),
('P00050', 'Tinten', '6282364470454', '-'),
('P00051', 'Riko', '6281255634097', '-'),
('P00052', 'Yanto', '6281253658140', '-'),
('P00053', 'Agung / Teknik', '6282159502363', '-'),
('P00054', 'Pak Rio', '6281258244788', '-'),
('P00055', 'Pak Ino', '6285246227007', '-'),
('P00056', 'Pak Ino', '6285246227007', '-'),
('P00057', 'Rika', '6282243772083', '-'),
('P00058', 'Kristian', '6281228801335', '-'),
('P00059', 'Herma', '6282272339529', '-'),
('P00060', 'Suyitno', '6281317772645', '-'),
('P00061', 'Lia Anugrahni', '6285386226644', '-'),
('P00062', 'Pak Andri', '6282350346404', '-'),
('P00063', 'Anis', '6282255445333', '-'),
('P00064', 'Ros', '6282358058214', '-'),
('P00065', 'Risma', '6281291789995', '-'),
('P00066', 'Pak Novri', '6285252967382', '-'),
('P00067', 'Suyitno', '6281317772645', '-'),
('P00068', 'Aldo ', '6282251745280', '-'),
('P00069', 'Jen', '6282254261303', '-'),
('P00070', 'Edo   ', '6285251795859', '-'),
('P00071', 'Rey Hezkiel D', '6282251222268', '-'),
('P00072', 'Pak Yorgen', '6285249059743', '-'),
('P00073', 'Joe', '6285753674700', '-'),
('P00074', 'Bendi', '6281354268295', '-'),
('P00075', 'Bu Widia', '6285251511061', '-'),
('P00076', 'Vani', '6285822733113', '-'),
('P00077', 'Kristian', '6285752323144', '-'),
('P00078', 'Pak Gandi', '6285332572253', '-'),
('P00079', 'Pak Herman', '6282139196982', '-'),
('P00080', 'Bp Alit', '6281348738663', '-'),
('P00081', 'Tommy', '6281255552299', '-'),
('P00082', 'Bobi ', '6282252546006', '-'),
('P00083', 'Sony', '6281253169038', '-'),
('P00084', 'Bogapi', '6282154837545', '-'),
('P00085', 'gustafo', '6282191571208', '-'),
('P00086', 'angga', '6285249004513', '-'),
('P00087', 'Bu Ruly', '6281216362120', '-'),
('P00088', 'Rojin', '6285752367750', '-'),
('P00089', 'pak hendra ', '6281258096099', '-'),
('P00090', 'mas fajar', '6282281807952', '-'),
('P00091', 'pak gandra', '6285975101150', '-'),
('P00092', 'pak gandra', '6285975101150', '-'),
('P00093', 'septiana', '6281348273406', '-'),
('P00094', 'bp agus', '6281351884778', '-'),
('P00095', 'ferdinan', '6285391854141', '-'),
('P00096', 'nova ', '6282158158385', '-'),
('P00097', 'pak viktor', '6282154598882', '-'),
('P00098', 'winda', '6287848698050', '-'),
('P00099', 'pak setiawan ', '6281250567112', '-'),
('P00100', 'riana ', '6285246047090', '-'),
('P00101', 'pak dody', '628125811655', '-'),
('P00102', 'tere', '6285390477698', '-'),
('P00103', 'meila', '6282150636344', '-'),
('P00104', 'nike', '6282157632130', '-'),
('P00105', 'mama santy', '6282153602706/6285345545656', '-'),
('P00106', 'devi', '6289694058945', '-'),
('P00107', 'mama justin', '6285348313525', '-'),
('P00108', 'rica', '6282191571071', '-'),
('P00109', 'indriani', '6282157632130', '-'),
('P00110', 'edi', '6282255737579', '-'),
('P00111', 'aldi', '6281257058160', '-'),
('P00112', 'bu eka', '6281349192828', '-'),
('P00113', 'tatan', '6281255446253', '-'),
('P00114', 'kendi', '6282157342658', '-'),
('P00115', 'pak jaya', '6281352748671', '-'),
('P00116', 'pak ferdinan ', '6285391854141', '-'),
('P00117', 'Pak Ino', '6285787285475', '-'),
('P00118', 'pak abed nego', '6285249012294', '-'),
('P00119', 'mba ayu', '6281348338262', '-'),
('P00120', 'pak chandra', '6285975101650', '-'),
('P00121', 'bu uci', '6285346847733', '-'),
('P00122', 'an.ongky', '6282255534261', '-'),
('P00123', 'insan', '6282255118650', '-'),
('P00124', 'bu cica', '6282155629060', 'jl griya rajawali permai no.32 B'),
('P00125', 'bu luna', '6285390335550', '-'),
('P00126', 'MBA AYU', '6281348338262', '-'),
('P00127', 'dodi', '628125811655', '-'),
('P00128', 'clint', '6281395381410', '-'),
('P00130', 'Pak anwar', '6285393661111', '-'),
('P00131', 'rony', '62895705776632', '-'),
('P00132', 'brian', '6281348000450', '-'),
('P00134', 'Muarmar', '6285346660737', '-'),
('P00135', 'Mba ajeng', '6282252968672', '-'),
('P00136', 'Mas shahrui', '6282245123112', '-'),
('P00137', 'Novi', '6285287286556', '-'),
('P00138', 'Roni', '62895705776632', '-'),
('P00139', 'Dodi', '628125811655', '-'),
('P00140', 'Gege', '6282251113225', '-'),
('P00141', 'Gege', '6282251113225', '-'),
('P00142', 'Bela', '6281348359368', '-'),
('P00143', 'Pak hariano', '6282255254302', '-'),
('P00144', 'Gusla', '6289620369483', '-'),
('P00145', 'Bu emita', '6282358077763', '-'),
('P00146', 'Titiek', '6282156256279', '-'),
('P00147', 'Indah', '6282250535349', '-'),
('P00148', 'Gusra', '6289620369483', '-'),
('P00149', 'Wiwit', '6285348043042', '-'),
('P00150', 'Z IMIX', '6289633754990', '-'),
('P00151', 'Jendri', '6282254261303', '-'),
('P00152', 'Bella', '6282158103574', '-'),
('P00153', 'Mba amei', '6289692597945', '-'),
('P00154', 'Kak elsa', '6282255148204', '-'),
('P00155', 'Isai raba', '6281347862965/6281282995778', '-'),
('P00156', 'Kak winda', '628784869850', '-'),
('P00157', 'Pak andy', '6285252856003', '-'),
('P00158', 'SANDI ', '6282256315329', '-'),
('P00159', 'Kak maria', 'V', 'Kak maria'),
('P00160', 'Kak yelisa', '6282250133245', '-'),
('P00161', 'Kak felix', '6282149995377', '-'),
('P00162', 'Pak yeyem', '6285252900667', '-'),
('P00163', 'ko winda', '6281257039903', '-'),
('P00164', 'Mas aldi', '6281349354045/6285248487470', '-'),
('P00165', 'Bu martini', '6285252896622', '-'),
('P00166', 'Mas rafi', '6281255632780', '-'),
('P00167', 'JPIC kalimantan', '6282252981325', '-'),
('P00168', 'Cv mega abadi', '6282139196982', '-'),
('P00169', 'Mas ronal', '6282237580063', '-'),
('P00170', 'Pak paulus', '6282155629069', '-'),
('P00171', 'Kak sentra  ', ' 6285347929376', '-'),
('P00172', 'Swansea', '6281347661057', '-'),
('P00173', 'Mas ade', '6289623732162', '-'),
('P00174', 'Asmawi', '6289692088772-', '-'),
('P00175', 'BP tri', '6285705372223', '-'),
('P00176', 'Mas kurnia ', '6282255051218', '-'),
('P00177', 'Dwi puthani', '6285349370713', '-'),
('P00178', 'Kak widia ', '6285251511061', '-'),
('P00179', 'Kak wessa ', '6285246304503', '-'),
('P00180', 'Pak nehemia', '6285249202477', '-'),
('P00181', 'Pak vikctor', '6285252967382', '-'),
('P00182', 'Mas isai', '6285249756797', '-'),
('P00184', 'Kak merry', '6282255740935', '-'),
('P00185', 'Kak dessy', '6282353510528', '-'),
('P00186', 'Mas gebriel', '6282251644179', '-'),
('P00187', 'Kak putry', '6282157840292', '-'),
('P00188', 'Mas rizky', '62895802813065', '-'),
('P00189', 'pak hendra ', '6285249001980', '-'),
('P00190', 'pak hendra ', '6285249001980', '-'),
('P00191', 'Kak libry', '6282213367154', '-'),
('P00192', 'Kak ezra', '6281254626689', '-'),
('P00193', 'Bu sunarti', '6282253008446', '-'),
('P00194', 'Mas yakub', '6282256451257', '-'),
('P00195', 'Mas apri', '6282297987372', '-'),
('P00196', 'Mas jojo', '6281351787272', '-'),
('P00197', 'Bu enda', '6282157785080', '-'),
('P00198', 'Kak aska mutia', '628122227577', '-'),
('P00199', 'Ika putry', '6285348615196', '-'),
('P00200', 'Kak indri', '6281253041173', '-'),
('P00201', 'Kak putry', '6285346008785', '-'),
('P00202', 'Roben', '6282247421580', '-'),
('P00203', 'Mas rohman ', '6281351590558', '-'),
('P00204', 'Kak devi', '6285386580834', '-'),
('P00205', 'Mas erick', '6282343272052', '-'),
('P00206', 'Bu frily', '6285249819917', '-'),
('P00207', 'Mas dwiki', '6285753626455', '-'),
('P00208', 'Kak tamy', '6282351856298', '-'),
('P00209', 'Tobi rianto', '6282240409108', '-'),
('P00210', 'Mas evan', '6285822723252', '-'),
('P00211', 'Mas diki', '6285754613421', '-'),
('P00212', 'Mas fendy', '6281649094798', '-'),
('P00213', 'Mba den', '6285386580834', '-'),
('P00214', 'Mba henni', '6281352850006', '-'),
('P00215', 'JPIC kalimantan', '6282157632130', '-'),
('P00216', 'Wahyu', '5225597676628', '-'),
('P00217', 'Kak norma', '6281331092595', '-'),
('P00218', 'Kak libry', '6282213367154', '-'),
('P00219', 'PAK SUNARYO', '081256753889', 'MENTENG'),
('P00220', 'Herea', '6281250720849', '-'),
('P00221', 'Mas exanio', '62891110887', '-'),
('P00222', 'Andi', '6282353262200', '-'),
('P00223', 'Pak heno', '6281347968441', '-'),
('P00224', 'Pak tomy', '6282351856298', '-'),
('P00225', 'Bu elisa ', '6285390349696', '-'),
('P00226', 'bu luna', '6285390335550', '-'),
('P00227', 'Gereja sakotik', '6285249041445', '-'),
('P00228', 'Mas dayat', '6281253535397', '-'),
('P00229', 'Kak novita ', '62895337902447', '-'),
('P00230', 'Yayan ', '6285251720307', '-'),
('P00231', 'Regina', '6285245401551', '-'),
('P00232', 'Suwansi', '6281347661057', '-'),
('P00233', 'PAK VICTOR', '082154598882', '-'),
('P00234', 'KA FEBRI', '082354058300', '-'),
('P00235', 'JAMAL', '99875578877889', 'PLANET MARS'),
('P00236', 'KA DAHLIA', '085246864703', '-'),
('P00237', 'DAVIS', '087793178001', '-'),
('P00238', 'HARISYANTO', '082157324798', '-'),
('P00239', 'RAISSA', '085248865717', '-'),
('P00240', 'IBU ENDA', '082157785080', '-'),
('P00241', 'IDA', '-', '-'),
('P00242', 'PAK EDIS', '081251525000', '-'),
('P00243', 'OSO', '-', '-'),
('P00244', 'JOSUA', '081352901350', '-'),
('P00245', 'AGUS', '081348846146', '-'),
('P00246', 'BU YORNA', '082255478259', '-'),
('P00247', 'SATRIA', '085251689980', '-'),
('P00248', 'FKIP UPR / BANG ARDY', '+62 853-3252-2796', 'JALAN YOS SUDARSO / UNIVERSITAS PALANGKA RAYA'),
('P00249', 'DINAS PERKIMTAN PROVINSI KALIMANTAN TENGAH', '+62 811-521-983 KA NOVA', 'PALANGKA RAYA'),
('P00250', 'OKTA', '089691009331', '-'),
('P00251', 'KEHAT', '085248554508', '-'),
('P00252', 'LISA', '081251017179', '-'),
('P00253', 'PA GANDI', '081348285918', '-'),
('P00254', 'DION', '081258205254', '-'),
('P00255', 'RISKY ADITIA', '085247062240', '-'),
('P00256', 'IBU NORA', '085350006812', '-'),
('P00257', 'ITO', '089670240587', '-'),
('P00258', 'JACK', '082221492408', '-'),
('P00259', 'PAK TRI', '081343224371', '-'),
('P00260', 'ka nanda', '081258203903', '-'),
('P00261', 'JOHN', '082353179562', '-'),
('P00262', 'SEPTI', '081348477405', '-'),
('P00263', 'YOHANES', '081347520218', '-'),
('P00264', 'EVELINA', '085249056789', '-'),
('P00265', 'PAK MUNIF', '-', '-'),
('P00266', 'FIKRI', '081258584353', '-'),
('P00267', 'LALA', '081350357458', '-'),
('P00268', 'SANDY', '081348174490', '-'),
('P00269', 'KA RESTI', '089527743544', '-'),
('P00270', 'Ka Lany', '082243357899', '-'),
('P00271', 'KA FEBRIANTI', '085348910934', '-'),
('P00272', 'DWI SULASTRI', '085348583773', '-'),
('P00273', 'PA TIHEN', '082156952356', '-'),
('P00274', 'MONICA', '081257293739', '-'),
('P00275', 'MAS FEBRIAN', '081649120402', '-'),
('P00276', 'RISKY ADITIA', '085247062240', '-'),
('P00277', 'MAS I NYOMAN SARWA H.P', '082126562016', '-'),
('P00278', 'KA EBEN', '0895615902005', '-'),
('P00279', 'PAK TOHARI', '0', '-'),
('P00280', 'DIAS', '081256730835', '-'),
('P00281', 'ALEX', '082152228627', '-'),
('P00282', 'KA EVI TIODORA', '087789410095', '-'),
('P00283', 'IBU LILY', '081349220533', '-'),
('P00284', 'TOBYRIANTO', '082240409108', '-'),
('P00285', 'CINDI ANISA BAHAR', '082157614356', '-'),
('P00286', 'JOY ', '0895366673988', '-'),
('P00287', 'NAFIS', '-', '-'),
('P00288', 'P2KLH LPPM UPR / BU RINI', '081254140195', '-'),
('P00289', 'PAK RUDY DISPORA', '081251485829', '-'),
('P00290', 'IBU NOVA', '081250600102', '-'),
('P00291', 'MAS UPIK', '085652207855', '-'),
('P00292', 'ICA', '085314069909', '-'),
('P00293', 'MAS RYAN', '082255105893', '-'),
('P00294', 'MAS RYAN', '082255105893', '-'),
('P00295', 'MARETA', '082351922434', '-'),
('P00296', 'KA ADELIA', '083150908116', '-'),
('P00297', 'MAS FERY', '-', '-'),
('P00298', 'RANGGA', '08986529354', '-'),
('P00300', 'PANITIA UTBK Universitas Palangka Raya', '-', '-'),
('P00301', 'ANDRAU', '085338682385', '-'),
('P00302', 'ZAKA', '082154714427', '-'),
('P00303', 'ANNAFIS', '081257974907', '-'),
('P00304', 'ANGGA', '081253180886', '-'),
('P00305', 'MAHDI', '082251388878', '-'),
('P00306', 'ELYN', '0895337878885', '-'),
('P00307', 'NADIA', '082254564417', '-'),
('P00308', 'KRISTIAN', '085248095254', '-'),
('P00309', 'KA NITA', '-', '-'),
('P00310', 'PREDINO', '085245963341', '-'),
('P00311', 'YON', '-', '-'),
('P00312', 'Mas Franky', '082390000020', '-'),
('P00313', 'KAMALA', '081255029094', '-'),
('P00314', 'CHIKA', '081253859086', '-'),
('P00315', 'BU LISA', '081258585956', '-'),
('P00316', 'ANGGA LENOVO', '085249379494', '-'),
('P00317', 'PAK ARIFIN', '-', '-'),
('P00318', 'IIS', '082253189584', '-'),
('P00319', 'MAS FAJAR', '082281807952', '-'),
('P00320', 'KA ANGELIE', '085247918133', '-'),
('P00321', 'PAK RANTAW', '082149963123', '-'),
('P00322', 'PAK YORGEN', '081256558558', '-'),
('P00323', 'MAS OGA', '081352166808', '-'),
('P00324', 'KAK INDRI', '081253041173', '-'),
('P00325', 'MAS BAYU', '081255058982', '-'),
('P00326', 'MAS BAYU', '081255058982', '-'),
('P00327', 'MAMA DERA', '085350006812', '-'),
('P00328', 'KA MARTHA', '085345552549', '-'),
('P00329', 'RITO', '-', '-'),
('P00330', 'KA VIA', '085337535144', '-'),
('P00331', 'PAK YULISTRI', '082250753866', '-');

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

--
-- Dumping data for table `tb_pengeluaran`
--

INSERT INTO `tb_pengeluaran` (`no_faktur`, `nama_toko`, `tgl_beli`, `nama_kasir`, `petugas`, `timestmp`) VALUES
('OUT01022100001', 'TOKO DEPAN', '2021-02-01', 'IRFAN', 3, '2021-02-01 08:11:12'),
('OUT02032100001', 'PASAR', '2021-03-02', 'RAISSA', 3, '2021-03-02 13:47:58'),
('OUT02032100002', 'TOKO DEPAN', '2021-03-02', 'RAISSA', 3, '2021-03-02 17:17:57'),
('OUT03022100001', 'AIR HIDUP', '2021-02-03', 'IRFAN', 3, '2021-02-03 11:42:05'),
('OUT03042100001', 'AIR HIDUP', '2021-04-03', 'IRFAN', 3, '2021-04-03 11:23:39'),
('OUT04022100001', 'ALFAMART', '2021-02-04', 'IRFAN', 3, '2021-02-04 13:12:02'),
('OUT04032100001', 'TOKO DEPAN', '2021-03-04', 'RAISSA', 3, '2021-03-04 08:02:54'),
('OUT04032100002', 'AIR HIDUP', '2021-03-04', 'RAISSA', 3, '2021-03-04 10:13:00'),
('OUT04032100003', 'TOKO AIR HIDUP', '2021-03-04', 'RAISSA', 3, '2021-03-04 13:20:18'),
('OUT06032100001', 'WARUNG', '2021-03-06', 'RAISSA', 3, '2021-03-06 12:19:34'),
('OUT06032100002', 'TOKO DEPAN', '2021-03-06', 'RAISSA', 3, '2021-03-06 12:20:14'),
('OUT07042100001', 'TOKO SAYUR', '2021-04-07', 'RAISSA', 3, '2021-04-07 10:09:23'),
('OUT07042100002', 'TOKO BANGUNAN ', '2021-04-07', 'IRFAN', 3, '2021-04-07 10:11:06'),
('OUT08022100001', 'WARUNG DEPAN', '2021-02-08', 'IRFAN', 3, '2021-02-08 10:33:22'),
('OUT08022100002', 'AYAM GEPREK JONTOR', '2021-02-08', 'IRFAN', 3, '2021-02-08 13:35:47'),
('OUT08052100001', 'ALFAMART', '2021-05-08', 'IRFAN', 3, '2021-05-08 09:19:49'),
('OUT09022100001', 'WARUNG NASI PADANG', '2021-02-09', 'IRFAN', 3, '2021-02-09 13:15:42'),
('OUT09022100002', 'WARUNG DEPAN', '2021-02-09', 'IRFAN', 3, '2021-02-09 13:16:48'),
('OUT09032100001', 'TOKO DEPAN', '2021-03-09', 'RAISSA', 3, '2021-03-09 13:50:13'),
('OUT10032100001', 'KPD', '2021-03-10', 'RAISSA', 3, '2021-03-10 13:15:06'),
('OUT10032100002', 'SHOPEE', '2021-03-10', 'RAISSA', 3, '2021-03-10 18:02:45'),
('OUT10042100001', 'TOKO SAYUR', '2021-04-10', 'RAISSA', 3, '2021-04-10 08:35:38'),
('OUT10042100002', 'TOKO DEPAN', '2021-04-10', 'RAISSA', 3, '2021-04-10 08:35:55'),
('OUT10052100001', 'TOKO DEPAN', '2021-05-10', 'IRFAN', 3, '2021-05-10 08:00:06'),
('OUT11032100001', 'AIR HIDUP', '2021-03-11', 'IRFAN', 3, '2021-03-11 11:18:56'),
('OUT13022100001', 'GUMED', '2021-02-13', 'IRFAN', 3, '2021-02-13 16:30:18'),
('OUT15022100001', 'TOKO PLASTIK GARUDA', '2021-02-15', 'IRFAN', 3, '2021-02-15 08:52:16'),
('OUT15032100001', 'TOKO MARTABAK', '2021-03-15', 'RAISSA', 3, '2021-03-15 13:43:04'),
('OUT15032100002', 'RM. UDA SAYANG', '2021-03-15', 'RAISSA', 3, '2021-03-15 13:45:06'),
('OUT16042100001', 'TOKO DEPAN', '2021-04-16', 'RANGGA', 3, '2021-04-16 10:18:50'),
('OUT17032100001', 'SHOPEE', '2021-03-17', 'RAISSA', 3, '2021-03-17 18:27:01'),
('OUT19022100001', 'TOKO DEPAN', '2021-02-19', 'IRFAN', 3, '2021-02-19 10:53:22'),
('OUT19032100001', 'AIR HIDUP', '2021-03-19', 'RAISSA', 3, '2021-03-19 09:25:02'),
('OUT19032100002', 'TAHUTEK TINGANG', '2021-03-19', 'RAISSA', 3, '2021-03-19 09:25:26'),
('OUT19032100003', 'TOKO SAYUR', '2021-03-19', 'RAISSA', 3, '2021-03-19 09:26:03'),
('OUT19032100004', 'TOKO SAYUR', '2021-03-19', 'RAISSA', 3, '2021-03-19 09:47:59'),
('OUT20022100001', 'TOKO DEPAN', '2021-02-20', 'RAISSA', 3, '2021-02-20 08:23:10'),
('OUT20022100002', 'TOKO SEMBAKO', '2021-02-20', 'RAISSA', 3, '2021-02-20 10:43:50'),
('OUT20022100003', 'TOKO DEPAN', '2021-02-20', 'RAISSA', 3, '2021-02-20 14:33:30'),
('OUT20032100001', 'TOKO SAYUR', '2021-03-20', 'RAISSA', 3, '2021-03-20 11:14:26'),
('OUT20042100001', 'ABADI JAYA', '2021-04-20', 'RAISSA', 3, '2021-04-20 14:51:38'),
('OUT20042100002', 'TOKO ANAK ACIL WARUNG', '2021-04-20', 'RAISSA', 3, '2021-04-20 15:07:54'),
('OUT23022100001', 'TOKO AIR HIDUP', '2021-02-23', 'RAISSA', 3, '2021-02-23 09:20:19'),
('OUT23022100002', 'TOKO SEMBAKO', '2021-02-23', 'RAISSA', 3, '2021-02-23 12:44:26'),
('OUT23032100001', 'AIR HIDUP', '2021-03-23', 'RAISSA', 3, '2021-03-23 08:32:08'),
('OUT23042100001', 'TOKO DEPAN', '2021-04-23', 'RAISSA', 3, '2021-04-23 15:39:56'),
('OUT23042100002', 'KPD', '2021-04-23', 'RAISSA', 3, '2021-04-23 16:38:57'),
('OUT24042100001', 'ABADI JAYA', '2021-04-24', 'RAISSA', 3, '2021-04-24 15:04:29'),
('OUT26022100001', 'TOKO DEPAN', '2021-02-26', 'RAISSA', 3, '2021-02-26 12:17:07'),
('OUT26022100002', 'TOKO DEPAN', '2021-02-26', 'RAISSA', 3, '2021-02-26 12:17:53'),
('OUT26032100001', 'TOKO DEPAN', '2021-03-26', 'RAISSA', 3, '2021-03-26 09:52:14'),
('OUT26042100001', 'TOKO SAYUR', '2021-04-26', 'RAISSA', 3, '2021-04-26 09:50:39'),
('OUT26042100002', 'TOKO SEMBAKO', '2021-04-26', 'RAISSA', 3, '2021-04-26 09:53:51'),
('OUT27022100001', 'TOKO DEPAN', '2021-02-27', 'RAISSA', 3, '2021-02-27 12:20:55'),
('OUT28042100001', 'ALFAMART', '2021-04-28', 'RAISSA', 3, '2021-04-28 10:42:25'),
('OUT28042100002', 'TOKO DEPAN', '2021-04-28', 'RAISSA', 3, '2021-04-28 12:59:20'),
('OUT29042100001', 'AIR HIDUP', '2021-04-29', 'IRFAN', 3, '2021-04-29 10:04:54');

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
('CA02032100001', '', 'IKO', '2021-03-02', 3, 'LUNAS', 300000.00, 0.00, '2021-03-02 14:10:18'),
('CA02042100001', '', 'Julio', '2021-04-02', 3, 'LUNAS', 100000.00, 0.00, '2021-04-02 14:16:28'),
('CA03032100001', 'P00253', 'PA GANDI', '2021-03-03', 3, 'LUNAS', 35000.00, 0.00, '2021-03-03 16:49:22'),
('CA03032100002', '', 'USER', '2021-03-03', 3, 'LUNAS', 250000.00, 0.00, '2021-03-03 16:51:45'),
('CA04022100002', 'P00043', 'I.B.GEDE ASTAWA', '2021-02-04', 3, 'HUTANG', 650000.00, 0.00, '2021-02-04 15:53:52'),
('CA05032100001', '', 'USER', '2021-03-05', 3, 'LUNAS', 10000.00, 0.00, '2021-03-05 14:59:05'),
('CA06052100001', 'P00078', 'Pak Gandi', '2021-05-06', 3, 'LUNAS', 50000.00, 0.00, '2021-05-06 12:20:31'),
('CA06052100002', 'P00324', 'KAK INDRI', '2021-05-06', 3, 'HUTANG', 0.00, 0.00, '2021-05-06 15:03:28'),
('CA06052100003', 'P00200', 'Kak indri', '2021-05-06', 3, 'LUNAS', 250000.00, 0.00, '2021-05-06 15:05:14'),
('CA07042100001', '', 'MIKHAEL ', '2021-04-07', 3, 'LUNAS', 10000.00, 5000.00, '2021-04-07 10:13:23'),
('CA07052100001', 'P00324', 'KAK INDRI', '2021-05-07', 3, 'LUNAS', 250000.00, 0.00, '2021-05-07 16:07:52'),
('CA08052100001', 'P00249', 'DINAS PERKIMTAN PROVINSI KALIMANTAN TENGAH', '2021-05-08', 3, 'LUNAS', 300000.00, 0.00, '2021-05-08 13:54:43'),
('CA08052100002', 'P00328', 'KA MARTHA', '2021-05-08', 3, 'LUNAS', 250000.00, 10000.00, '2021-05-08 14:16:27'),
('CA09042100001', 'P00167', 'JPIC kalimantan', '2021-04-09', 3, 'LUNAS', 250000.00, 0.00, '2021-04-09 09:53:39'),
('CA10032100001', 'P00198', 'Kak aska mutia', '2021-03-10', 3, 'LUNAS', 50000.00, 0.00, '2021-03-10 15:46:57'),
('CA16032100001', '', 'USER', '2021-03-16', 3, 'LUNAS', 90000.00, 0.00, '2021-03-16 11:52:44'),
('CA16032100002', '', 'USER', '2021-03-16', 3, 'LUNAS', 100000.00, 0.00, '2021-03-16 11:53:22'),
('CA16042100001', 'P00297', 'MAS FERY', '2021-04-16', 3, 'LUNAS', 150000.00, 0.00, '2021-04-16 16:32:35'),
('CA16042100002', 'P00297', 'MAS FERY', '2021-04-16', 3, 'LUNAS', 150000.00, 10000.00, '2021-04-16 16:33:09'),
('CA18032100002', '', 'AULIA', '2021-03-18', 3, 'LUNAS', 250000.00, 50000.00, '2021-03-18 10:54:03'),
('CA19022100001', 'P00238', 'HARISYANTO', '2021-02-19', 3, 'LUNAS', 250000.00, 0.00, '2021-02-19 14:28:33'),
('CA19042100009', 'P00300', 'PANITIA UTBK Universitas Palangka Raya', '2021-04-19', 3, 'LUNAS', 15060000.00, 0.00, '2021-04-19 15:42:17'),
('CA19042100010', 'P00300', 'PANITIA UTBK Universitas Palangka Raya', '2021-04-19', 3, 'LUNAS', 15460000.00, 0.00, '2021-04-19 15:48:02'),
('CA19042100011', 'P00300', 'PANITIA UTBK Universitas Palangka Raya', '2021-04-19', 3, 'LUNAS', 6660000.00, 0.00, '2021-04-19 15:55:03'),
('CA19042100012', 'P00300', 'PANITIA UTBK Universitas Palangka Raya', '2021-04-19', 3, 'LUNAS', 9260000.00, 0.00, '2021-04-19 16:03:50'),
('CA19042100013', 'P00300', 'PANITIA UTBK Universitas Palangka Raya', '2021-04-19', 3, 'LUNAS', 20960000.00, 0.00, '2021-04-19 16:14:41'),
('CA19042100014', 'P00300', 'PANITIA UTBK Universitas Palangka Raya', '2021-04-19', 3, 'LUNAS', 35602000.00, 0.00, '2021-04-19 16:22:30'),
('CA19042100015', 'P00300', 'PANITIA UTBK Universitas Palangka Raya', '2021-04-19', 3, 'LUNAS', 16047000.00, 0.00, '2021-04-19 16:28:13'),
('CA20022100001', '', 'GBI MARINA PERMAI', '2021-02-20', 3, 'LUNAS', 150000.00, 0.00, '2021-02-20 12:08:48'),
('CA22032100001', '', 'PRIO', '2021-03-22', 3, 'LUNAS', 90000.00, 0.00, '2021-03-22 08:19:55'),
('CA23042100001', 'P00300', 'PANITIA UTBK Universitas Palangka Raya', '2021-04-23', 3, 'LUNAS', 10645000.00, 0.00, '2021-04-23 08:37:48'),
('CA23042100002', 'P00300', 'PANITIA UTBK Universitas Palangka Raya', '2021-04-23', 3, 'LUNAS', 5060000.00, 0.00, '2021-04-23 08:51:19'),
('CA23042100003', 'P00300', 'PANITIA UTBK Universitas Palangka Raya', '2021-04-23', 3, 'LUNAS', 4260000.00, 0.00, '2021-04-23 08:58:06'),
('CA23042100004', 'P00300', 'PANITIA UTBK Universitas Palangka Raya', '2021-04-23', 3, 'LUNAS', 6860000.00, 0.00, '2021-04-23 09:04:16'),
('CA23042100005', 'P00300', 'PANITIA UTBK Universitas Palangka Raya', '2021-04-23', 3, 'LUNAS', 10560000.00, 0.00, '2021-04-23 09:11:43'),
('CA23042100006', 'P00300', 'PANITIA UTBK Universitas Palangka Raya', '2021-04-23', 3, 'LUNAS', 35602000.00, 0.00, '2021-04-23 09:17:19'),
('CA25032100001', 'P00277', 'MAS I NYOMAN SARWA H.P', '2021-03-25', 3, 'LUNAS', 11500000.00, 0.00, '2021-03-25 17:07:28'),
('CA26032100001', '', 'ELKANA', '2021-03-26', 3, 'LUNAS', 20000.00, 0.00, '2021-03-26 14:04:36'),
('CA27032100001', '', 'FRISKA', '2021-03-27', 3, 'LUNAS', 220000.00, 30000.00, '2021-03-27 15:27:35'),
('CA27032100002', '', 'ILHAM BAYU', '2021-03-27', 3, 'LUNAS', 900000.00, 25000.00, '2021-03-27 16:18:34'),
('CA27042100001', 'P00300', 'PANITIA UTBK Universitas Palangka Raya', '2021-04-27', 3, 'LUNAS', 11765000.00, 0.00, '2021-04-27 09:31:54'),
('CA27042100002', 'P00300', 'PANITIA UTBK Universitas Palangka Raya', '2021-04-27', 3, 'LUNAS', 5060000.00, 0.00, '2021-04-27 09:37:12'),
('CA27042100003', 'P00300', 'PANITIA UTBK Universitas Palangka Raya', '2021-04-27', 3, 'LUNAS', 7940000.00, 0.00, '2021-04-27 09:40:38'),
('CA27042100004', 'P00300', 'PANITIA UTBK Universitas Palangka Raya', '2021-04-27', 3, 'LUNAS', 6860000.00, 0.00, '2021-04-27 09:46:59'),
('CA27042100005', 'P00300', 'PANITIA UTBK Universitas Palangka Raya', '2021-04-27', 3, 'LUNAS', 20775000.00, 0.00, '2021-04-27 10:30:03'),
('CA27042100006', 'P00300', 'PANITIA UTBK Universitas Palangka Raya', '2021-04-27', 3, 'LUNAS', 15000000.00, 0.00, '2021-04-27 10:59:54'),
('CA29042100001', 'P00315', 'BU LISA', '2021-04-29', 3, 'LUNAS', 250000.00, 0.00, '2021-04-29 15:49:03');

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

--
-- Dumping data for table `tb_servis`
--

INSERT INTO `tb_servis` (`no_transaksi`, `kode_pelanggan`, `nama_pelanggan`, `tgl_servis_masuk`, `tgl_servis_keluar`, `petugas`, `status`, `bayar`, `potongan`, `timestmp`) VALUES
('SER01032100001', '', 'MAS RIDHO', '2021-03-01', NULL, 3, 'BARU', 3460000.00, 0.00, '2021-03-01 08:13:25'),
('SER01032100002', 'P00250', 'OKTA', '2021-03-01', '2021-03-04', 3, 'BARU<br><b>SELESAI</b> 01 Mar 2021', 0.00, 0.00, '2021-03-01 11:11:49'),
('SER01032100003', '', 'LISA', '2021-03-01', '2021-03-01', 3, 'BARU', 0.00, 0.00, '2021-03-01 14:53:31'),
('SER01052100001', 'P00290', 'IBU NOVA', '2021-05-01', NULL, 3, 'BARU', 0.00, 0.00, '2021-05-01 10:59:21'),
('SER01052100002', 'P00318', 'IIS', '2021-05-01', '2021-05-05', 3, 'BARU', 0.00, 0.00, '2021-05-01 14:02:09'),
('SER02022100002', '', '-', '2021-02-02', '2021-02-02', 3, 'BARU<br><b>SELESAI</b> 02 Feb 2021', 100000.00, 0.00, '2021-02-02 15:37:37'),
('SER02032100001', '', 'KEHAT', '2021-03-02', NULL, 3, 'BARU', 0.00, 0.00, '2021-03-02 09:37:57'),
('SER02042100001', 'P00282', 'KA EVI TIODORA', '2021-04-02', NULL, 3, 'BARU', 0.00, 0.00, '2021-04-02 16:28:28'),
('SER03022100001', 'P00009', 'BU HENDRA', '2021-02-03', '2021-02-03', 3, 'BARU<br><b>SELESAI</b> 03 Feb 2021', 750000.00, 0.00, '2021-02-03 07:59:02'),
('SER03022100002', '', 'LANY', '2021-02-03', '2021-02-03', 3, 'BARU<br><b>SELESAI</b> 03 Feb 2021', 250000.00, 0.00, '2021-02-03 08:19:39'),
('SER03022100003', 'P00024', 'CHIKA JPIC', '2021-02-03', '2021-02-03', 3, 'BARU<br><b>SELESAI</b> 03 Feb 2021', 350000.00, 0.00, '2021-02-03 11:23:34'),
('SER03022100004', 'P00042', 'MAS WILY', '2021-02-03', '2021-02-03', 3, 'BARU<br><b>SELESAI</b> 03 Feb 2021', 75000.00, 0.00, '2021-02-03 11:48:02'),
('SER03032100001', '', 'PA GANDI', '2021-03-03', NULL, 3, 'BARU', 0.00, 0.00, '2021-03-03 10:50:34'),
('SER03032100002', 'P00237', 'DAVIS', '2021-03-03', NULL, 3, 'BARU', 20000.00, 0.00, '2021-03-03 16:31:13'),
('SER03042100001', 'P00283', 'IBU LILY', '2021-04-03', NULL, 3, 'BARU<br><b>CANCEL</b> 10 Apr 2021', 0.00, 0.00, '2021-04-03 15:07:19'),
('SER03052100001', 'P00319', 'MAS FAJAR', '2021-05-03', '2021-05-04', 3, 'BARU', 380000.00, 0.00, '2021-05-03 08:46:28'),
('SER03052100002', 'P00320', 'KA ANGELIE', '2021-05-03', '2021-05-05', 3, 'BARU', 350000.00, 0.00, '2021-05-03 13:00:49'),
('SER04032100001', '', '', '2021-03-04', '2021-03-04', 3, 'BARU', 10000.00, 0.00, '2021-03-04 12:18:31'),
('SER04032100002', '', 'USER', '2021-03-04', '2021-03-04', 3, 'BARU', 0.00, 0.00, '2021-03-04 13:29:56'),
('SER04052100001', 'P00237', 'DAVIS', '2021-05-04', NULL, 3, 'BARU', 0.00, 0.00, '2021-05-04 10:56:18'),
('SER05022100001', 'P00219', 'PAK SUNARYO', '2021-02-05', NULL, 3, 'BARU', 0.00, 0.00, '2021-02-05 15:25:51'),
('SER05022100003', 'P00233', 'PAK VICTOR', '2021-02-05', '2021-02-05', 3, 'BARU<br><b>SELESAI</b> 05 Feb 2021', 20000.00, 0.00, '2021-02-05 16:49:17'),
('SER05022100004', 'P00234', 'KA FEBRI', '2021-02-05', '2021-02-08', 3, '<br><b>SELESAI</b> 06 Feb 2021', 0.00, 0.00, '2021-02-05 16:56:37'),
('SER05032100001', 'P00256', 'IBU NORA', '2021-03-05', '2021-03-09', 3, 'BARU', 50000.00, 0.00, '2021-03-05 08:39:41'),
('SER05042100001', 'P00284', 'TOBYRIANTO', '2021-04-05', NULL, 3, 'BARU', 0.00, 0.00, '2021-04-05 12:49:48'),
('SER05052100001', 'P00321', 'PAK RANTAW', '2021-05-05', NULL, 3, 'BARU', 0.00, 0.00, '2021-05-05 08:27:39'),
('SER05052100002', '', 'DUKCAPIL', '2021-05-05', NULL, 3, 'BARU', 0.00, 0.00, '2021-05-05 08:33:08'),
('SER06032100001', 'P00257', 'ITO', '2021-03-06', '2021-05-01', 3, 'BARU', 700000.00, 0.00, '2021-03-06 16:39:20'),
('SER06042100002', 'P00001', 'UNIVERSITAS PALANGKA RAYA', '2021-04-06', NULL, 3, 'BARU', 0.00, 0.00, '2021-04-06 09:10:42'),
('SER06042100003', 'P00288', 'P2KLH LPPM UPR / BU RINI', '2021-04-06', '2021-04-29', 3, 'BARU', 0.00, 0.00, '2021-04-06 09:15:30'),
('SER06042100004', 'P00289', 'PAK RUDY DISPORA', '2021-04-06', '2021-04-17', 3, 'BARU', 50000.00, 0.00, '2021-04-06 17:56:23'),
('SER06052100001', 'P00322', 'PAK YORGEN', '2021-05-06', NULL, 3, 'BARU', 0.00, 0.00, '2021-05-06 09:56:53'),
('SER06052100002', 'P00323', 'MAS OGA', '2021-05-06', NULL, 3, 'BARU', 150000.00, 0.00, '2021-05-06 11:27:16'),
('SER07042100001', 'P00070', 'Edo   ', '2021-04-07', '2021-04-20', 3, 'BARU', 470000.00, 30000.00, '2021-04-07 13:35:59'),
('SER07052100001', 'P00325', 'MAS BAYU', '2021-05-07', '2021-05-07', 3, 'BARU', 50000.00, 0.00, '2021-05-07 10:19:23'),
('SER07052100002', 'P00024', 'CHIKA JPIC', '2021-05-07', '2021-05-10', 3, 'BARU', 250000.00, 0.00, '2021-05-07 10:23:16'),
('SER08032100001', 'P00068', 'Aldo ', '2021-03-08', '2021-03-09', 3, 'BARU', 0.00, 0.00, '2021-03-08 09:17:03'),
('SER08032100002', 'P00258', 'JACK', '2021-03-08', NULL, 3, '', 75000.00, 0.00, '2021-03-08 10:05:37'),
('SER08032100003', 'P00161', 'Kak felix', '2021-03-08', NULL, 3, 'BARU', 75000.00, 0.00, '2021-03-08 12:21:21'),
('SER08052100001', 'P00249', 'DINAS PERKIMTAN PROVINSI KALIMANTAN TENGAH', '2021-05-08', '2021-05-10', 3, 'BARU', 500000.00, 0.00, '2021-05-08 10:32:14'),
('SER08052100002', 'P00327', 'MAMA DERA', '2021-05-08', '2021-05-10', 3, 'BARU', 650000.00, 0.00, '2021-05-08 11:09:07'),
('SER08052100003', 'P00329', 'RITO', '2021-05-08', NULL, 3, 'BARU', 100000.00, 0.00, '2021-05-08 16:17:54'),
('SER09032100001', 'P00112', 'bu eka', '2021-03-09', NULL, 3, 'BARU', 0.00, 0.00, '2021-03-09 09:36:26'),
('SER09032100002', 'P00184', 'Kak merry', '2021-03-09', NULL, 3, 'BARU', 0.00, 0.00, '2021-03-09 09:42:06'),
('SER09032100003', 'P00013', 'DIO', '2021-03-09', NULL, 3, 'BARU', 0.00, 0.00, '2021-03-09 13:37:47'),
('SER09042100001', 'P00291', 'MAS UPIK', '2021-04-09', '2021-04-17', 3, 'BARU', 75000.00, 0.00, '2021-04-09 10:33:32'),
('SER09042100002', 'P00284', 'TOBYRIANTO', '2021-04-09', NULL, 3, 'BARU<br><b>CANCEL</b> 10 May 2021<br><b>CANCEL</b> 10 May 2021', 400000.00, 0.00, '2021-04-09 14:22:00'),
('SER10032100001', 'P00259', 'PAK TRI', '2021-03-10', '2021-03-10', 3, 'BARU', 140000.00, 0.00, '2021-03-10 19:59:30'),
('SER10042100001', 'P00292', 'ICA', '2021-04-10', NULL, 3, 'BARU', 0.00, 0.00, '2021-04-10 13:26:16'),
('SER10052100001', 'P00330', 'KA VIA', '2021-05-10', NULL, 3, 'BARU', 75000.00, 0.00, '2021-05-10 15:28:21'),
('SER11032100001', 'P00260', 'ka nanda', '2021-03-11', '2021-03-11', 3, 'BARU', 0.00, 0.00, '2021-03-11 10:43:15'),
('SER11032100002', 'P00154', 'Kak elsa', '2021-03-11', NULL, 3, 'BARU', 0.00, 0.00, '2021-03-11 13:53:41'),
('SER11052100001', 'P00325', 'MAS BAYU', '2021-05-11', NULL, 3, 'BARU', 0.00, 0.00, '2021-05-11 09:25:46'),
('SER11052100002', 'P00331', 'PAK YULISTRI', '2021-05-11', NULL, 3, 'BARU', 0.00, 0.00, '2021-05-11 09:27:20'),
('SER12032100001', '', 'JOHN', '2021-03-12', '2021-03-12', 3, '', 0.00, 0.00, '2021-03-12 07:59:22'),
('SER12032100002', 'P00262', 'SEPTI', '2021-03-12', '2021-03-15', 3, '', 50000.00, 0.00, '2021-03-12 12:45:16'),
('SER13022100001', 'P00020', 'NADIA ASUS', '2021-02-13', NULL, 3, 'BARU<br><b>ON PROGRESS</b> 13 Feb 2021', 0.00, 0.00, '2021-02-13 10:47:52'),
('SER13022100002', 'P00019', 'RAHMAT', '2021-02-13', NULL, 3, 'BARU<br><b>ON PROGRESS</b> 13 Feb 2021<br><b>SELESAI</b> 16 Feb 2021', 0.00, 0.00, '2021-02-13 10:50:16'),
('SER13022100003', 'P00205', 'Mas erick', '2021-02-13', NULL, 3, 'BARU<br><b>ON PROGRESS</b> 13 Feb 2021<br><b>SELESAI</b> 16 Feb 2021', 270000.00, 0.00, '2021-02-13 10:52:26'),
('SER14042100001', 'P00294', 'MAS RYAN', '2021-04-14', '2021-04-17', 3, 'BARU', 0.00, 0.00, '2021-04-14 10:12:09'),
('SER14042100002', 'P00249', 'DINAS PERKIMTAN PROVINSI KALIMANTAN TENGAH', '2021-04-14', NULL, 3, 'BARU', 0.00, 0.00, '2021-04-14 11:13:58'),
('SER14042100003', 'P00295', 'MARETA', '2021-04-14', NULL, 3, 'BARU<br><b>ON PROGRESS</b> 23 Apr 2021', 0.00, 0.00, '2021-04-14 11:15:31'),
('SER15022100001', '', 'NADIA', '2021-02-15', '2021-02-16', 3, 'BARU<br><b>SELESAI</b> 16 Feb 2021', 50000.00, 0.00, '2021-02-15 17:33:36'),
('SER15022100002', 'P00011', 'ANDREAS', '2021-02-15', NULL, 3, 'BARU<br><b>SELESAI</b> 15 Feb 2021', 0.00, 0.00, '2021-02-15 17:39:31'),
('SER15022100003', 'P00019', 'RAHMAT', '2021-02-15', NULL, 3, 'BARU<br><b>SELESAI</b> 15 Feb 2021', 0.00, 0.00, '2021-02-15 17:41:07'),
('SER15032100001', 'P00037', 'KA WESSA', '2021-03-15', '2021-03-17', 3, 'BARU', 1500000.00, 100000.00, '2021-03-15 08:26:34'),
('SER15032100002', 'P00249', 'DINAS PERKIMTAN PROVINSI KALIMANTAN TENGAH', '2021-03-15', NULL, 3, 'BARU', 1555000.00, 0.00, '2021-03-15 13:29:00'),
('SER15032100003', 'P00249', 'DINAS PERKIMTAN PROVINSI KALIMANTAN TENGAH', '2021-03-15', NULL, 3, 'BARU', 1850000.00, 0.00, '2021-03-15 13:37:18'),
('SER15032100004', 'P00012', 'YOHANES', '2021-03-15', NULL, 3, 'BARU', 0.00, 0.00, '2021-03-15 14:56:37'),
('SER15032100005', 'P00264', 'EVELINA', '2021-03-15', NULL, 3, 'BARU', 0.00, 0.00, '2021-03-15 15:27:02'),
('SER15032100006', 'P00263', 'YOHANES', '2021-03-15', '2021-03-15', 3, 'BARU', 75000.00, 0.00, '2021-03-15 17:32:05'),
('SER16042100001', 'P00296', 'KA ADELIA', '2021-04-16', '2021-04-17', 3, 'BARU', 75000.00, 0.00, '2021-04-16 15:31:21'),
('SER17022100001', 'P00236', 'KA DAHLIA', '2021-02-17', '2021-02-17', 3, 'BARU', 35000.00, 0.00, '2021-02-17 12:57:36'),
('SER17032100001', 'P00265', 'PAK MUNIF', '2021-03-17', '2021-03-17', 3, 'BARU', 10000.00, 0.00, '2021-03-17 08:00:15'),
('SER17032100003', '', 'GEREJA YHS', '2021-03-17', '2021-03-19', 3, 'BARU', 100000.00, 0.00, '2021-03-17 09:50:07'),
('SER17032100005', 'P00266', 'FIKRI', '2021-03-17', '2021-03-18', 3, 'BARU', 150000.00, 0.00, '2021-03-17 11:35:36'),
('SER17032100006', 'P00267', 'LALA', '2021-03-17', '2021-03-17', 3, 'BARU', 75000.00, 0.00, '2021-03-17 12:19:33'),
('SER17032100007', 'P00268', 'SANDY', '2021-03-17', '2021-03-19', 3, 'BARU', 75000.00, 0.00, '2021-03-17 17:26:42'),
('SER17032100008', '', 'ADE RAY SAPUTRA', '2021-03-17', '2021-03-17', 3, 'BARU', 30000.00, 0.00, '2021-03-17 18:24:56'),
('SER18022100001', '', 'Siska', '2021-02-18', NULL, 3, 'BARU<br><b>ON PROGRESS</b> 18 Feb 2021', 0.00, 0.00, '2021-02-18 12:00:38'),
('SER18022100002', 'P00137', 'Novi', '2021-02-18', NULL, 3, 'BARU', 50000.00, 0.00, '2021-02-18 15:12:00'),
('SER18022100003', 'P00249', 'DINAS PERKIMTAN PROVINSI KALIMANTAN TENGAH', '2021-02-18', NULL, 3, 'BARU<br><b>SELESAI</b> 01 Mar 2021<br><b>ON PROGRESS</b> 11 Mar 2021', 0.00, 0.00, '2021-02-18 16:37:48'),
('SER18022100004', 'P00248', 'FKIP UPR / BANG ARDY', '2021-02-18', NULL, 3, 'BARU', 0.00, 0.00, '2021-02-18 16:51:01'),
('SER18032100001', 'P00269', 'KA RESTI', '2021-03-18', '2021-03-18', 3, 'BARU', 270000.00, 0.00, '2021-03-18 07:59:01'),
('SER18032100002', 'P00270', 'Ka Lany', '2021-03-18', '2021-03-18', 3, 'BARU', 50000.00, 0.00, '2021-03-18 13:42:18'),
('SER19022100001', '', 'DAVIS', '2021-02-19', '2021-02-25', 3, 'BARU<br><b>SELESAI</b> 25 Feb 2021', 0.00, 0.00, '2021-02-19 09:31:45'),
('SER19022100003', '', 'GEREJA YHS', '2021-02-19', NULL, 3, 'BARU', 0.00, 0.00, '2021-02-19 11:35:27'),
('SER19032100002', 'P00249', 'DINAS PERKIMTAN PROVINSI KALIMANTAN TENGAH', '2021-03-19', NULL, 3, 'BARU', 0.00, 0.00, '2021-03-19 16:11:31'),
('SER20042100001', 'P00304', 'ANGGA', '2021-04-20', NULL, 3, 'BARU<br><b>ON PROGRESS</b> 26 Apr 2021', 0.00, 0.00, '2021-04-20 16:47:39'),
('SER21042100001', 'P00305', 'MAHDI', '2021-04-21', '2021-04-29', 3, 'BARU<br><b>CANCEL</b> 22 Apr 2021', 0.00, 0.00, '2021-04-21 13:23:41'),
('SER21042100002', 'P00306', 'ELYN', '2021-04-21', '2021-04-29', 3, 'BARU<br><b>SELESAI</b> 22 Apr 2021', 75000.00, 0.00, '2021-04-21 15:31:27'),
('SER21042100003', 'P00307', 'NADIA', '2021-04-21', '2021-04-29', 3, 'BARU<br><b>SELESAI</b> 22 Apr 2021', 0.00, 0.00, '2021-04-21 15:35:05'),
('SER22022100001', '', 'IBU ENDA', '2021-02-22', NULL, 3, 'BARU<br><b>CANCEL</b> 24 Apr 2021', 0.00, 0.00, '2021-02-22 16:16:11'),
('SER22032100001', 'P00272', 'DWI SULASTRI', '2021-03-22', '2021-03-24', 3, 'BARU<br><b>CANCEL</b> 24 Mar 2021', 0.00, 0.00, '2021-03-22 12:34:43'),
('SER22042100001', 'P00308', 'KRISTIAN', '2021-04-22', '2021-04-26', 3, 'BARU<br><b>ON PROGRESS</b> 23 Apr 2021<br><b>SELESAI</b> 26 Apr 2021', 600000.00, 0.00, '2021-04-22 12:22:37'),
('SER22042100002', 'P00309', 'KA NITA', '2021-04-22', NULL, 3, 'BARU<br><b>SELESAI</b> 23 Apr 2021', 20000.00, 0.00, '2021-04-22 16:50:25'),
('SER23022100001', 'P00241', 'IDA', '2021-02-23', '2021-02-25', 3, 'BARU<br><b>SELESAI</b> 25 Feb 2021', 0.00, 0.00, '2021-02-23 11:16:54'),
('SER23022100002', '', 'PA EDIS', '2021-02-23', '2021-02-25', 3, 'BARU<br><b>SELESAI</b> 25 Feb 2021', 0.00, 0.00, '2021-02-23 12:09:22'),
('SER23032100001', 'P00273', 'PA TIHEN', '2021-03-23', '2021-03-24', 3, 'BARU', 50000.00, 0.00, '2021-03-23 14:58:56'),
('SER23032100002', 'P00274', 'MONICA', '2021-03-23', NULL, 3, 'BARU', 0.00, 0.00, '2021-03-23 16:08:00'),
('SER23042100001', 'P00310', 'PREDINO', '2021-04-23', '2021-04-29', 3, 'BARU<br><b>CANCEL</b> 23 Apr 2021', 0.00, 0.00, '2021-04-23 10:52:01'),
('SER24022100001', 'P00007', 'MAS ALFRED', '2021-02-24', '2021-02-25', 3, 'BARU<br><b>SELESAI</b> 25 Feb 2021', 0.00, 0.00, '2021-02-24 13:09:07'),
('SER24022100002', 'P00243', 'OSO', '2021-02-24', '2021-02-25', 3, '', 50000.00, 0.00, '2021-02-24 14:18:02'),
('SER24022100003', '', 'JOSUA', '2021-02-24', NULL, 3, '', 0.00, 0.00, '2021-02-24 16:34:59'),
('SER24032100001', 'P00275', 'MAS FEBRIAN', '2021-03-24', '2021-03-24', 3, 'BARU', 75000.00, 0.00, '2021-03-24 10:36:14'),
('SER24042100001', 'P00166', 'Mas rafi', '2021-04-24', '2021-04-29', 3, 'BARU<br><b>ON PROGRESS</b> 26 Apr 2021<br><b>SELESAI</b> 27 Apr 2021', 20000.00, 0.00, '2021-04-24 09:56:23'),
('SER25022100002', 'P00245', 'AGUS', '2021-02-25', '2021-03-04', 3, 'BARU', 0.00, 0.00, '2021-02-25 09:08:41'),
('SER25032100001', 'P00278', 'KA EBEN', '2021-03-25', '2021-03-25', 3, 'BARU', 100000.00, 0.00, '2021-03-25 18:16:47'),
('SER25042100001', '', 'MIKAEL', '2021-04-25', '2021-04-29', 3, 'BARU<br><b>SELESAI</b> 25 Apr 2021', 500000.00, 50000.00, '2021-04-25 20:16:40'),
('SER26042100001', 'P00312', 'Mas Franky', '2021-04-26', NULL, 3, 'BARU<br><b>SELESAI</b> 26 Apr 2021', 0.00, 0.00, '2021-04-26 13:50:42'),
('SER27022100001', 'P00082', 'Bobi ', '2021-02-27', '2021-02-27', 3, 'BARU<br><b>SELESAI</b> 27 Feb 2021', 350000.00, 0.00, '2021-02-27 11:19:49'),
('SER27022100002', 'P00246', 'BU YORNA', '2021-02-27', '2021-03-04', 3, '', 0.00, 0.00, '2021-02-27 13:58:28'),
('SER27032100001', 'P00279', 'PAK TOHARI', '2021-03-27', NULL, 3, 'BARU', 0.00, 0.00, '2021-03-27 14:45:47'),
('SER27042100001', 'P00313', 'KAMALA', '2021-04-27', NULL, 3, 'BARU', 0.00, 0.00, '2021-04-27 11:45:13'),
('SER28022100001', 'P00247', 'SATRIA', '2021-02-28', '2021-03-04', 3, 'BARU<br><b>SELESAI</b> 03 Mar 2021', 0.00, 0.00, '2021-02-28 13:39:05'),
('SER28042100001', 'P00314', 'CHIKA', '2021-04-28', '2021-04-29', 3, 'BARU', 75000.00, 0.00, '2021-04-28 10:04:23'),
('SER29032100001', 'P00280', 'DIAS', '2021-03-29', '2021-03-30', 3, 'BARU', 150000.00, 0.00, '2021-03-29 11:39:37'),
('SER29032100002', 'P00281', 'ALEX', '2021-03-29', NULL, 3, 'BARU', 0.00, 0.00, '2021-03-29 15:57:19'),
('SER29042100001', 'P00248', 'FKIP UPR / BANG ARDY', '2021-04-29', NULL, 3, 'BARU', 0.00, 0.00, '2021-04-29 16:27:24'),
('SER30042100001', 'P00316', 'ANGGA LENOVO', '2021-04-30', '2021-05-05', 3, 'BARU<br><b>SELESAI</b> 01 May 2021', 350000.00, 0.00, '2021-04-30 16:20:53'),
('SER30042100002', 'P00317', 'PAK ARIFIN', '2021-04-30', '2021-04-30', 3, 'BARU', 250000.00, 0.00, '2021-04-30 16:26:15');

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
(1, 'ADMINISTRATOR', 'gumedz', '21232f297a57a5a743894a0e4a801fc3', 'admin', '2021-01-27 16:11:15', ''),
(3, 'Admin Gunungmedia', 'adm1', '21232f297a57a5a743894a0e4a801fc3', 'admin', '2021-05-11 10:15:41', ''),
(4, 'Admin Gunungmedia', 'az1', '21232f297a57a5a743894a0e4a801fc3', 'user', '0000-00-00 00:00:00', '');

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
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `tb_satuan_barang`
--
ALTER TABLE `tb_satuan_barang`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
