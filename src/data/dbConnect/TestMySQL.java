package data.dbConnect;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import UserMgmt.business.User;
import UserMgmt.business.UserDB;


/**
 * Servlet implementation class MySQL
 */

@WebServlet("/TestMySQL")

public class TestMySQL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public TestMySQL() throws Exception
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{

		try
		{
			PrintWriter out = response.getWriter();
			
			String firstName = "asdf";
			String lastName = "aasdf";
			String passwd = "pass";
			String email = "email asdf";
			
        	
			User user = new User(lastName, firstName, passwd, email);
			UserDB dbConn = new UserDB();
			
			int i = dbConn.registerUser(user);
			
			out.println("Name: " + firstName + ", " + lastName);
			out.println("Password: " + passwd);
			out.println("Email: " + email);
			out.println("SQL: " + i);
	
			if (i > 0)
			{
				out.println("Successful Register");

				// response.sendRedirect("../index.jsp");
			}
			else
			{
				response.sendRedirect("signUpError.html");
			}
        }
        catch (Exception e)
        {
        	e.printStackTrace();	
        }
	}
}
