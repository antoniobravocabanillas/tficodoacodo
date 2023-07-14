package clases;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UsuariosController")
public class UsuariosController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//Constructor vacio
    public UsuariosController()
    {
        super();
    }
    //metodo GET
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accion =null;
		UsuariosDAO usuarioDAO = null;

		try
		{
			usuarioDAO = new UsuariosDAO();
		}
		catch(ClassNotFoundException e)
		{
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = null;

		accion = request.getParameter("accion");

		if(accion==null||accion.isEmpty())
		{
			dispatcher=request.getRequestDispatcher("vistas/usuarios.jsp");
		}
		else if (accion.equals("modificar"))
		{
			dispatcher=request.getRequestDispatcher("vistas/modificar.jsp");
		}
		else if(accion.equals("actualizar"))
		{
			int id = Integer.parseInt(request.getParameter("id").trim());
			String nombre=request.getParameter("nombre");
			String apellido=request.getParameter("apellido");
			int edad = Integer.parseInt(request.getParameter("edad").trim());
			int dni = Integer.parseInt(request.getParameter("dni").trim());
			String localidad=request.getParameter("localidad");
			String email=request.getParameter("email");
			String passw=request.getParameter("passw");
			String telefono=request.getParameter("telefono");
			Usuarios usuario = new Usuarios(id,nombre,apellido,edad,dni,localidad,email,passw, telefono);
			usuarioDAO.actualizarUsuario(usuario);
			dispatcher=request.getRequestDispatcher("vistas/usuarios.jsp");
		}
		else if(accion.equals("eliminar"))
		{
			int id=Integer.parseInt(request.getParameter("id"));
			usuarioDAO.eliminarUsuario(id);
			dispatcher=request.getRequestDispatcher("vistas/usuarios.jsp");
		}
		else if(accion.equals("nuevo"))
		{
			dispatcher=request.getRequestDispatcher("vistas/nuevo.jsp");
		}
		else if(accion.equals("insert"))
		{
			String nombre=request.getParameter("nombre");
			String apellido=request.getParameter("apellido");
			String edadStr = request.getParameter("edad");
			int edad = 0; // Valor predeterminado en caso de que no se proporcione la edad o sea nula
			if (edadStr != null && !edadStr.isEmpty()) {
			    edad = Integer.parseInt(edadStr);
			}
			String dniStr = request.getParameter("dni");
			int dni = 0; // Valor predeterminado en caso de que no se proporcione el DNI o sea nulo
			if (dniStr != null && !dniStr.isEmpty()) {
			    dni = Integer.parseInt(dniStr);
			}
			String localidad=request.getParameter("localidad");
			String email=request.getParameter("email");
			String passw=request.getParameter("passw");
			String telefono=request.getParameter("telefono");
			Usuarios usuario = new Usuarios(0,nombre,apellido,edad,dni,localidad,email,passw, telefono);
			usuarioDAO.insertarUsuario(usuario);
			dispatcher=request.getRequestDispatcher("vistas/usuarios.jsp");
		}
		dispatcher.forward(request, response);


	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		doGet(request, response);
	}

}
