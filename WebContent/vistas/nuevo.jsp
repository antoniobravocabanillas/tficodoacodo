<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registro usuario</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
	<div class="dar-de-alta" style="width:45%">
		<form action="UsuariosController?accion=insert" method="post">
			
				<h1 class="display-3 text-center">Registro de usuario</h1>
			
			<div class="mb-3">
  				<label for="nombre" class="form-label"></label>
  				<input type="text" class="form-control" id="nombre" placeholder="Nombre" name="nombre">
			</div>
			
			<div class="mb-3">
  				<label for="apellido" class="form-label"></label>
  				<input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellido">
			</div>
			
			<div class="mb-3">
  				<label for="edad"  class="form-label"></label>
  				<input type="text" class="form-control" id="edad" name="edad"  placeholder="Edad">
			</div>
			
			<div class="mb-3">
  				<label for="dni" class="form-label"></label>
  				<input type="text" class="form-control" id="dni" name="dni" placeholder="DNI">
			</div>
			<div class="mb-3">
  				<label for="localidad" class="form-label"></label>
  				<input type="text" class="form-control" id="localidad" name="localidad" placeholder="Localidad">
			</div>
			
			<div class="mb-3">
  				<label for="email" class="form-label"></label>
  				<input type="email" class="form-control" id="email" name="email" placeholder="Email">
			</div>
			
			<div class="mb-3">
  				<label for="passw" class="form-label"></label>
  				<input type="password" class="form-control" id="passw" name="passw" placeholder="Password">
			</div>
			<div class="mb-3">
  				<label for="telefono" class="form-label"></label>
  				<input type="telefono" class="form-control" id="telefono" name="telefono" placeholder="Telefono">
			</div>
		<button type="submit" class="btn btn-outline-success btn-lg"><i class='bx bxs-cloud-upload'></i><span>Dar de alta</span></button>
		</form>
	</div>

</body>
</html>