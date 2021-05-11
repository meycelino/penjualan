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

	if($mod == "servis" AND $act == "add")
	{
	
				mysql_query("INSERT INTO tb_detail_servis_tmp (jenis,
																	seri,
																	keluhan,
																	kelengkapan,
																	kerusakan,
																	biaya,
																	garansi,
																	qty,
																	petugas,
																	timestmp)
															VALUES('$_POST[jenis]',
																	'$_POST[seri]',
																	'$_POST[keluhan]',
																	'$_POST[kelengkapan]',
																	'$_POST[kerusakan]',
																	'$_POST[biaya]',
																	'$_POST[garansi]',
																	'$_POST[qty]',
																	'$_SESSION[login_id]',
																	NOW())") or die(mysql_error());
				echo"<script>
					window.history.back();
				</script>";

	}

	elseif ($mod == "servis" AND $act == "batal") {
		mysql_query("DELETE FROM tb_detail_servis_tmp 
					WHERE kode_servis = '$_GET[id]' 
					AND petugas = '$_SESSION[login_id]'") or die(mysql_error());

		echo"<script>
			window.history.back();
		</script>";	
	}

	elseif($mod == "servis" AND $act == "simpan")
	{
		$qtmp = mysql_query("SELECT * FROM tb_detail_servis_tmp 
							WHERE petugas = '$_SESSION[login_id]' 
							ORDER BY timestmp ASC");

		if (mysql_num_rows($qtmp) > 0) {
			$no_transaksi = no_servis_auto(); //no transaksi automatis
			$jmlbayar = $_POST['jmlbayar2'];
			$total_bayar = 0;

			//$tgl = date('Y-m-d');
			while($tmp = mysql_fetch_assoc($qtmp))
			{
				$chart[] = $tmp;

				//hitung total
				$biaya = $tmp['biaya'];
				$sub_total = $biaya * $tmp['qty'];

				$total_bayar =  $total_bayar + $sub_total;
			}

			if ($_POST['potongan2'] > 0) {
				$total_bayar_cek = $total_bayar - $_POST['potongan2'];
			}
			else
			{
				$total_bayar_cek = $total_bayar;
			}
			

			//print_r($chart);
			$qpel = mysql_query("SELECT * FROM tb_pelanggan 
								WHERE kode_pelanggan = '".anti_inject($_POST['nama'])."'");

			if(mysql_num_rows($qpel) > 0)
			{
				$p = mysql_fetch_assoc($qpel);
				$kode_pel = $p['kode_pelanggan'];
				$nama_pelanggan = anti_inject($p['nama_pelanggan']);
			}
			else
			{
				$kode_pel = "";
				$nama_pelanggan = anti_inject($_POST['nama']);
			}
			//echo $nama_pelanggan;

			//apakah pembayaran sudah cukup
			//if ($jmlbayar >= $total_bayar_cek) {
				//start transaction
				start_transaction();

				//pembuatan header
				$qsimpanheader = mysql_query("INSERT INTO tb_servis(no_transaksi,
																		kode_pelanggan, 
																		nama_pelanggan, 
																		tgl_servis_masuk,
																		petugas, 
																		status,
																		bayar, 
																		potongan, 
																		timestmp)
																VALUES('$no_transaksi', 
																		'$kode_pel', 
																		'$nama_pelanggan',
																		'$_POST[tgl_servis_masuk]',
																		'$_SESSION[login_id]',
																		'BARU', 
																		'$jmlbayar', 
																		'$_POST[potongan2]', 
																		NOW())") or die(mysql_error());
				if (!$qsimpanheader) {
					rollback();
					flash('example_message', '<p>Transaksi Gagal.</p>', 'w3-red');
					echo"<script>
						window.history.back();
					</script>";	
				}
				else
				{
					foreach ($chart as $row) {
						$qsimpandetail = mysql_query("INSERT INTO tb_detail_servis(no_transaksi,
																	kode_servis,
																	jenis,
																	seri,
																	keluhan,
																	kelengkapan,
																	kerusakan,
																	biaya,
																	garansi,
																	qty,
																	petugas,
																	timestmp)
															VALUES('$no_transaksi', 
																   '$row[kode_servis]', 
																   '$row[jenis]', 
																   '$row[seri]', 
																   '$row[keluhan]', 
																   '$row[kelengkapan]', 
																   '$row[kerusakan]', 
																   '$row[biaya]', 
																   '$row[garansi]', 
																   '$row[qty]',
																   '$row[petugas]',
																   '$row[timestmp]')") or die(mysql_error());
						if (!$qsimpandetail) {
							rollback();
							flash('example_message', '<p>Transaksi gagal.</p>', 'w3-red' );
							echo"<script>
								window.history.back();
							</script>";	
						}
					}

					commit();
					mysql_query("TRUNCATE TABLE tb_detail_servis_tmp");
					//header("location:../../med.php?mod=servis&act=printout&id=".$no_transaksi);
					echo"<script type='text/JavaScript'>
					location.replace('../../med.php?mod=servis&act=printout&id=".$no_transaksi."');
					</script>";
				}
				//commit();
			/*}
			else {
				flash('example_message', '<p>Pembayaran tidak cukup!</p>', 'w3-yellow');
				echo"<script>
					window.history.back();
				</script>";	
			}*/

				
		}
		else
		{
			flash('example_message', '<p>Tidak ada barang yang di servis!</p>', 'w3-red');
			echo"<script>
				window.history.back();
			</script>";	
		}
	}

	elseif ($mod == "servis" AND $act == "hapus") {
		if(isset($_SESSION['hapusservis']) AND $_SESSION['hapusservis'] <> 'TRUE')
		{
			echo"<div class='w3-container w3-red'><p>Dilarang mengakses file ini.</p></div>";
			die();
		}
		else
		{
			mysql_query("DELETE FROM tb_servis WHERE no_transaksi = '$_GET[id]'") or die(mysql_error());
			mysql_query("DELETE FROM tb_detail_servis WHERE no_transaksi = '$_GET[id]'") or die(mysql_error());
			flash('example_message', '<p>Berhasil menghapus data transaksi.</p>' );
			echo"<script>
				window.history.back();
			</script>";	
		}
			
	}
	
	elseif ($mod == "servis" AND $act == "hapus_unit_serrvis") {

			mysql_query("DELETE FROM tb_detail_servis WHERE no_transaksi = '$_GET[nt]' AND kode_servis='$_GET[ks]'") or die(mysql_error());
			flash('example_message', '<p>Berhasil menghapus data transaksi.</p>' );
			echo"<script>
				window.history.back();
			</script>";	
			
	}

	elseif ($mod == "servis" AND $act == "s_konfirmasi") { 
		$sqlstats1 = mysql_query("SELECT * FROM tb_servis WHERE no_transaksi = '$_GET[id]'");
		$rowstats1 = mysql_fetch_array($sqlstats1);
		$status1   = $rowstats1['status'];
		$tgl_today = date("d M Y");
		$update    = $status1."<br><b>TUNGGU KONFIRMASI USER</b> ".$tgl_today;
		mysql_query("UPDATE tb_servis SET status= '$update'
					WHERE no_transaksi = '$_GET[id]'") or die(mysql_error());

		echo"<script>
			window.history.back();
		</script>";	
	}

	elseif ($mod == "servis" AND $act == "s_progress") { 
		$sqlstats1 = mysql_query("SELECT * FROM tb_servis WHERE no_transaksi = '$_GET[id]'");
		$rowstats1 = mysql_fetch_array($sqlstats1);
		$status1   = $rowstats1['status'];
		$tgl_today = date("d M Y");
		$update    = $status1."<br><b>ON PROGRESS</b> ".$tgl_today;
		mysql_query("UPDATE tb_servis SET status= '$update'
					WHERE no_transaksi = '$_GET[id]'") or die(mysql_error());

		echo"<script>
			window.history.back();
		</script>";	
	}

	elseif ($mod == "servis" AND $act == "s_cancel") {
		$sqlstats1 = mysql_query("SELECT * FROM tb_servis WHERE no_transaksi = '$_GET[id]'");
		$rowstats1 = mysql_fetch_array($sqlstats1);
		$status1   = $rowstats1['status'];
		$tgl_today = date("d M Y");
		$update    = $status1."<br><b>CANCEL</b> ".$tgl_today; 
		mysql_query("UPDATE tb_servis SET status= '$update'
					WHERE no_transaksi = '$_GET[id]'") or die(mysql_error());

		echo"<script>
			window.history.back();
		</script>";	
	}

	elseif ($mod == "servis" AND $act == "s_selesai") { 
		$sqlstats1 = mysql_query("SELECT * FROM tb_servis WHERE no_transaksi = '$_GET[id]'");
		$rowstats1 = mysql_fetch_array($sqlstats1);
		$status1   = $rowstats1['status'];
		$tgl_today = date("d M Y");
		$update    = $status1."<br><b>SELESAI</b> ".$tgl_today;
		mysql_query("UPDATE tb_servis SET status= '$update'
					WHERE no_transaksi = '$_GET[id]'") or die(mysql_error());

		echo"<script>
			window.history.back();
		</script>";	
	}

	elseif ($mod == "servis" AND $act == "s_clear") { 
		mysql_query("UPDATE tb_servis SET status= ''
					WHERE no_transaksi = '$_GET[id]'") or die(mysql_error());

		echo"<script>
			window.history.back();
		</script>";	
	}

	elseif ($mod == "servis" AND $act == "ambil") { 
		$tgl_servis_keluar = date('Y-m-d');
		mysql_query("UPDATE tb_servis SET tgl_servis_keluar= '$tgl_servis_keluar'
					WHERE no_transaksi = '$_GET[id]'") or die(mysql_error());

		echo"<script>
			window.history.back();
		</script>";	
	}

	elseif ($mod == "servis" AND $act == "edit_servis") { 
		
		mysql_query("UPDATE tb_detail_servis SET jenis= '$_POST[jenis]',
										seri = '$_POST[seri]',
										keluhan = '$_POST[keluhan]',
										kelengkapan = '$_POST[kelengkapan]',
										kerusakan = '$_POST[kerusakan]',
										biaya = '$_POST[biaya]',
										garansi = '$_POST[garansi]',
										qty = '$_POST[qty]'
					WHERE no_transaksi = '$_POST[no_transaksi]' AND 
					kode_servis = '$_POST[kode_servis]'") or die(mysql_error());

		echo"<script>
			window.history.back();
		</script>";	
	}
	
	elseif ($mod == "servis" AND $act == "edit_data_servis") { 
	    
	
			$qpel = mysql_query("SELECT * FROM tb_pelanggan 
								WHERE kode_pelanggan = '".anti_inject($_POST['nama'])."'");

			if(mysql_num_rows($qpel) > 0)
			{
				$p = mysql_fetch_assoc($qpel);
				$kode_pel = $p['kode_pelanggan'];
				$nama_pelanggan = anti_inject($p['nama_pelanggan']);
			}
			else
			{
				$kode_pel = "";
				$nama_pelanggan = anti_inject($_POST['nama']);
			}
		
		mysql_query("UPDATE tb_servis SET kode_pelanggan = '$kode_pel',
		            nama_pelanggan = '$nama_pelanggan'
					WHERE no_transaksi = '$_POST[no_transaksi]'") or die(mysql_error());

		echo"<script>
			window.history.back();
		</script>";	
	}
	
	elseif ($mod == "servis" AND $act == "update_tambah_data_servis") { 
	    
			$kode_servis_sql = mysql_query("SELECT MAX(kode_servis) AS maks_kode FROM `tb_detail_servis` WHERE no_transaksi = '$_POST[no_transaksi]'");
            $kode_servis_row = mysql_fetch_array($kode_servis_sql);
			if($kode_servis_row['maks_kode'] > 0)
			{
				$kode_servis = $kode_servis_row['maks_kode'] + 1;
			}
			else
			{
				$kode_servis = '1';
			}
		
		mysql_query("INSERT INTO tb_detail_servis (no_transaksi, 
		                                                            kode_servis, 
		                                                            jenis,
																	seri,
																	keluhan,
																	kelengkapan,
																	kerusakan,
																	biaya,
																	garansi,
																	qty,
																	petugas,
																	timestmp)
															VALUES('$_POST[no_transaksi]',
															        '$kode_servis',
															        '$_POST[jenis]',
																	'$_POST[seri]',
																	'$_POST[keluhan]',
																	'$_POST[kelengkapan]',
																	'$_POST[kerusakan]',
																	'$_POST[biaya]',
																	'$_POST[garansi]',
																	'$_POST[qty]',
																	'$_SESSION[login_id]',
																	NOW())") or die(mysql_error());
				echo"<script>
					window.history.back();
				</script>";
	}

?>