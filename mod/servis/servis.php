
<script>
$(document).ready(function () {
	//Klik mk
	$(".input_text2").click(function () {
		id=$(this).attr("id")
		$("#"+id).select()
	})
	
	$(".input_text2").keyup(function () {
		no=$(this).attr("name")

		total_bayar=parseFloat(Number($("#total_bayar"+no).val()))
		potongan=parseFloat(Number($("#potongan"+no).val()))
		total_biaya=parseFloat(Number(total_bayar))-parseFloat(Number(potongan))

		$("#total_biaya"+no).val(total_biaya)



		total_biaya=parseFloat(Number($("#total_biaya"+no).val()))

		pembayaran=parseFloat(Number($("#pembayaran"+no).val()))
		
		jml=parseFloat(Number(pembayaran))-parseFloat(Number(total_biaya))

		
		$("#sisa"+no).val(jml)
		
		$("#msgbox"+no).removeClass().addClass('messagebox').html("<img src='ajax-loader.gif' width='20px' height='20px'>").fadeIn(500);
		
		
		$.post("mod/servis/servis_kelola.php",{act:"simpan_pembayaran",
								  no_trans:$("#no_trans"+no).val(),
								  potongan:$("#potongan"+no).val(),
								  pembayaran:$("#pembayaran"+no).val(),
								  total_biaya:$("#total_biaya"+no).val(),
								  sisa:$("#sisa"+no).val(),
								 },function (data) {
									//alert(data)
									if (data=="yes"){
										$("#msgbox"+no).fadeTo(300,1.5,function() { 
												$(this).html("<img src='icon/oke.png' width='20px' height='20px' title='Proses Simpan Berhasil'>").addClass('messageboxok').css({"color":"blue"})
											})
									}else{
										//alert (data)
										$("#msgbox"+no).fadeTo(300,1.5,function() { 
												$(this).html("<img src='icon/no.png' width='20px' height='20px' title='Proses Simpan Gagal'>").addClass('messageboxok').css({"color":"blue"})
											})
									}
								 })
		
	})
})
</script>

