<?php
	date_default_timezone_set("Asia/Jakarta");
	$sqltrans = mysql_query("SELECT * FROM `tb_servis` AS a LEFT JOIN tb_pelanggan AS b
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
<center><h5>NOTA TITIPAN SERVICE</h5></center>
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
			<th>NAMA UNIT</th>
			<th>KELUHAN</th>
			<th>KELENGKAPAN</th>
			<th>KERUSAKAN</th>
		</tr>
		</thead>

		<tbody>";

	$sql = mysql_query("SELECT * FROM tb_detail_servis 
						WHERE no_transaksi = '$_GET[id]'") or die(mysql_error());
	$no = 1;
	while($p = mysql_fetch_assoc($sql))
	{
		echo"<tr>
			<td>$no</td>
			<td>$p[jenis] $p[seri]</td>
			<td>$p[keluhan]</td>
			<td>$p[kelengkapan]</td>
			<td>$p[kerusakan]</td>
		</tr>";

		$no++;
	}

	echo"</tbody>
		<tfoot>
		<tr>
			<td colspan='6'><i>Informasi perkembangan status servisan akan kami kabari via SMS/WA, Terimakasih.</i></td>
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
		<p>Palangka Raya, <?php echo date('d-m-Y', strtotime($tra['tgl_servis_masuk'])); ?>
		<br>Hormat Kami,</p>
		<br>
		<br>

		<p>( <?php echo nama_petugas($_SESSION['login_id']); ?> )</p>
	</div>

</div>