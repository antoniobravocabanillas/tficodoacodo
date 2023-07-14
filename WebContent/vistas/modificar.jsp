<%@page import="clases.UsuariosDAO"%>
<%@page import="clases.Usuarios"%>
<%@page import="java.util.List"%>  


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modificar Socio</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>




<%
String id = request.getParameter("id");
int mid;
mid=Integer.parseInt(id);
Usuarios resultado = null;
UsuariosDAO usuario = new UsuariosDAO();
resultado=usuario.mostrarUsuario(mid);

%>
	<div class="container-md" style="width:45%">
		<form class="user-update" action="UsuariosController?accion=actualizar" method="POST">
			
				<h1 class="display-4 text-center">Actualizar datos de usuario</h1>
			
			<div class="mb-3">				
				<input type="hidden"  class="form-control" id="id" name="id"  value="<%=resultado.getId()%>">
			</div>
			<div class="mb-3">
				<label for="nombre" class="form-label" ></label>
				<input type="text" class="form-control" id="nombre" name="nombre"  value="<%=resultado.getNombre()%> ">
			</div>
			
			<div class="mb-3">
  				<label for="apellido" class="form-label"></label>
  				<input type="text" class="form-control" id="apellido" placeholder="Apellido" name="apellido" value="<%=resultado.getApellido()%>" >
			</div>
			
			<div class="mb-3">
  				<label for="edad" class="form-label"></label>
  				<input type="text" class="form-control" id="edad" placeholder="Edad" name="edad" value="<%=resultado.getEdad()%>" >
			</div>
			
			<div class="mb-3">
  				<label for="dni" class="form-label"></label>
  				<input type="text" class="form-control" id="dni" placeholder="DNI" name="dni" value="<%=resultado.getDni()%> ">
			</div>
			<div class="mb-3">
  				<label for="localidad" class="form-label"></label>
  				<input type="text" class="form-control" id="localidad" placeholder="Localidad" name="localidad" value="<%=resultado.getLocalidad()%> ">
			</div>
			
			<div class="mb-3">
  				<label for="email" class="form-label"></label>
  				<input type="text" class="form-control" id="email" name="email" placeholder="Email" value="<%=resultado.getEmail()%>" >
			</div>
			
			<div class="mb-3">
  				<label for="passw" class="form-label"></label>
  				<input type="password" class="form-control" id="passw" name="passw" placeholder="Password" value="<%=resultado.getPassw()%>" >
			</div>
			<div class="mb-3">
  				<label for="telefono" class="form-label"></label>
  				<input type="text" class="form-control" id="telefono" name="telefono" placeholder="Telefono" value="<%=resultado.getTelefono()%>" >
			</div>
			
		<button type="submit" class="btn btn-outline-success btn-lg">Modificar</button>
		</form>
	</div>

</body>
</html>