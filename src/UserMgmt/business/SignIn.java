package UserMgmt.business;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import UserMgmt.user.User;
import UserMgmt.business.UserDB;

/**
 * Servlet implementation class SignIn
 */
@WebServlet("/SignIn")
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SignIn() 
    {
        super();
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			PrintWriter out = response.getWriter();
			String passwd = request.getParameter("password");
			String email = request.getParameter("email");
			UserDB userDB = new UserDB();
			User user = userDB.selectUserByEmail(email);
			if (user != null) {
				if (user.getPasswd() == passwd) {
					out.println("Successful Login");
					out.println("<a href=/index.jsp?UserId="+user.getUserId()+">Return to homepage</a>");
				} else {
					out.println("<h3>Password incorrect</h3>");
					out.println("<a href=/SignIn.jsp>Try again</a>");
					out.println("<a href=/index.jsp?UserId="+user.getUserId()+">\nReturn to homepage</a>");
				}
			} else {
				out.println("<h3>Email incorrect</h3>");
				out.println("<a href=/SignIn.jsp>Try again</a>");
				out.println("<a href=/index.jsp>\nReturn to homepage</a>");
			
			}
		}
		catch (Exception e)
        {
        	e.printStackTrace();	
        }
	}

}
