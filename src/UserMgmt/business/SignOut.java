package UserMgmt.business;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignOut
 */
@WebServlet("/SignOut")
public final class SignOut extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    public SignOut() { super(); }


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		response.setContentType("text/html");

		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies)
		{
			cookie.setMaxAge(0);	//Delete the cookie
			cookie.setPath("/");	//Allow the download application to accees it
			response.addCookie(cookie);
		}
		PrintWriter out = response.getWriter();
		out.println("Successful Logout");
		out.println("<a href=./index.jsp>Return to homepage</a>");
	}
}
