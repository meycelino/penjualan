<?php
	date_default_timezone_set("Asia/Jakarta");
	$sqltrans = mysql_query("SELECT * FROM tb_penjualan AS a LEFT JOIN tb_pelanggan AS b
	ON a.`kode_pelanggan`=b.`kode_pelanggan` WHERE no_transaksi = '$_GET[id]'") or die(mysql_error());
	$tra = mysql_fetch_assoc($sqltrans);
?>
<h4 class="w3-text-blue" style="padding-bottom:0;margin-bottom:0;"><b>CV. GUNUNGMEDIA COMPUTER</b></h4>
<div class="w3-row">
	<div class="w3-col s6 w3-tiny">
		PENJUALAN - SERVICE - PENGADAAN BARANG/JASA - KURSUS <br>
		Jalan Beliang Toko GUNUNGMEDIA COMPUTER (Samping Jalan Bukit Raya X) - Kota Palangka Raya<br>
		Hp / Wa : 0822 5352 9596 / 0852 4848 7470<br>
	</div>
	<div class="w3-col s6 w3-tiny">
		<span class="w3-right">
		Menjual : Laptop, Komputer, Printer, Jaringan, Fingerprint, CCTV, Elektronik, Spare Part, dll<br>
		Melayani : Servis Laptop, Komputer, Printer, Pemasangan Jaringan, Software, dll<br></span>
	</div>
</div>
<div style="border-bottom:3px solid #ccc;"></div>
<center><h5>KWITANSI PEMBAYARAN</h5></center>
<?php
	echo"<div class='w3-tiny'>
	<b>NO : #$tra[no_transaksi]</b><br>
	Kepada Yth, <br>
	$tra[nama_pelanggan] / "?><?php echo !empty($tra['kode_pelanggan']) ? $tra['nomor_telp'] : "-"; ?>
	<?php echo"</div>
	<div style='height:5px;'></div>";

	echo"<table class='w3-table w3-tiny w3-hoverable w3-bordered tbl' cellpadding='0'>
		<thead>
		<tr class='w3-light-grey'>
			<th>#</th>
			<th>KODE</th>
			<th>BARANG</th>
			<th>HARGA</th>
			<th>DISC.</th>
			<th colspan='2'>SUB TOTAL</th>
		</tr>
		</thead>

		<tbody>";

	$sql = mysql_query("SELECT a.*, b.nama_barang, b.satuan 
						FROM tb_detail_penjualan a LEFT JOIN tb_barang b 
						ON a.kode_barang = b.kode_barang
						WHERE a.no_transaksi = '$_GET[id]'") or die(mysql_error());
	$sub_total = 0;
	$total = 0;
	$no = 1;
	while($p = mysql_fetch_assoc($sql))
	{
		$harga_disc = $p['harga'] - (($p['harga'] * $p['disc']) / 100);
		$sub_total = $harga_disc * $p['qty'];

		$total = $total + $sub_total;
		echo"<tr>
			<td>$no</td>
			<td>$p[kode_barang]</td>
			<td>$p[nama_barang]</td>
			<td>Rp. ".number_format($p['harga'],0)." X $p[qty] $p[satuan]</td>
			<td>".number_format($p['disc'],0)."%</td>
			<td>Rp. ".number_format($sub_total)."</td>
		</tr>";

		$no++;
	}
	$total_bayar = $total - $tra['potongan'];
	$sisa = $tra['bayar'] - $total_bayar;

	echo"</tbody>
		<tfoot>
		<tr>
			<td colspan='5'>Total Harga</b></td>
			<td>Rp. ".number_format($total)."</td>
		</tr>
		<tr>
			<td colspan='5'>Potongan Harga</td>
			<td>Rp. ".number_format($tra['potongan'])."</td>
		</tr>
		<tr>
			<td colspan='5'><b>Total Bayar</b></td>
			<td><b>Rp. ".number_format($total_bayar)."</b></td>
		</tr>
		<tr>
			<td colspan='5'><b>Pembayaran</b></td>
			<td><b>Rp. ".number_format($tra['bayar'])."</b></td>
		</tr>
		<tr>
			<td colspan='5'><b>Kembali</b></td>
			<td><b>Rp. ".number_format($sisa)."</b></td>
		</tr>
		</tfoot>
	</table>";

?>
<br>
<div class="w3-row-padding w3-tiny">
	<div class="w3-col s8">
		<div class="w3-border w3-padding" style="font-size:6px;text-align:justify;">
			    * Terimakasih atas kepercayaan anda berbelanja di toko kami <br>
				* Barang yang sudah dibeli tidak dapat dikembalikan, kecuali ada perjanjian sebelumnya <br>
				* Titipan service yang tidak diambil dalam jangka 1 tahun bukan menjadi tanggung jawab kami <br>
				* Sampaikan keluhan anda melalui 085248487470 Kritik dan saran anda sangat kami harapkan untuk perbaikan pelayanan kami<br>
		</div>

	</div>

	

	<div class="w3-col s4 w3-center">
		<p>Palangka Raya, <?php echo date('d-m-Y', strtotime($tra['tgl_transaksi'])); ?>
		<br>Hormat Kami,</p>
		<br>
		<br>

		<p>( _________________________ )</p>
	</div>

</div>