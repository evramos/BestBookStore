package UserMgmt.business;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import UserMgmt.user.User;
import UserMgmt.business.UserDB;

public class SignUp extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1234;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			String username= request.getParameter("username");
			String passwd= request.getParameter("passwd");
			String name= request.getParameter("name");
			String email= request.getParameter("email");
			
			User user = new User(username, passwd, name, email);
			UserDB dbConn = new UserDB();
			
			int i = dbConn.registerUser(user);
			if(i > 0){
					response.sendRedirect("../index.jsp");
			}else{
				response.sendRedirect("signUpError.html");
			}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request, response);
	}
}
