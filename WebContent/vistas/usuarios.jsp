<%@page import="clases.UsuariosDAO"%>
<%@page import="clases.Usuarios"%>
<%@page import="java.util.List"%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Usuarios</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" type="text/css" href="css/styles.css">
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
			<div>
				<h1 class="display-4 text-center">Actualizar datos usuario</h1>
			</div>

<div  class="container " >
		<div class="row  container-update" >
				<a class="  btn btn-primary col-5 m-5" href="/tfi/UsuariosController?accion=nuevo">Agregar usuario</a>
				<div class="table-content">
				
				<table style="background-color: transparent; " class=" table table-light table-striped table-bordered table-hover" >
				<thead>
					<th>Id</th>
					<th>Nombre</th>
					<th>Apellido</th>
					<th>Edad</th>
					<th>DNI</th>				
					<th>Localidad</th>					
					<th>Email</th>					
					<th>Password</th>					
					<th>Telefono</th>					
					<th class="text-center">Modificar</th>
					<th class="text-center">Eliminar</th>				
				</thead>
				<%
					List<Usuarios> resultado=null;
						UsuariosDAO usuario = new UsuariosDAO();
						resultado = usuario.listarUsuarios();
				for(int i=0;i<resultado.size();i++){
						String ruta="UsuariosController?accion=modificar&id="+resultado.get(i).getId();
						String rutaE="UsuariosController?accion=eliminar&id="+resultado.get(i).getId();
				%>
				<tr>
				<td> <%= resultado.get(i).getId()%> </td>
				<td><%=resultado.get(i).getNombre()%></td>
				<td><%=resultado.get(i).getApellido()%></td>
				<td><%=resultado.get(i).getEdad()%></td>
				<td><%=resultado.get(i).getDni()%></td>
				<td><%= resultado.get(i).getLocalidad() %> </td>
				<td><%=resultado.get(i).getEmail()%></td>
				<td><%=resultado.get(i).getPassw()%></td>
				<td><%=resultado.get(i).getTelefono()%></td>
				<td class="text-center"><a href=<%=ruta%>> <i class="fa-solid fa-arrow-right-arrow-left"></i></a></td>
				<td class="text-center"><a href=<%=rutaE%>><i class="fa-solid fa-arrow-down"></i></a></td>
				</tr>
				<%
				}
				%>					
				</table>		
				</div>
		</div>
</div>

</body>
</html>