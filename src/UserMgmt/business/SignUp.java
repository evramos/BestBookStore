package UserMgmt.business;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import UserMgmt.user.User;
import UserMgmt.business.UserDB;


@WebServlet("/SignUp")

public class SignUp extends HttpServlet
{
	private static final long serialVersionUID = 1234;

    public SignUp() throws Exception
    {
        super();
    }
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		PrintWriter out = response.getWriter();
		out.println("Hello World");
//		String firstName = request.getParameter("firstName");
//		String lastName = request.getParameter("lastName");
//		String passwd = request.getParameter("password");
//		String email = request.getParameter("email");
		
//		User user = new User(passwd, firstName, lastName, email);
//		UserDB dbConn = new UserDB();
//		
//		int i = dbConn.registerUser(user);
//
//		if (i > 0)
//		{
//			out.println("<h1>Successful Register</h1>");



			// response.sendRedirect("../index.jsp");
//		}

//		else { response.sendRedirect("signUpError.html"); }
	}
}
