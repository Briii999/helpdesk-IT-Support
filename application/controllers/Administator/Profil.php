<?php

defined('BASEPATH') or exit('No direct script access allowed');



class Profil extends CI_Controller{

    public function __construct(){

        parent::__construct();

		$this->load->helper('url'); 

		$this->load->model('UserModel');

		$this->load->model('RequestModel');

        $this->load->library('session');

		$this->load->model('NotifikasiModel');



    }



	public function tampilEditProfile($username){

		// Memeriksa apakah pengguna sudah login

		if (!$this->session->userdata('logged_in')) {

			redirect('Home/loginPage');

		}

		

		// Mendapatkan data peran (role_id) pengguna dari session

		$role_id = $this->session->userdata('role_id');

		

		// Memeriksa apakah pengguna memiliki peran 'admin'

		if ($role_id !== '1') {

			// Jika bukan admin, arahkan kembali ke halaman login atau tindakan lain yang sesuai

			redirect('Home/errorPage');

		}

		$data['active_menu'] = 'KelolaProfil';

		$data['title'] = 'Kelola Profil';



		// Kueri Data User

		$data['users'] = $this->UserModel->getUserById($username);

		// Mendapatkan Semua Notifikasi

        $data['notif'] = $this->NotifikasiModel->getAllNotification();

        $data['jml_notif'] = $this->NotifikasiModel->countAllNotif();



		// load view

		$this->load->view('administator/templates/header', $data);

		$this->load->view('administator/templates/sidebar', $data);

		$this->load->view('administator/kelolaprofil', $data);

		$this->load->view('administator/templates/footer');

	}



	public function gantiPassword(){

		$user_id = $this->input->post('user_id');

		$username = $this->input->post('username');

		$old_password = md5($this->input->post('old_password'));

		$new_password = $this->input->post('new_password');

		$cekOldPassword = $this->UserModel->get_user($username, $old_password);

		if($cekOldPassword){

			$data['password'] = md5($new_password);

			$this->UserModel->updateProfil($user_id, $data);

			$this->session->set_flashdata('success', 'Password berhasil diperbarui');

		}else{

			$this->session->set_flashdata('error', 'Tidak dapat memperbarui password karena password lama salah!');

		}

		redirect('Administator/Profil/tampilEditProfile/'.$username);



	}



	public function updateDataProfile($user_id)
	{
		$nama = $this->input->post('nama');
		$username = $this->input->post('username');
		$email = $this->input->post('email');
		$password = $this->input->post('password');
		$username_loggedin = $this->session->userdata('username');

		// Memeriksa apakah username berubah
		if ($username !== $username_loggedin) {
			// Jika username berubah, periksa apakah username yang baru sudah ada di database
			$existingUser = $this->UserModel->getUserById($username);
	
			if ($existingUser) {
				// Jika username sudah ada, tampilkan pesan kesalahan
				$this->session->set_flashdata('error', 'Username sudah digunakan. Harap pilih username lain.');
				redirect('Administator/Profil/tampilEditProfile/' . $username_loggedin);
				return;
			}
		}

		// Memeriksa apakah ada file foto yang diupload
		if ($_FILES['foto1']['name']) {
			$config['upload_path'] = './assets/img/users/'; // Lokasi penyimpanan foto
			$config['allowed_types'] = 'jpg|jpeg|png';
			$config['max_size'] = 2048; // Batasan ukuran file (dalam KB)

			$this->load->library('upload', $config);

			if ($this->upload->do_upload('foto1')) {
				$uploaded_data = $this->upload->data();
				$foto = $uploaded_data['file_name'];

				// Mengupdate data produk beserta foto
				$data = array(
					'nama' => $nama,
					'username' => $username,
					'email' => $email,
					'foto_user' => $foto
				);

				// Memeriksa apakah password diisi atau tidak
				if (!empty($password)) {
					$data['password'] = md5($password);
				}

				$this->UserModel->updateProfil($user_id, $data);
				$this->session->set_userdata($data);
				$this->session->set_flashdata('success', 'Profile berhasil diperbarui');
			} else {
				$error = $this->upload->display_errors();
				$this->session->set_flashdata('error', $error);
				redirect('Administator/Profil/tampilEditProfile/' . $username);
				$this->session->set_flashdata('error', 'Profile gagal diperbarui');
			}
		} else {
			// Jika tidak ada foto yang diupload, hanya mengupdate data profil tanpa foto
			$data = array(
				'nama' => $nama,
				'email' => $email,
				'username' => $username
			);

			// Memeriksa apakah password diisi atau tidak
			if (!empty($password)) {
				$data['password'] = md5($password);
			}
			$this->session->set_userdata($data);

			$this->UserModel->updateProfil($user_id, $data);
			$this->session->set_flashdata('success', 'Profile berhasil diperbarui');
		}

		redirect('Administator/Profil/tampilEditProfile/'.$username);
	}
	

}