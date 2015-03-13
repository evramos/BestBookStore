package UserMgmt.business;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import UserMgmt.business.UserDB;

/**
 * Servlet implementation class SignUp
 */

@WebServlet("/SignUp")

public class SignUp extends HttpServlet
{
	private static final long serialVersionUID = 1L;

    public SignUp() throws Exception
    {
        super();
    }
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		response.setContentType("text/html");

		try
		{
			PrintWriter out = response.getWriter();
			
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String passwd = request.getParameter("password");
			String email = request.getParameter("email");
			
			//In case any of the values might be NULL
			if (email != null)
			{
				User user = new User(lastName, firstName,  passwd, email);
				UserDB dbConn = new UserDB();
				
				int index = dbConn.registerUser(user);
				
				if (index > 0)
				{	
					out.println("Welcome " + firstName + ", " + lastName + "<br/>");
					out.println("Your email is: " + email + "<br/>");
					out.println("Your password is: " + passwd + "<br/>");
					out.println("Successful Register<br/><a href=\"SignIn.jsp\">Click to login</a>");

//					response.sendRedirect("./signUpForm_User.jsp");
				}
				else
				{
					response.sendRedirect("signUpError.html");
				}	
			}
			else
			{
				response.sendRedirect("./signUpForm_User.jsp");
			}
		}
        catch (Exception e)
        {
        	e.printStackTrace();	
        }
	}
}
