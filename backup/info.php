<!doctype html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>PDAM Way Sekampung</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-10 mx-auto">
				<div class="card mt-3">
					<div class="card-header bg-info">
					</div>
					<div class="card-body">
						<h4 class="text-center" style="color: #06283D;">Data Pelanggan</h4>
						<div class="table-responsive">
							<table class="table table-sm table-info table-bordered border-dark">
								<thead class="table-dark">
									<tr>
										<th scope="col" class="text-center align-middle">No Pel</th>
										<th scope="col" class="text-center align-middle">Nama</th>
										<th scope="col" class="text-center align-middle">Alamat</th>
										<th scope="col" class="text-center align-middle">Status</th>
										<th scope="col" class="text-center align-middle">Golongan</th>
										<th scope="col" class="text-center align-middle">Rayon</th>
										<th scope="col" class="text-center align-middle">Keterangan</th>
									</tr>
								</thead>
								<tbody>
									<?php
									//untuk meinclude kan koneksi
									include('config.php');

									//jika kita klik cari, maka yang tampil query cari ini
									if (isset($_GET['kata_cari'])) {
										//menampung variabel kata_cari dari form pencarian
										$kata_cari = $_GET['kata_cari'];

										//jika hanya ingin mencari berdasarkan kode_produk, silahkan hapus dari awal OR
										//jika ingin mencari 1 ketentuan saja query nya ini : SELECT * FROM produk WHERE kode_produk like '%".$kata_cari."%'
										$query = "SELECT * FROM v_tes WHERE pel_no like '%" . $kata_cari . "%' AND rek_sts=1 ORDER BY rek_byr_sts ASC LIMIT 1";
									} else {
										//jika tidak ada pencarian, default yang dijalankan query ini
										$query = "SELECT * FROM v_tes WHERE AND rek_sts=1 ORDER BY pel_no ASC";
									}

									$result = mysqli_query($koneksi, $query);

									if (!$result) {
										die("Query Error : " . mysqli_errno($koneksi) . " - " . mysqli_error($koneksi));
									}
									//kalau ini melakukan foreach atau perulangan
									while ($row = mysqli_fetch_assoc($result)) {
									?>
										<tr>
											<td scope="row" class="text-center align-middle"><?php echo $row['pel_no']; ?></td>
											<td scope="row" class="text-center align-middle"><?php echo $row['pel_nama']; ?></td>
											<td scope="row" class="text-center align-middle"><?php echo $row['pel_alamat']; ?></td>
											<td scope="row" class="text-center align-middle"><?php if ($row['kps_kode'] > 0) {
																									echo 'Non Aktif';
																								} else {
																									echo 'Aktif';
																								}  ?></td>
											<td scope="row" class="text-center align-middle"><?php echo $row['gol_kode']; ?></td>
											<td scope="row" class="text-center align-middle"><?php echo $row['dkd_kd']; ?></td>
											<td scope="row" class="text-center align-middle"><?php if ($row['rek_byr_sts'] <= 0) {
																									echo "Belum Lunas";
																								} else {
																									echo "Lunas";
																								} ?></td>
										</tr>
									<?php
									}
									?>
								</tbody>
							</table>
						</div>
						<h4 class="text-center" style="color: #06283D;">Rekening Sudah Terbayar</h4>
						<div class="table-responsive">
							<table class="table table-sm table-info table-bordered border-dark">
								<thead class="table-dark">
									<tr>
										<th scope="col" class="text-center align-middle">No.</th>
										<th scope="col" class="text-center align-middle">Bulan Tahun</th>
										<th scope="col" class="text-center align-middle">Tanggal Bayar</th>
										<th scope="col" class="text-center align-middle">Kasir</th>
										<th scope="col" class="text-center align-middle">Pemakaian Air (M3)</th>
										<th scope="col" class="text-center align-middle">Total</th>
									</tr>
								</thead>
								<tbody>
									<?php
									//untuk meinclude kan koneksi
									include('config.php');

									//jika kita klik cari, maka yang tampil query cari ini
									if (isset($_GET['kata_cari'])) {
										//menampung variabel kata_cari dari form pencarian
										$kata_cari = $_GET['kata_cari'];

										//jika hanya ingin mencari berdasarkan kode_produk, silahkan hapus dari awal OR
										//jika ingin mencari 1 ketentuan saja query nya ini : SELECT * FROM produk WHERE kode_produk like '%".$kata_cari."%' 
										$query2 = "SELECT * FROM v_tes WHERE pel_no like '%" . $kata_cari . "%' AND rek_byr_sts>0 AND rek_sts=1 ORDER BY rek_thn DESC, rek_bln DESC LIMIT 3";
									} else {
										//jika tidak ada pencarian, default yang dijalankan query ini
										$query2 = "SELECT * FROM v_tes WHERE rek_sts=1 LIMIT 3 ORDER BY pel_no ASC";
									}


									$result2 = mysqli_query($koneksi, $query2);

									setlocale(LC_TIME, 'id_ID.utf8');
									date_default_timezone_set('Asia/Jakarta');

									function tanggal_indo($tanggal, $cetak_hari = false)
									{
										$hari = array(
											1 =>    'Senin',
											'Selasa',
											'Rabu',
											'Kamis',
											'Jumat',
											'Sabtu',
											'Minggu'
										);

										$bulan = array(
											1 =>   'Januari',
											'Februari',
											'Maret',
											'April',
											'Mei',
											'Juni',
											'Juli',
											'Agustus',
											'September',
											'Oktober',
											'November',
											'Desember'
										);
										$split 	  = explode('-', $tanggal);
										$tgl_indo = $split[2] . ' ' . $bulan[(int)$split[1]] . ' ' . $split[0];

										if ($cetak_hari) {
											$num = date('N', strtotime($tanggal));
											return $hari[$num] . ', ' . $tgl_indo;
										}
										return $tgl_indo;
									}

									function rupiah($angka)
									{

										$hasil_rupiah = number_format($angka);
										return $hasil_rupiah;
									}

									$no = 1;

									if (!$result2) {
										die("Query Error : " . mysqli_errno($koneksi) . " - " . mysqli_error($koneksi));
									}
									//kalau ini melakukan foreach atau perulangan
									while ($row2 = mysqli_fetch_assoc($result2)) {
									?>
										<tr>
											<td scope="row" class="text-center align-middle"><?php echo $no++; ?></td>
											<td scope="row" class="align-middle"><?php
																					$bulan = array(
																						1 =>   'Januari',
																						'Februari',
																						'Maret',
																						'April',
																						'Mei',
																						'Juni',
																						'Juli',
																						'Agustus',
																						'September',
																						'Oktober',
																						'November',
																						'Desember'
																					);
																					echo $bulan[$row2['rek_bln']];
																					echo ' ', $row2['rek_thn']; ?></td>
											<td scope="row" class="align-middle"><?php
																					$tanggal = date('Y-m-d', strtotime($row2['byr_tgl']));
																					echo tanggal_indo($tanggal, true);
																					?></td>
											<td scope="row" class="text-center align-middle"><?php echo $row2['kar_nama']; ?></td>
											<td scope="row" class="text-end align-middle"><?php
																							$kini = $row2['rek_stankini'];
																							$lalu = $row2['rek_stanlalu'];

																							echo $pakai = $kini - $lalu; ?></td>
											<td scope="row" class="text-end align-middle"><?php
																							$air = $row2['rek_total'];
																							$denda = $row2['rek_denda'];
																							$materai = $row2['rek_materai'];

																							echo rupiah($total = $air + $denda + $materai);
																							?></td>
										</tr>
									<?php
									}
									?>
								</tbody>
							</table>
						</div>
						<h4 class="text-center" style="color: #06283D;">Rekening Belum Terbayar</h4>
						<div class="table-responsive">
							<table class="table table-sm table-info table-bordered border-dark">
								<thead class="table-dark">
									<tr>
										<th rowspan="2" scope="col" class="text-center align-middle">No.</th>
										<th rowspan="2" scope="col" class="text-center align-middle">Bulan Tahun</th>
										<th colspan="3" scope="col" class="text-center align-middle">Stand Meter</th>
										<th colspan="4" scope="col" class="text-center align-middle">Rincian Biaya</th>
										<th rowspan="2" scope="col" class="text-center align-middle">Total</th>
									</tr>
									<tr>
										<th class="text-center align-middle">Lalu</th>
										<th class="text-center align-middle">Kini</th>
										<th class="text-center align-middle">Pemakaian Air (M3)</th>
										<th class="text-center align-middle">Uang Air</th>
										<th class="text-center align-middle">ADM</th>
										<th class="text-center align-middle">Materai</th>
										<th class="text-center align-middle">Denda</th>
									</tr>
								</thead>
								<tbody>
									<?php
									//untuk meinclude kan koneksi
									include('config.php');

									//jika kita klik cari, maka yang tampil query cari ini
									if (isset($_GET['kata_cari'])) {
										//menampung variabel kata_cari dari form pencarian
										$kata_cari = $_GET['kata_cari'];

										//jika hanya ingin mencari berdasarkan kode_produk, silahkan hapus dari awal OR
										//jika ingin mencari 1 ketentuan saja query nya ini : SELECT * FROM produk WHERE kode_produk like '%".$kata_cari."%' 
										$query3 = "SELECT * FROM v_tes WHERE pel_no like '%" . $kata_cari . "%' AND rek_sts=1 AND rek_byr_sts=0 ORDER BY rek_thn ASC, rek_bln ASC ";
									} else {
										//jika tidak ada pencarian, default yang dijalankan query ini
										$query3 = "SELECT * FROM v_tes GROUP BY pel_no ASC";
									}

									$no2 = 1;
									$result3 = mysqli_query($koneksi, $query3);


									if (!$result3) {
										die("Query Error : " . mysqli_errno($koneksi) . " - " . mysqli_error($koneksi));
									}
									//kalau ini melakukan foreach atau perulangan
									while ($row3 = mysqli_fetch_assoc($result3)) {
									?>
										<tr>
											<td scope="row" class="text-center align-middle"><?php echo $no2++; ?></td>
											<td scope="row" class="align-middle"><?php
																					$bulan = array(
																						1 => 'Januari',
																						'Februari',
																						'Maret',
																						'April',
																						'Mei',
																						'Juni',
																						'Juli',
																						'Agustus',
																						'September',
																						'Oktober',
																						'November',
																						'Desember'
																					);
																					echo $bulan[$row3['rek_bln']];
																					echo ' ', $row3['rek_thn']; ?></td>
											<td scope="row" class="text-end align-middle"><?php echo $row3['rek_stanlalu']; ?></td>
											<td scope="row" class="text-end align-middle"><?php echo $row3['rek_stankini']; ?></td>
											<td scope="row" class="text-end align-middle"><?php
																							$kini = $row3['rek_stankini'];
																							$lalu = $row3['rek_stanlalu'];
																							echo $pakai = $kini - $lalu; ?></td>
											<td scope="row" class="text-end align-middle"><?php echo rupiah($row3['rek_uangair']); ?></td>
											<td scope="row" class="text-end align-middle"><?php echo rupiah($row3['rek_meter']); ?></td>
											<td scope="row" class="text-end align-middle"><?php echo rupiah($row3['rek_materai']); ?></td>
											<td scope="row" class="text-end align-middle"><?php echo rupiah($row3['rek_denda'] = 5000); ?></td>
											<td scope="row" class="text-end align-middle"><?php
																							$air = $row3['rek_total'];
																							$denda = $row3['rek_denda'];
																							$materai = $row3['rek_materai'];

																							echo rupiah($total = $air + $denda + $materai);
																							?></td>
										</tr>
									<?php
									}
									?>
								</tbody>
							</table>
						</div>
						<div class="table-responsive">
							<table class="table table-info table-bordered border-dark">
								<tbody>
									<?php
									include 'config.php';
									$sql3 = mysqli_query($koneksi, "SELECT COUNT(rek_byr_sts) * 5000, SUM(rek_total + rek_adm + rek_angsuran + rek_denda + rek_materai), COUNT(rek_byr_sts) * 5000 + SUM(rek_total + rek_adm + rek_angsuran + rek_denda + rek_materai) FROM v_tes WHERE pel_no LIKE '%" . $kata_cari . "%' AND rek_byr_sts=0 AND rek_sts=1;");

									while ($data3 = mysqli_fetch_array($sql3)) {
									?>
										<tr>
											<th scope="row" class="fs-5 text-center align-middle">Jumlah Tagihan Dibawah Tanggal 21</th>
											<th scope="row" class="fs-5 text-end align-middle"><?php if ($data3['COUNT(rek_byr_sts) * 5000 + SUM(rek_total + rek_adm + rek_angsuran + rek_denda + rek_materai)'] > 0) {
																									echo "Rp. " . number_format($data3['COUNT(rek_byr_sts) * 5000 + SUM(rek_total + rek_adm + rek_angsuran + rek_denda + rek_materai)'] - 5000);
																								} else {
																									echo "Rp. " . number_format($data3['COUNT(rek_byr_sts) * 5000 + SUM(rek_total + rek_adm + rek_angsuran + rek_denda + rek_materai)']);
																								}
																								?></th>
										</tr>
										<td colspan="2" style="background-color: white;"></td>
										<tr>
											<th scope="row" class="fs-5 text-center align-middle">Jumlah Tagihan Diatas Tanggal 20</th>
											<th scope="row" class="fs-5 text-end align-middle"><?php
																								echo "Rp. " . number_format($data3['COUNT(rek_byr_sts) * 5000 + SUM(rek_total + rek_adm + rek_angsuran + rek_denda + rek_materai)']); ?></th>
										</tr>
									<?php
									}
									?>
								</tbody>
							</table>
						</div>
					</div>
					<div class="card-footer bg-info">
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>

</html>