<?php
	if(!isset($_SESSION['login_user'])){
		header('location: ../../login.php'); // Mengarahkan ke Home Page
	}

	//link buat paging
	$linkaksi = 'med.php?mod=servis';

	if(isset($_GET['act']))
	{
		$act = $_GET['act'];
		$linkaksi .= '&act='.$act;
	}
	else
	{
		$act = '';
	}

	$aksi = 'mod/servis/act_servis.php';

	switch ($act) {
		default:
			echo"<div class='w3-container w3-small w3-pale-green w3-leftbar w3-border-green'>
				<h4 style='margin-bottom:0;padding-bottom:0;'>Transaksi Servis</h4>
				<p style='margin-top:0;padding-top:0;'><i>Menu Transaksi Servis Baru</i></p>
			</div>";

			flash('example_message');


				echo"<div class='w3-row-padding'>
				<div class='w3-col s3 w3-card'>
					Input Servisan
					<div style='border-bottom:1px dashed #ccc;'></div><br>

					<div class='w3-card-2 w3-light-blue'>
						<form action='$aksi?mod=servis&act=add' method='POST' class='w3-container'>
							<br>
						    <label class='w3-label w3-text-black'>Jenis :</label>
							<select name='jenis' class='w3-select'>
								<option value='LAPTOP'>LAPTOP</option>
								<option value='KOMPUTER'>KOMPUTER</option>
								<option value='PRINTER'>PRINTER</option>
								<option value='LAINNYA'>LAINNYA</option>
							</select>

							<label class='w3-label w3-text-black'>Seri / Model :</label>
							<input type='text' name='seri' id='seri' placeholder='ketik Seri / Model ...' class='w3-input w3-tiny w3-border-0' required>

							<label class='w3-label w3-text-black'>Keluhan :</label>
							<textarea name='keluhan' id='keluhan' placeholder='Keluhan Kerusakan dari Konsumen' class='w3-input w3-border-0 w3-tiny'></textarea>

							<label class='w3-label w3-text-black'>Kelengkapan :</label>
							<input type='text' name='kelengkapan' id='kelengkapan' placeholder='charger / tas / dll ...' class='w3-input w3-tiny w3-border-0' required>

							<label class='w3-label w3-text-black'>Kerusakan :</label>
							<textarea name='kerusakan' id='kerusakan' placeholder='Diagnosa Kerusakan' class='w3-input w3-border-0 w3-tiny'></textarea>

							<label class='w3-label w3-text-black'>Biaya Servis (Rp):</label>
							<input type='text' name='biaya' id='biaya' placeholder='50000' class='w3-input w3-tiny w3-border-0' required>

							<label class='w3-label w3-text-black'>Garansi :</label>
							<input type='text' name='garansi' id='garansi' placeholder='1 Minggu / 1 Bulan ....' class='w3-input w3-tiny w3-border-0' required>
							<p>
							<div class='w3-row'>
								<div class='w3-col s8'><label class='w3-label w3-text-black w3-right'>QTY:</label></div>
								<div class='w3-col s4'>
									<input type='number' name='qty' id='qty' value='1' class='w3-input w3-tiny w3-border-0' required>
								</div>
							</div>
							</p>

							<p><button class='w3-btn w3-red' style='width:100%;' onclick=\"return confirm('Klik OK untuk melanjutkan');\"><i class='fa fa-cart-plus'></i> Tambah Servisan</button></p>
						</form>
					</div>

					<br>
				</div>
				<div class='w3-col s9'>
					Data Servisan
					<div style='border-bottom:1px dashed #ccc;'></div>";


					echo"<br><table class='w3-table w3-tiny w3-hoverable w3-bordered tbl'>
						<thead>
						<tr class='w3-blue'>
							<th>#</th>
							<th>JENIS - SERI</th>
							<th>KELUHAN</th>
							<th>KELENGKAPAN</th>
							<th>KERUSAKAN</th>
							<th>GARANSI</th>
							<th>BIAYA x QTY</th>
							<th colspan='2'>SUB TOTAL</th>
						</tr>
						</thead>

						<tbody>";

					$sql = mysql_query("SELECT a.*
										FROM tb_detail_servis_tmp a 
										WHERE a.petugas = '$_SESSION[login_id]' 
										ORDER BY timestmp ASC") or die(mysql_error());
					$total_harga = 0;
					if(mysql_num_rows($sql) > 0)
					{
						$no = 1;
						while($p = mysql_fetch_assoc($sql))
						{
							$sub_total = $p['biaya'] * $p['qty'];
							$total_harga = $total_harga + $sub_total;
							echo"<tr>
								<td>$no</td>
								<td>$p[jenis] - $p[seri]</td>
								<td>$p[keluhan]</td>
								<td>$p[kelengkapan]</td>
								<td>$p[kerusakan]</td>
								<td>$p[garansi]</td>
								<td>Rp. ".number_format($p['biaya'],0)." X $p[qty]</td>
								<td>Rp. ".number_format($sub_total)."</td>
								<td><a href='$aksi?mod=servis&act=batal&id=$p[kode_servis]' onclick=\"return confirm('Yakin ingin membatalkan?');\"><i class='fa fa-close w3-tiny w3-text-grey'></i></a></td>
							</tr>";

							$no++;
						}

					}
						
					else
					{
						echo"<tr>
							<td colspan='5'><i>Tidak ada data</a><td>
						</tr>";
					}
					
					echo"</tbody>
						<tfoot>
						<tr class='w3-light-grey'>
							<td colspan='7'><b>TOTAL BIAYA</td>
							<td colspan='2'>Rp. ".number_format($total_harga)."</td>
						</tr>
						</tfoot>
					</table>";

					echo "
					<div class='w3-row-padding'>
					<form action='$aksi?mod=servis&act=simpan' method='POST'>
						<div class='w3-col s7'>
						<table>
						<tr>
							<td colspan='3'>Potongan Harga (Rp.)</td>
							<td colspan='3'><input type='text' name='potongan' id='potongan' class='w3-input w3-border w3-tiny w3-left' value='0'></td>
						</tr>
						<tr style='border-top:1px dashed #ccc;'>
							<td colspan='2'>Total Bayar<td>
							<td colspan='4'><b class='w3-text-red w3-small w3-left'>Rp. <span id='tot'>0</span></b></td>
						</tr>
						</table>

						</div>
						
						<div class='w3-col s5'>

						

							

							<input type='hidden' name='potongan2' id='potongan2' value='0'>
							<input type='hidden' name='total' id='total' value='"?><?php echo isset($total_harga) ? $total_harga : 0; ?><?php echo"'>
								
								<input type='hidden' name='jmlbayar2' id='bayar2'>
							    
								<label class='w3-label w3-text-red'>Bayar (Rp):</label>
								<input type='text' name='jmlbayar' id='bayar' class='w3-input w3-tiny' >

								<label class='w3-label w3-tiny'>Nama Pelanggan :</label>
								<input type='text' name='nama' id='nama' class='w3-input w3-tiny' placeholder='ketik Nama Pelanggan ...' >

								

								<label class='w3-label w3-tiny'>Tanggal Servisan Masuk :</label>
								<input type='text' name='tgl_servis_masuk' class='w3-input w3-tiny dp' value='".date('Y-m-d')."' >


								<p><button class='w3-btn w3-right w3-tiny' onclick=\"return confirm('Klik OK untuk melanjutkan');\"><i class='fa fa-save'></i> Simpan Transaksi</button></p>
							</form>
						</div>
						
					</div>


				</div>
		</div>";



		break;


		case "printout" :
				
			if(isset($_GET['id']))
			{
				echo"<div class='w3-container w3-small w3-pale-green w3-leftbar w3-border-green'>
					<h4 style='margin-bottom:0;padding-bottom:0;'>Printout Servisan</h4>
					<p style='margin-top:0;padding-top:0;'><i>Data Servisan</i></p>
				</div><br>

				<div class='w3-container w3-padding-4 w3-tiny w3-pale-red'>
					<p><i>Jika terjadi kesalahan harap lapor Administrator.</i></p>
				</div>";

				$sqltrans = mysql_query("SELECT * FROM tb_servis WHERE no_transaksi = '$_GET[id]'") or die(mysql_error());
				$tra = mysql_fetch_assoc($sqltrans);

				echo"<table class='w3-table w3-tiny'>
					<tr style='border-bottom:1px dashed #ccc;'>
						<td width='150px'>No. Transaksi</td>
						<td width='10px'>:</td>
						<td><b>$tra[no_transaksi]</b></td>
					</tr>

					<tr style='border-bottom:1px dashed #ccc;'>
						<td>Nama Pelanggan</td>
						<td>:</td>
						<td><b>$tra[nama_pelanggan] / "?><?php echo !empty($tra['kode_pelanggan']) ? $tra['kode_pelanggan'] : "-  "; ?><?php echo"</b>
						
						</td>
					</tr>

					<tr style='border-bottom:1px dashed #ccc;'>
						<td>Tanggal Transaksi</td>
						<td>:</td>
						<td><b>$tra[timestmp]</b></td>
					</tr>

					<tr style='border-bottom:1px dashed #ccc;'>
						<td>Tanggal Servis Masuk</td>
						<td>:</td>
						<td><b>$tra[tgl_servis_masuk]</b></td>
					</tr>

					

					<tr style='border-bottom:1px dashed #ccc;'>
						<td>Status</td>
						<td>:</td>
						<td>$tra[status] |
						<a href='$aksi?mod=servis&act=s_konfirmasi&id=$tra[no_transaksi]' onclick=\"return confirm('Yakin Merubah Status ?');\" class='w3-btn w3-dark-grey w3-tiny'> Konfirmasi</a>
						<a href='$aksi?mod=servis&act=s_progress&id=$tra[no_transaksi]' onclick=\"return confirm('Yakin Merubah Status ?');\" class='w3-btn w3-blue w3-tiny'> Progress</a>
						<a href='$aksi?mod=servis&act=s_cancel&id=$tra[no_transaksi]' onclick=\"return confirm('Yakin Merubah Status ?');\" class='w3-btn w3-red w3-tiny'> Cancel</a>
						<a href='$aksi?mod=servis&act=s_selesai&id=$tra[no_transaksi]' onclick=\"return confirm('Yakin Merubah Status ?');\" class='w3-btn w3-green w3-tiny'> Selesai</a>
						<a href='$aksi?mod=servis&act=s_clear&id=$tra[no_transaksi]' onclick=\"return confirm('Yakin ingin membersihkan status ?');\" class='w3-btn w3-yellow w3-tiny'> Clear</a>
						</td>
					</tr>

					<tr style='border-bottom:1px dashed #ccc;'>
						<td>Tanggal Servis Keluar</td>
						<td>:</td>
						<td><b>$tra[tgl_servis_keluar]</b> |
						<a href='$aksi?mod=servis&act=ambil&id=$tra[no_transaksi]' onclick=\"return confirm('Servisan di ambil?');\" class='w3-btn w3-yellow w3-tiny'> Ambil Servisan</a>
						</td>
					</tr>
				</table>
				<div style='height:10px;'></div>";

				echo"<h4>Detail Barang Servisan</h4>
				<table class='w3-table w3-tiny w3-hoverable w3-bordered tbl'>
					<thead>
					<tr class='w3-blue'>
						<th>#</th>
						<th>JENIS - SERI</th>
							<th>KELUHAN</th>
							<th>KELENGKAPAN</th>
							<th>KERUSAKAN</th>
							<th>GARANSI</th>
							<th>BIAYA x QTY</th>
							<th>SUB TOTAL</th>
							<th>#</th>
					</tr>
					</thead>

					<tbody>";

				$sql = mysql_query("SELECT a.*
									FROM tb_detail_servis a 
									WHERE a.no_transaksi = '$_GET[id]'") or die(mysql_error());
				$no_trans = $_GET['id'];
				$sub_total = 0;
				$total = 0;
				$no = 1;
				while($p = mysql_fetch_assoc($sql))
				{
					$sub_total = $p['biaya'] * $p['qty'];

					$total = $total + $sub_total;
					echo"<tr>
						<td>$no</td>
						<td>$p[jenis] - $p[seri]</td>
						<td>$p[keluhan]</td>
						<td>$p[kelengkapan]</td>
						<td>$p[kerusakan]</td>
						<td>$p[garansi]</td>
						<td>Rp. ".number_format($p['biaya'],0)." X $p[qty]</td>
						<td>Rp. ".number_format($sub_total)."</td>
						<td><a href='med.php?mod=servis&act=edit&nt=$no_trans&ks=$p[kode_servis]'><i class='fa fa-pencil-square w3-large w3-text-blue'></i></a>
						<a href='$aksi?mod=servis&act=hapus_unit_serrvis&nt=$no_trans&ks=$p[kode_servis]' onclick=\"return confirm('Yakin hapus data');\"><i class='fa fa-trash w3-large w3-text-red'></i></a>
						</td>
					</tr>";

					$no++;
				}
				$total_bayar = $total - $tra['potongan'];
				$sisa = $tra['bayar'] - $total_bayar;

				if ($sisa >= 0) {
					$sta = "Kembalian";
				} else {
					$sta = "Sisa Pembayaran";
				}

				echo"</tbody>
					<tfoot>
					<tr class='w3-light-grey'>
						<td colspan='7'>Total Harga</b></td>
						<td>Rp. ".number_format($total)."</td>
						<input type='hidden' class='input_text2' id='total_bayar$no' name='$no' value='$total' style='width:30%;'>
					</tr>
					<tr class='w3-light-grey'>
						<td colspan='7'>Potongan Harga</td>
						<td><input type='text' class='input_text2' id='potongan$no' name='$no' value='$tra[potongan]' style='width:30%;'>
					</tr>
					<tr class='w3-light-grey'>
						<td colspan='7'><b>Total Bayar</b></td>
						<td><input type='text' class='input_text2' id='total_biaya$no' name='$no' value='$total_bayar' style='width:30%;' readonly></td>
					</tr>
					<tr class='w3-light-grey'>
						<td colspan='7'><b>Pembayaran</b></td>
						<input type='hidden' class='input_text2' id='no_trans$no' name='$no' value='$no_trans' style='width:30%;'>
						<td><input type='text' class='input_text2' id='pembayaran$no' name='$no' value='$tra[bayar]' style='width:30%;'>
						"; ?>
						<span style='display:none' id='msgbox<?php echo $no;?>'></span></td>
						<?php echo "
					</tr>
					<tr class='w3-light-grey'>
						<td colspan='7'><b>$sta</b></td>
						<td><input type='text' class='input_text2' id='sisa$no' name='$no' value='$sisa' style='width:30%;' readonly></td>
					</tr>
					</tfoot>
				</table>

				<p>
					<button class='w3-btn w3-tiny' onclick=\"window.history.back()\"><i class='fa fa-mail-reply-all'></i> Back</button>
					<a href='med.php?mod=servis' class='w3-btn w3-red w3-tiny'><i class='fa fa-cart-plus'></i> Transaksi Baru</a>
					<a href='med.php?mod=servis&act=edit_tambah_dataservis&id=$_GET[id]' class='w3-btn w3-blue w3-tiny'><i class='fa fa-edit'></i> Tambah Unit Servisan</a>
					<a href='popup/popup_servis.php?mod=cetakkwitansi&id=$_GET[id]' class='w3-btn w3-dark-grey w3-tiny' target='_blank'><i class='fa fa-print'></i> Cetak Nota Titipan Service</a>
					<a href='popup/popup_servis_lunas.php?mod=cetakkwitansi&id=$_GET[id]' class='w3-btn w3-yellow w3-tiny' target='_blank'><i class='fa fa-print'></i> Cetak Kwitansi Lunas</a>
				</p>";

			}
		break;

		case 'edit':

			echo"<div class='w3-container w3-small w3-pale-green w3-leftbar w3-border-green'>
				<h4 style='margin-bottom:0;padding-bottom:0;'>Form Edit Servis</h4>
				<p style='margin-top:0;padding-top:0;'><i>Form Edit Item Servisan</i></p>
			</div>";

				$sql = mysql_query("SELECT a.*
									FROM tb_detail_servis a 
									WHERE a.no_transaksi = '$_GET[nt]' AND a.kode_servis = '$_GET[ks]'") or die(mysql_error());
				$p = mysql_fetch_assoc($sql);
			echo"<form class='w3-small' method='POST' action='$aksi?mod=servis&act=edit_servis'>
				
				<input type='hidden' name='no_transaksi' class='w3-input' value='$p[no_transaksi]'>
				<table>
					<tr>
						<td width='220px'><label class='w3-label'>KODE SERVIS</label></td>
						<td width='10px'>:</td>
						<td><input type='text' name='kode_servis' class='w3-input' value='$p[kode_servis]' readonly>
						</td>
						
					</tr>
					<tr>
						<td><label class='w3-label'>JENIS</label></td>
						<td>:</td>
						<td>
						<select name='jenis' class='w3-select'>
								<option value='$p[jenis]'>$p[jenis]</option>
								<option value=''> -- Pilih Jenis Perangkat --</option>
								<option value='LAPTOP'>LAPTOP</option>
								<option value='KOMPUTER'>KOMPUTER</option>
								<option value='PRINTER'>PRINTER</option>
								<option value='LAINNYA'>LAINNYA</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><label class='w3-label'>SERI</label></td>
						<td>:</td>
						<td><input type='text' name='seri' class='w3-input' value='$p[seri]'>
						</td>
					</tr>
					<tr>
						<td><label class='w3-label'>KELUHAN</label></td>
						<td>:</td>
						<td><textarea name='keluhan' class='w3-input'>$p[keluhan]</textarea>
						</td>
					</tr>
					<tr>
						<td><label class='w3-label'>KELENGKAPAN</label></td>
						<td>:</td>
						<td><textarea name='kelengkapan' class='w3-input'>$p[kelengkapan]</textarea>
						</td>
					</tr>
					<tr>
						<td><label class='w3-label'>KERUSAKAN</label></td>
						<td>:</td>
						<td><textarea name='kerusakan' class='w3-input'>$p[kerusakan]</textarea>
						</td>
					</tr>
					<tr>
						<td><label class='w3-label'>BIAYA</label></td>
						<td>:</td>
						<td><input type='text' name='biaya' class='w3-input' id='biaya' value='$p[biaya]'>
						</td>
					</tr>
					<tr>
						<td><label class='w3-label'>GARANSI</label></td>
						<td>:</td>
						<td><input type='text' name='garansi' class='w3-input' value='$p[garansi]'>
						</td>
					</tr>
					<tr>
						<td><label class='w3-label'>QTY</label></td>
						<td>:</td>
						<td><input type='text' name='qty' class='w3-input' value='$p[qty]'>
						</td>
					</tr>
					
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td align='right'><button type='submit' name='submit' value='simpan' class='w3-btn'><i class='fa fa-save'></i> Simpan Data</button>&nbsp;

						<button type='button' class='w3-btn w3-orange' onclick='history.back()'><i class='fa fa-rotate-left'></i> Kembali</button></td>
					</tr>
				</table>
					

			</form>";
			?>
				<script type="text/javascript">
					$(function()
					{
						$(".dp").datepicker({
							dateFormat : "yy-mm-dd",
							showAnim : "fold"
						});
					});
				</script>
			<?php
		break;


		case "list":
			echo"<div class='w3-container w3-small w3-pale-green w3-leftbar w3-border-green'>
				<h4 style='margin-bottom:0;padding-bottom:0;'>Data Transaksi Servisan</h4>
				<p style='margin-top:0;padding-top:0;'><i>Data Semua Transaksi Servisan</i></p>
			</div>";

			flash('example_message');

			echo"<table style='margin-top:12px;'>
				<tr>
					<td>
						<form class='w3-tiny' action='' method='GET'>	
							<input type='hidden' name='mod' value='servis'>
							<input type='hidden' name='act' value='list'>
							<div class='w3-row'>
								<div class='w3-col s1'>
									<label class='w3-label'>Search</label>
								</div>
								<div class='w3-col s2'>
									<select name='field' class='w3-select w3-padding'>
										<option value=''>- Pilih -</option>
										<option value='no_transaksi'>NO. TRANSAKSI</option>
										<option value='nama_pelanggan'>NAMA PELANGGAN</option>
									</select>
								</div>
								<div class='w3-col s4'>
									<input type='text' name='cari' class='w3-input' placeholder='cari ...'>
								</div>
								<div class='w3-col s1'>
									<button type='submit' class='w3-btn w3-tiny'><i class='fa fa-paper-plane'></i> GO</button>
								</div>
							</div>
						</form>
					</td>
					<td align='right'><a href='med.php?mod=servis&act=list' class='w3-btn w3-dark-grey w3-small'><i class='fa fa-refresh'></i> Refresh</a>
					</td>
				</tr>
				
			</table>";

			echo"<div style='margin-top:12px;margin-bottom:12px;'>
			<table class='w3-table w3-striped w3-bordered w3-tiny w3-hoverable tbl'>
				<thead>
					<tr class='w3-yellow'>
						<th>NO</th>
						<th>NO. TRANSAKSI</th>
						<th>KODE PEL.</th>
						<th>NAMA PELANGGAN</th>
						<th>TGL. SERVIS MASUK</th>
						<th>TGL. SERVIS KELUAR</th>
						<th>PETUGAS</th>
						<th>TOTAL</th>
						<th>PEMBAYARAN</th>
						<th>STATUS</th>
						<th>#</th>
					</tr>
				</thead>
				<tbody>";

				$p      = new Paging;
				$batas  = 10;
			    if(isset($_GET['show']) && is_numeric($_GET['show']))
				{
					$batas = (int)$_GET['show'];
					$linkaksi .="&show=$_GET[show]";
				}

				$posisi = $p->cariPosisi($batas);

				$query = "SELECT * FROM tb_servis ";

				$q 	= "SELECT * FROM tb_servis";

				if(!empty($_GET['field']))
				{
					$hideinp = "<input type='hidden' name='field' value='$_GET[field]'>
								<input type='hidden' name='cari' value='$_GET[cari]'>";

					$linkaksi .= "&field=$_GET[field]&cari=$_GET[cari]";

					$query .= " WHERE $_GET[field] LIKE '%$_GET[cari]%'";
					$q .= " WHERE $_GET[field] LIKE '%$_GET[cari]%'";
				}

				$query .= " ORDER BY timestmp DESC LIMIT $posisi, $batas";
				$q 	.= " ORDER BY timestmp DESC";
				

				$sql_kul = mysql_query($query);
				$fd_kul = mysql_num_rows($sql_kul);

				if($fd_kul > 0)
				{
					$no = $posisi + 1;
					while ($m = mysql_fetch_assoc($sql_kul)) {
						echo"<tr>
							<td>$no</td>
							<td><a class='w3-text-blue w3-hover-text-red' href='med.php?mod=servis&act=printout&id=$m[no_transaksi]'>$m[no_transaksi]</a></td>
							<td>$m[kode_pelanggan]</td>
							<td>$m[nama_pelanggan]</td>
							<td>$m[tgl_servis_masuk]</td>
							<td>$m[tgl_servis_keluar]</td>
							<td>".nama_petugas($m['petugas'])."</td>
							<td>".total_servis($m['no_transaksi'])."</td>
							<td>Rp. ".number_format($m['bayar'])."</td>
							<td>$m[status]</td>
							<td><a href='med.php?mod=servis&act=editdataservis&id=$m[no_transaksi]'><i class='fa fa-pencil-square w3-large w3-text-blue'></i></a> 
							<a href='$aksi?mod=servis&act=hapus&id=$m[no_transaksi]' onclick=\"return confirm('Yakin hapus data');\"><i class='fa fa-trash w3-large w3-text-red'></i></a>
							</td>
						
						</tr>";
						$no++;
					}
	

					$jmldata = mysql_num_rows(mysql_query($q));

					$jmlhalaman  = $p->jumlahHalaman($jmldata, $batas);
		    		$linkHalaman = $p->navHalaman($_GET['halaman'], $jmlhalaman, $linkaksi);
				}
				else
				{
					echo"<tr>
						<td colspan='8'><div class='w3-center'><i>Data Transaksi Not Found.</i></div></td>
					</tr>";
				}
				

				echo"</tbody>

			</table></div>";

			echo"<div class='w3-row'>
				<div class='w3-col s1'>
					<form class='w3-tiny' action='' method='GET'>
						<input type='hidden' name='mod' value='servis'>
						<input type='hidden' name='act' value='list'>";
						if(!empty($hideinp))
						{
							echo $hideinp;
						}
						echo"<select class='w3-select w3-border' name='show' onchange='submit()'>
							<option value=''>- Show -</option>";
							$i=10;
							while($i <= 100)
							{
								if(isset($_GET['show']) AND (int)$_GET['show'] == $i)
								{
									echo"<option value='$i' selected>$i</option>";	
								}
								else
								{
									echo"<option value='$i'>$i</option>";
								}

								$i+=10;
							}
						echo"</select>
					</form>
				</div>
				<div class='w3-col s11'>
					<ul class='w3-pagination w3-right w3-tiny'>
						$linkHalaman
					</ul>
				</div>
			</div>";
		break;
		
		case 'editdataservis':

			echo"<div class='w3-container w3-small w3-pale-green w3-leftbar w3-border-green'>
				<h4 style='margin-bottom:0;padding-bottom:0;'>Form Edit Servis</h4>
				<p style='margin-top:0;padding-top:0;'><i>Form Edit Item Servisan</i></p>
			</div>";

				$sql = mysql_query("SELECT *
									FROM tb_servis 
									WHERE no_transaksi = '$_GET[id]'") or die(mysql_error());
				$p = mysql_fetch_assoc($sql);
			echo"<form class='w3-small' method='POST' action='$aksi?mod=servis&act=edit_data_servis'>
				
				<input type='hidden' name='no_transaksi' class='w3-input' value='$p[no_transaksi]'>
				<table>
					<tr>
						<td width='220px'><label class='w3-label'>Nama Pelanggan :</label></td>
						<td width='10px'>:</td>
						<td><input type='text' name='nama' id='nama' class='w3-input' placeholder='ketik Nama Pelanggan ...' >
						</td>
					</tr>

					
					
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td align='right'><button type='submit' name='submit' value='simpan' class='w3-btn'><i class='fa fa-save'></i> Simpan Data</button>&nbsp;

						<button type='button' class='w3-btn w3-orange' onclick='history.back()'><i class='fa fa-rotate-left'></i> Kembali</button></td>
					</tr>
				</table>
					

			</form>";
			?>
				<script type="text/javascript">
					$(function()
					{
						$(".dp").datepicker({
							dateFormat : "yy-mm-dd",
							showAnim : "fold"
						});
					});
				</script>
			<?php
		break;
		
		case 'edit_tambah_dataservis':

			echo"<div class='w3-container w3-small w3-pale-green w3-leftbar w3-border-green'>
				<h4 style='margin-bottom:0;padding-bottom:0;'>Form Edit Servis</h4>
				<p style='margin-top:0;padding-top:0;'><i>Form Edit Item Servisan</i></p>
			</div>
			
			
			<div class='w3-card-2 w3-light-blue'>";
			
			$sql = mysql_query("SELECT *
									FROM tb_servis 
									WHERE no_transaksi = '$_GET[id]'") or die(mysql_error());
				$p = mysql_fetch_assoc($sql);
			echo"<form class='w3-container' method='POST' action='$aksi?mod=servis&act=update_tambah_data_servis'>
				
				<input type='hidden' name='no_transaksi' class='w3-input' value='$p[no_transaksi]'>
				
						
							<br>
						    <label class='w3-label w3-text-black'>Jenis :</label>
							<select name='jenis' class='w3-select'>
								<option value='LAPTOP'>LAPTOP</option>
								<option value='KOMPUTER'>KOMPUTER</option>
								<option value='PRINTER'>PRINTER</option>
								<option value='LAINNYA'>LAINNYA</option>
							</select>

							<label class='w3-label w3-text-black'>Seri / Model :</label>
							<input type='text' name='seri' id='seri' placeholder='ketik Seri / Model ...' class='w3-input w3-tiny w3-border-0' required>

							<label class='w3-label w3-text-black'>Keluhan :</label>
							<textarea name='keluhan' id='keluhan' placeholder='Keluhan Kerusakan dari Konsumen' class='w3-input w3-border-0 w3-tiny'></textarea>

							<label class='w3-label w3-text-black'>Kelengkapan :</label>
							<input type='text' name='kelengkapan' id='kelengkapan' placeholder='charger / tas / dll ...' class='w3-input w3-tiny w3-border-0' required>

							<label class='w3-label w3-text-black'>Kerusakan :</label>
							<textarea name='kerusakan' id='kerusakan' placeholder='Diagnosa Kerusakan' class='w3-input w3-border-0 w3-tiny'></textarea>

							<label class='w3-label w3-text-black'>Biaya Servis (Rp):</label>
							<input type='text' name='biaya' id='biaya' placeholder='50000' class='w3-input w3-tiny w3-border-0' required>

							<label class='w3-label w3-text-black'>Garansi :</label>
							<input type='text' name='garansi' id='garansi' placeholder='1 Minggu / 1 Bulan ....' class='w3-input w3-tiny w3-border-0' required>
							<p>
							<div class='w3-row'>
								<div class='w3-col s8'><label class='w3-label w3-text-black w3-right'>QTY:</label></div>
								<div class='w3-col s4'>
									<input type='number' name='qty' id='qty' value='1' class='w3-input w3-tiny w3-border-0' required>
								</div>
							</div>
							</p>

							<p><button class='w3-btn w3-red' style='width:100%;' onclick=\"return confirm('Klik OK untuk melanjutkan');\"><i class='fa fa-cart-plus'></i> Tambah Servisan</button></p>
						</form>
					</div>";

			?>
				<script type="text/javascript">
					$(function()
					{
						$(".dp").datepicker({
							dateFormat : "yy-mm-dd",
							showAnim : "fold"
						});
					});
				</script>
			<?php
		break;
		

	}

?>

<script type="text/javascript">
	$(function(){
		$("#pembayaran").number(true);
		$("#total_biaya").number(true);
		$("#sisa").number(true);

		$("#bayar").number(true);
		$("#potongan").number(true);

		$('#bayar').keyup(function(){
			var bayar = $('#bayar').val();
			$('#bayar2').val(bayar);
		});

		$('#potongan').keyup(function(){
			var potongan = $('#potongan').val();
			$('#potongan2').val(potongan);

			var total = $("#total").val();
			var pot = $("#potongan2").val();
			
			var tot_bayar = total - pot;
			if (tot_bayar > 0) {
				$("#tot").text(tot_bayar).number(true);
			}
			else
			{
				$("#tot").text(0);
			}
			console.log(tot_bayar);
		});
		
		<?php
			$sqlTags = mysql_query("SELECT * FROM tb_pelanggan 
								ORDER BY kode_pelanggan ASC") or die(mysql_error());

			$tags = array();
			while($t = mysql_fetch_assoc($sqlTags))
			{
				$tags[] = '{label : "'.$t['nama_pelanggan'].'", value : "'.$t['kode_pelanggan'].'"}';
			}
		?>
		var availableTags = [<?php echo implode(", \n\t\t\t", $tags); ?>];
	    $( "#nama" ).autocomplete({
	    	source: availableTags,
	    	select:function(event, ui) {
	    		$("#bayar").focus();
	    		console.log(ui.item.label);
	    	}
	    });
	});
</script>