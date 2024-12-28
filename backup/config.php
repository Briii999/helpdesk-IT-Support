<?php
	$host = "192.168.0.101";
	$user = "pdam_pringsewu";
	$pass = "pringsewu2020";
	$db = "stag_billing_prsw";
	$koneksi = mysqli_connect($host,$user,$pass,$db);

	if(!$koneksi) {
		die("Koneksi dengan database gagal: ".mysqli_connect_error());
	}
?>