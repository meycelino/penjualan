<?php

		date_default_timezone_set('Asia/Jakarta');
		session_start();
		include"../../lib/conn.php";
		include"../../lib/all_function.php";
		include"../../lib/fungsi_transaction.php";
	
	$act=$_POST['act'];
	if ($act=="simpan_pembayaran") {
		//Get For Log
		
		$in1=mysql_query("UPDATE tb_servis SET bayar= '".$_POST['pembayaran']."',
											potongan= '".$_POST['potongan']."'
					WHERE no_transaksi = '".$_POST['no_trans']."'");


		
		if ($in1){
				echo "yes";
			}else{
				echo "no";
			}
	}
?>