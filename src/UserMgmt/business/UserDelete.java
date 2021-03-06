package UserMgmt.business;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import UserMgmt.business.UserDB;

@WebServlet("/UserDelete")
public class UserDelete extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String UserId= request.getParameter("UserId");
		
		UserDB dbConn = null;
		try {
			dbConn = new UserDB();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int i = dbConn.deleteUser(Integer.parseInt(UserId));
		if(i > 0){
				response.sendRedirect("./userList.jsp");
		}else{
			response.sendRedirect("./signUpError.html");
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request, response);
	}

}
