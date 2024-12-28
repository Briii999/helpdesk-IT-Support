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
    <h3 class="text-center" style="color: #06283D;">Info Tagihan Pelanggan</h3>
    <h4 class="text-center" style="color: #06283D;">PDAM Way Sekampung</h4>
    <h5 class="text-center" style="color: #06283D;">Kabupaten Pringsewu</h5>
    <div class="row">
      <div class="col-md-5 mx-auto">
        <div class="card">
          <div class="card-header" style="background-color: #47B5FF;">
          </div>
          <div class="card-body">
            <form method="GET" action="info.php">
              <div class="mb-3">
                <label class="form-label" style="color: #06283D;">No Pelanggan</label>
                <input class="form-control" type="text" name="kata_cari" value="<?php if (isset($_GET['kata_cari'])) {
                                                                                  echo $_GET['kata_cari'];
                                                                                } ?>" placeholder="Mohon Dihafal No Pelanggannya">
              </div>
              <button type="submit" class="btn text-light" style="background-color:#47B5FF;">Cari</button>
            </form>
          </div>
          <div class="card-footer" style="background-color: #47B5FF;">
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>

</html>