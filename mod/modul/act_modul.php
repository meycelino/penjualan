<?php
	session_start();
	include"../../lib/conn.php";

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

	if($mod == "modul" AND $act == "simpan")
	{
		mysql_query("INSERT INTO modul(id_menu, nama_modul, link_menu, posisi, icon_menu)
									VALUES ('$_POST[id_menu]', '$_POST[nama_modul]', '$_POST[link_menu]', '$_POST[posisi]', '$_POST[icon_menu]')") or die(mysql_error());
		flash('example_message', '<p>Berhasil menambah data biaya.</p>' );

		echo"<script>
			window.history.go(-2);
		</script>";
	}

	elseif ($mod == "modul" AND $act == "edit") 
	{
		mysql_query("UPDATE modul SET id_menu= '$_POST[id_menu]', nama_modul= '$_POST[nama_modul]', link_menu= '$_POST[link_menu]', posisi= '$_POST[posisi]', icon_menu= '$_POST[icon_menu]' WHERE id_modul = '$_POST[id]'") or die(mysql_error());

		flash('example_message', '<p>Berhasil mengubah data biaya.</p>');

		echo"<script>
			window.history.go(-2);
		</script>";
	}

	elseif ($mod == "modul" AND $act == "hapus") 
	{
		mysql_query("DELETE FROM modul WHERE id_modul = '$_GET[id]'") or die(mysql_error());
		flash('example_message', '<p>Berhasil menghapus data.</p>' );
		echo"<script>
			window.history.back();
		</script>";	
	}

?>