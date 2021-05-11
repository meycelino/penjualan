<link rel="stylesheet" type="text/css" href="../../css/pace.css">
<script src="../../js/pace.min.js"></script>
<?php
	date_default_timezone_set('Asia/Jakarta');
	session_start();
	include"../../lib/conn.php";
	include"../../lib/all_function.php";
	include"../../lib/fungsi_transaction.php";


	if(!isset($_SESSION['login_user'])){
		header('location: ../../login.php'); // Mengarahkan ke Home Page
	}

	if(isset($_SESSION['pengeluaran']) AND $_SESSION['pengeluaran'] <> 'TRUE')
	{
		echo"<div class='w3-container w3-red'><p>Dilarang mengakses file ini.</p></div>";
		die();
	}

	if(isset($_GET['mod']) && isset($_GET['act']))
	{
		$mod = $_GET['mod'];
		$act = $_GET['act'];
	}
	else
	{
		$mod = "";
		$act = "";
	}

	if($mod == "pengeluaran" AND $act == "add")
	{

				mysql_query("INSERT INTO tb_detail_pengeluaran_tmp (nama_barang,
																	harga_beli,
																	qty,
																	petugas,
																	timestmp)
															VALUES('$_POST[nama_barang]',
																	'$_POST[harga2]',
																	$_POST[qty],
																	'$_SESSION[login_id]',
																	NOW())") or die(mysql_error());

				echo"<script>
					window.history.back();
				</script>";

	}

	elseif ($mod == "pengeluaran" AND $act == "batal") {
		mysql_query("DELETE FROM tb_detail_pengeluaran_tmp 
					WHERE nama_barang = '$_GET[id]' 
					AND petugas = '$_SESSION[login_id]'") or die(mysql_error());

		echo"<script>
			window.history.back();
		</script>";	
	}

	elseif ($mod == "pengeluaran" AND $act == "simpan") {
		$sql_tmp = mysql_query("SELECT * FROM tb_detail_pengeluaran_tmp ORDER BY timestmp ASC");
		$temukan = mysql_num_rows($sql_tmp);

		if ($temukan > 0) {

			start_transaction();

			$resPembelian = mysql_query("INSERT INTO tb_pengeluaran(no_faktur, 
																	nama_toko, 
																	tgl_beli, 
																	nama_kasir, 
																	petugas, 
																	timestmp)
															VALUES('$_POST[no_faktur]', 
																	'$_POST[nama_toko]', 
																	'$_POST[tglbeli]', 
																	'$_POST[kasir]', 
																	'$_SESSION[login_id]', 
																	NOW())");

			while ($b = mysql_fetch_assoc($sql_tmp)) {
				$resDetail = mysql_query("INSERT INTO tb_detail_pengeluaran(no_faktur, 
																			nama_barang, 
																			harga_beli, 
																			qty, 
																			petugas, 
																			timestmp)
																	VALUES('$_POST[no_faktur]', 
																			'$b[nama_barang]', 
																			'$b[harga_beli]', 
																			'$b[qty]', 
																			'$_SESSION[login_id]', 
																			NOW())");
				if (!$resDetail) {
					rollback();
					echo"Gagal transaksi";
					exit();
				}
			}

			if (!$resPembelian) {
				rollback();
				echo"Gagal transaksi";
				exit();
			}
			else
			{
				commit();
				mysql_query("TRUNCATE TABLE tb_detail_pengeluaran_tmp");
				echo"<script type='text/JavaScript'>
					location.replace('../../med.php?mod=pengeluaran');
					</script>";
			}
		}
		else
		{
			echo "Tidak data barang yang di beli!";
		}
	}

	elseif ($mod == "pengeluaran" AND $act == "hapus") {
		mysql_query("DELETE FROM tb_pengeluaran WHERE no_faktur = '$_GET[id]'") or die(mysql_error());
		mysql_query("DELETE FROM tb_detail_pengeluaran WHERE no_faktur = '$_GET[id]'") or die(mysql_error());
		flash('example_message', '<p>Berhasil menghapus data transaksi.</p>' );
		echo"<script>
			window.history.back();
		</script>";	
	}

?>