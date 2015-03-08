package UserMgmt.business;
import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import UserMgmt.user.User;
import UserMgmt.business.UserDB;


@WebServlet("/SignUp")
public class SignUp extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public SignUp() throws Exception
	{
		super();
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			String FirstName= request.getParameter("FirstName");
			String LastName= request.getParameter("LastName");
			String passwd= request.getParameter("password");
			String email= request.getParameter("email");
			
			User user = new User(passwd, FirstName, LastName, email );
			UserDB dbConn = new UserDB();
			
			int i = dbConn.registerUser(user);
			if(i > 0){
					response.sendRedirect("/TheBestBookstore/index.jsp");
			}else{
				response.sendRedirect("signUpError.html");
			}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request, response);
	}
}
