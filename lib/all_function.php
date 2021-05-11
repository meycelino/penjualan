<?php
	date_default_timezone_set('Asia/Jakarta');

	function nama_m($id)
	{
		$sql = mysql_query("SELECT * FROM menu WHERE id_menu = '$id'") or die(mysql_error());
		$m = mysql_fetch_assoc($sql);

		return $m['nama_menu'];
	}

	function total_pembelian($no_faktur)
	{
		$sqlbeli = mysql_query("SELECT * FROM tb_detail_pembelian WHERE no_faktur = '$no_faktur'");
		$total = 0;
		while ($b = mysql_fetch_assoc($sqlbeli)) {
			$sub_total = $b['harga_beli'] * $b['qty'];

			$total = $total + $sub_total;
		}

		$rtotal = "Rp. ".number_format($total,0);
		return $rtotal;
	}

	function total_pengeluaran($no_faktur)
	{
		$sqlbeli = mysql_query("SELECT * FROM tb_detail_pengeluaran WHERE no_faktur = '$no_faktur'");
		$total = 0;
		while ($b = mysql_fetch_assoc($sqlbeli)) {
			$sub_total = $b['harga_beli'] * $b['qty'];

			$total = $total + $sub_total;
		}

		$rtotal = "Rp. ".number_format($total,0);
		return $rtotal;
	}

	function total_penjualan($no_transaksi)
	{
		$sqljual = mysql_query("SELECT * FROM tb_detail_penjualan WHERE no_transaksi = '$no_transaksi'");
		$total = 0;
		while ($b = mysql_fetch_assoc($sqljual)) {
			$harga_disc = $b['harga'] - (($b['harga'] * $b['disc']) / 100);
			$sub_total = $harga_disc * $b['qty'];

			$total = $total + $sub_total;
		}

		$rtotal = "Rp. ".number_format($total,0);
		return $rtotal;
	}

	
	function total_servis($no_transaksi)
	{
		$sqlservis = mysql_query("SELECT * FROM tb_detail_servis WHERE no_transaksi = '$no_transaksi'");
		$total = 0;
		while ($b = mysql_fetch_assoc($sqlservis)) {
			$sub_total = $b['biaya'] * $b['qty'];

			$total = $total + $sub_total;
		}

		$rtotal = "Rp. ".number_format($total,0);
		return $rtotal;
	}

	function nama_petugas($id)
	{
		$sql = mysql_query("SELECT * FROM user WHERE id_user = '$id'") or die(mysql_error());
		$m = mysql_fetch_assoc($sql);

		return $m['nama_lengkap'];
	}

	function nama_kategori($id)
	{
		$sql = mysql_query("SELECT nama_kategori FROM tb_kategori_barang 
							WHERE kategori_id = '$id'") or die(mysql_error());
		$m = mysql_fetch_assoc($sql);

		return $m['nama_kategori'];
	}

	function no_barang_auto()
	{
		$sql = mysql_query("SELECT MAX(RIGHT(kode_barang,5)) AS nobar 
							FROM tb_barang");
		$m = mysql_fetch_assoc($sql);

		$no = 0;
		if($m['nobar'] <> NULL)
		{
			$kd = number_format($m['nobar'],0) + 1;
			if(strlen($kd) == 1)
			{
				$no = "B"."0000".$kd;
			}
			elseif (strlen($kd) == 2) {
				$no = "B"."000".$kd;
			}
			elseif (strlen($kd) == 3) {
				$no = "B"."00".$kd;
			}
			elseif (strlen($kd) == 4) {
				$no = "B"."0".$kd;
			}
			else {
				$no = "B".$kd;
			}
		}
		else
		{
			$no = "B"."00001";
		}

		return $no;
	}


	function no_pelanggan_auto()
	{
		$sql = mysql_query("SELECT MAX(RIGHT(kode_pelanggan,5)) AS nopel 
							FROM tb_pelanggan ORDER BY kode_pelanggan DESC");
		$m = mysql_fetch_assoc($sql);

		$no = 0;
		if($m['nopel'] <> NULL)
		{
			$kd = number_format($m['nopel'],0) + 1;
			if(strlen($kd) == 1)
			{
				$no = "P"."0000".$kd;
			}
			elseif (strlen($kd) == 2) {
				$no = "P"."000".$kd;
			}
			elseif (strlen($kd) == 3) {
				$no = "P"."00".$kd;
			}
			elseif (strlen($kd) == 4) {
				$no = "P"."0".$kd;
			}
			else {
				$no = "P".$kd;
			}
		}
		else
		{
			$no = "P"."00001";
		}

		return $no;
	}

	function no_supplier_auto()
	{
		$sql = mysql_query("SELECT MAX(RIGHT(kode_supplier,5)) AS nosup 
							FROM tb_supplier");
		$m = mysql_fetch_assoc($sql);

		$no = 0;
		if($m['nosup'] <> NULL)
		{
			$kd = number_format($m['nosup'],0) + 1;
			if(strlen($kd) == 1)
			{
				$no = "S"."0000".$kd;
			}
			elseif (strlen($kd) == 2) {
				$no = "S"."000".$kd;
			}
			elseif (strlen($kd) == 3) {
				$no = "S"."00".$kd;
			}
			elseif (strlen($kd) == 4) {
				$no = "S"."0".$kd;
			}
			else {
				$no = "S".$kd;
			}
		}
		else
		{
			$no = "S"."00001";
		}

		return $no;
	}

	function no_kwitansi_auto()
	{
		$sql = mysql_query("SELECT MAX(RIGHT(no_transaksi,5)) AS notrans 
							FROM tb_penjualan WHERE tgl_transaksi = '".date('Y-m-d')."'");
		$m = mysql_fetch_assoc($sql);

		$no = 0;
		if($m['notrans'] <> NULL)
		{
			$kd = number_format($m['notrans'],0) + 1;
			if(strlen($kd) == 1)
			{
				$no = "CA".date('dmy')."0000".$kd;
			}
			elseif (strlen($kd) == 2) {
				$no = "CA".date('dmy')."000".$kd;
			}
			elseif (strlen($kd) == 3) {
				$no = "CA".date('dmy')."00".$kd;
			}
			elseif (strlen($kd) == 4) {
				$no = "CA".date('dmy')."0".$kd;
			}
			else {
				$no = "CA".date('dmy').$kd;
			}
		}
		else
		{
			$no = "CA".date('dmy')."00001";
		}

		return $no;
	}

	function no_servis_auto()
	{
		$sql = mysql_query("SELECT MAX(RIGHT(no_transaksi,5)) AS notrans 
							FROM tb_servis WHERE tgl_servis_masuk = '".date('Y-m-d')."'");
		$m = mysql_fetch_assoc($sql);

		$no = 0;
		if($m['notrans'] <> NULL)
		{
			$kd = number_format($m['notrans'],0) + 1;
			if(strlen($kd) == 1)
			{
				$no = "SER".date('dmy')."0000".$kd;
			}
			elseif (strlen($kd) == 2) {
				$no = "SER".date('dmy')."000".$kd;
			}
			elseif (strlen($kd) == 3) {
				$no = "SER".date('dmy')."00".$kd;
			}
			elseif (strlen($kd) == 4) {
				$no = "SER".date('dmy')."0".$kd;
			}
			else {
				$no = "SER".date('dmy').$kd;
			}
		}
		else
		{
			$no = "SER".date('dmy')."00001";
		}

		return $no;
	}

	function no_pengeluaran_auto()
	{
		$sql = mysql_query("SELECT MAX(RIGHT(no_faktur,5)) AS notrans 
							FROM tb_pengeluaran WHERE tgl_beli = '".date('Y-m-d')."'");
		$m = mysql_fetch_assoc($sql);

		$no = 0;
		if($m['notrans'] <> NULL)
		{
			$kd = number_format($m['notrans'],0) + 1;
			if(strlen($kd) == 1)
			{
				$no = "OUT".date('dmy')."0000".$kd;
			}
			elseif (strlen($kd) == 2) {
				$no = "OUT".date('dmy')."000".$kd;
			}
			elseif (strlen($kd) == 3) {
				$no = "OUT".date('dmy')."00".$kd;
			}
			elseif (strlen($kd) == 4) {
				$no = "OUT".date('dmy')."0".$kd;
			}
			else {
				$no = "OUT".date('dmy').$kd;
			}
		}
		else
		{
			$no = "OUT".date('dmy')."00001";
		}

		return $no;
	}

	function no_pembelian_auto()
	{
		$sql = mysql_query("SELECT MAX(RIGHT(no_faktur,5)) AS notrans 
							FROM tb_pembelian WHERE tgl_beli = '".date('Y-m-d')."'");
		$m = mysql_fetch_assoc($sql);

		$no = 0;
		if($m['notrans'] <> NULL)
		{
			$kd = number_format($m['notrans'],0) + 1;
			if(strlen($kd) == 1)
			{
				$no = "BEL".date('dmy')."0000".$kd;
			}
			elseif (strlen($kd) == 2) {
				$no = "BEL".date('dmy')."000".$kd;
			}
			elseif (strlen($kd) == 3) {
				$no = "BEL".date('dmy')."00".$kd;
			}
			elseif (strlen($kd) == 4) {
				$no = "BEL".date('dmy')."0".$kd;
			}
			else {
				$no = "BEL".date('dmy').$kd;
			}
		}
		else
		{
			$no = "BEL".date('dmy')."00001";
		}

		return $no;
	}

	function stok_masuk($id)
	{
		$sql = mysql_query("SELECT qty FROM tb_detail_pembelian WHERE kode_barang = '$id'");
		$total = 0;
		while ($q = mysql_fetch_assoc($sql)) {
			$total = $total + $q['qty'];
		}
		return $total;
	}

	function stok_keluar($id)
	{
		$sql = mysql_query("SELECT qty FROM tb_detail_penjualan WHERE kode_barang = '$id'");
		$total = 0;
		while ($q = mysql_fetch_assoc($sql)) {
			$total = $total + $q['qty'];
		}
		return $total;
	}

	function stok_retur_jual($id)
	{
		$sql = mysql_query("SELECT qty FROM tb_retur_penjualan WHERE kode_barang = '$id'");
		$total = 0;
		while ($q = mysql_fetch_assoc($sql)) {
			$total = $total + $q['qty'];
		}
		return $total;
	}

	function stok_retur_beli($id)
	{
		$sql = mysql_query("SELECT qty FROM tb_retur_pembelian WHERE kode_barang = '$id'");
		$total = 0;
		while ($q = mysql_fetch_assoc($sql)) {
			$total = $total + $q['qty'];
		}
		return $total;
	}

	function anti_inject($data)
	{
		$filter_sql = stripslashes(strip_tags(htmlspecialchars($data,ENT_QUOTES)));
		return $filter_sql;
	}



?>