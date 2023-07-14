package clases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UsuariosDAO
{
	Connection conexion = null;

	public UsuariosDAO() throws ClassNotFoundException
	{
		Conexion con=  new Conexion();
		conexion=con.getConnection();
	}



	public List<Usuarios> listarUsuarios()
	{
		PreparedStatement ps;
		ResultSet rs;
		List<Usuarios> lista =  new ArrayList<>();

		try
		{
			ps=conexion.prepareStatement("select * from usuarios");
			rs=ps.executeQuery();

			while(rs.next())
			{
				int id = rs.getInt("id");
				String nombre = rs.getString("nombre");
				String apellido = rs.getString("apellido");
				int edad = rs.getInt("edad");
				int dni = rs.getInt("dni");
				String localidad = rs.getString("localidad");
				String email = rs.getString("email");
				String passw = rs.getString("passw");
				String telefono =rs.getString("telefono");

				Usuarios usuario =  new Usuarios(id,nombre,apellido,edad,dni,localidad,email,passw,telefono);
				lista.add(usuario);
			}
			return lista;
		}catch(SQLException e)
		{
			System.out.println(e);
			return null;
		}

	}
	public boolean insertarUsuario(Usuarios usuario) {
		PreparedStatement ps;
		try {
			ps=conexion.prepareStatement("insert into usuarios(nombre,apellido,edad,dni,localidad,email,passw,telefono)values(?,?,?,?,?,?,?,?)");
			ps.setString(1, usuario.getNombre());
			ps.setString(2, usuario.getApellido());
			ps.setInt(3, usuario.getEdad());
			ps.setInt(4, usuario.getDni());
			ps.setString(5, usuario.getLocalidad());
			ps.setString(6, usuario.getEmail());
			ps.setString(7, usuario.getPassw());
			ps.setString(8, usuario.getTelefono());
			ps.execute();
			return true;
		}catch(SQLException e){
			System.out.println(e);
			return false;
		}

	}

	public boolean actualizarUsuario(Usuarios usuario) {

		PreparedStatement ps;
		try {
			ps = conexion.prepareStatement("UPDATE usuarios SET nombre=?, apellido=?, edad=?, dni=?, localidad=?, email=?, passw=?, telefono=? WHERE id=?");
			ps.setString(1, usuario.getNombre());
			ps.setString(2, usuario.getApellido());
			ps.setInt(3, usuario.getEdad());
			ps.setInt(4, usuario.getDni());
			ps.setString(5, usuario.getLocalidad());
			ps.setString(6, usuario.getEmail());
			ps.setString(7, usuario.getPassw());
			ps.setString(8, usuario.getTelefono());
			ps.setInt(9, usuario.getId());
			ps.executeUpdate();
		return true;
	}catch(SQLException e){
		System.out.println(e);
		return false;
	}
	}
	public boolean eliminarUsuario(int id) {
		PreparedStatement ps;
		try {
			ps = conexion.prepareStatement("delete from usuarios where id=? ");
			ps.setInt(1, id);
			ps.execute();
			return true;
		}catch(SQLException e){
			System.out.println(e);
			return false;
		}
	}
	public Usuarios mostrarUsuario(int id) {
		PreparedStatement ps;
		ResultSet rs;
		Usuarios usuario =null;
		try {
			ps=conexion.prepareStatement("select * from usuarios where id=?");
			ps.setInt(1, id);
			rs=ps.executeQuery();
			while(rs.next()) {

			int id1=rs.getInt("id");
			String nombre = rs.getString("nombre");
			String apellido = rs.getString("apellido");
			int edad = rs.getInt("edad");
			int dni = rs.getInt("dni");
			String localidad = rs.getString("localidad");
			String email = rs.getString("email");
			String passw = rs.getString("passw");
			String telefono = rs.getString("telefono");
			usuario=  new Usuarios(id1,nombre,apellido,edad,dni,localidad,email,passw,telefono);
			}
			return usuario;
		}catch(SQLException e){
			System.out.println(e);
			return null;
		}
	}
}
