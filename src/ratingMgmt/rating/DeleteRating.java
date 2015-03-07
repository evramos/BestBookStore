package ratingMgmt.rating;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import UserMgmt.business.UserDB;

@WebServlet("/DeleteRating")
public class DeleteRating extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String RatingId= request.getParameter("ratingId");
		
		RatingDB dbConn = new RatingDB();
		
		int i = dbConn.deleteRating(Integer.parseInt(RatingId));
		if(i > 0){
				response.sendRedirect("/RatingList.jsp");
		}else{
			response.sendRedirect("AddRatingsError.html");
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request, response);
	}

}
