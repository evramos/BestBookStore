package UserMgmt.business;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
<<<<<<< HEAD
import javax.servlet.http.Cookie;
=======
>>>>>>> davids-brqnch
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import UserMgmt.user.User;
import UserMgmt.business.UserDB;

/**
 * Servlet implementation class SignIn
 */
@WebServlet("/SignIn")
<<<<<<< HEAD
public class SignIn extends HttpServlet
{
	private static final long serialVersionUID = 1L;

    public SignIn() { super(); }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException 
=======
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SignIn() 
    {
        super();
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
>>>>>>> davids-brqnch
	{
		doPost(request, response);
	}

	@Override
<<<<<<< HEAD
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		response.setContentType("text/html");

=======
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
>>>>>>> davids-brqnch
		try
		{
			PrintWriter out = response.getWriter();
			String passwd = request.getParameter("password");
			String email = request.getParameter("email");
<<<<<<< HEAD

			UserDB userDB = new UserDB();
			User user = userDB.selectUserByEmail(email);

			if (user != null)
			{	
				out.println( user.getPasswd() + " == " + passwd);
				if (user.getPasswd().equals(passwd))
				{
					//Creates a cookie for the current user that logs in
					Cookie c = new Cookie("userId", ""+user.getUserId());
					c.setMaxAge(60*60); //Cookie is good for one hour
					c.setPath("/");
					response.addCookie(c);	

					out.println("Successful Login");
					out.println("<a href=./index.jsp>Return to homepage</a>");
				}
				else
				{
=======
			UserDB userDB = new UserDB();
			User user = userDB.selectUserByEmail(email);
			if (user != null) {
				if (user.getPasswd() == passwd) {
					out.println("Successful Login");
					out.println("<a href=/index.jsp?UserId="+user.getUserId()+">Return to homepage</a>");
				} else {
>>>>>>> davids-brqnch
					out.println("<h3>Password incorrect</h3>");
					out.println("<a href=/SignIn.jsp>Try again</a>");
					out.println("<a href=/index.jsp?UserId="+user.getUserId()+">\nReturn to homepage</a>");
				}
<<<<<<< HEAD
			}
			else
			{
=======
			} else {
>>>>>>> davids-brqnch
				out.println("<h3>Email incorrect</h3>");
				out.println("<a href=/SignIn.jsp>Try again</a>");
				out.println("<a href=/index.jsp>\nReturn to homepage</a>");
			
			}
		}
<<<<<<< HEAD
		catch (Exception e) { e.printStackTrace(); }
=======
		catch (Exception e)
        {
        	e.printStackTrace();	
        }
>>>>>>> davids-brqnch
	}

}
