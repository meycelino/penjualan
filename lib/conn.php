<?php

	/*
	$host = "maruta";
	$user = "guna9262";
	$pass = "d3iCdFEz1yvb56";
	$db = "guna9262_penjualan";
	*/

	$host = "localhost";
	$user = "root";
	$pass = "";
	$db = "guna9262_penjualan";

	$conn = mysql_connect($host, $user, $pass) or die("Tidak terkoneksi ke server!");
	if ($conn) {
		$dbselect = mysql_select_db($db, $conn) or die("Tidak terhubung ke Database.");
	}

	include"fungsi_flash.php";
?>