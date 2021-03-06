package UserMgmt.business;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserUpdate")
public class UserUpdate extends HttpServlet
{

	private static final long serialVersionUID = 1L;
    
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
		User user = new User();
		user.setUserId(Integer.parseInt(request.getParameter("UserId")));
		user.setFirstName(request.getParameter("FirstName"));
		user.setLastName(request.getParameter("LastName"));
		user.setEmail(request.getParameter("email"));
		
		UserDB dbConn = null;

		try { dbConn = new UserDB(); }
		catch (Exception e) { e.printStackTrace(); }

		int i = dbConn.updateUser(user);
		if (i > 0) { response.sendRedirect("./userList.jsp"); }
		else
		{
			response.sendRedirect("./index.jsp");
		}
	}
}
