package ratingMgmt.rating;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ratingMgmt.rating.RatingDB;
import ratingMgmt.rating.rating;



public class UpdateRating extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		rating Rating = new rating();
		Rating.setComments(request.getParameter("Comments"));
		Rating.setStars(Integer.parseInt(request.getParameter("Stars")));
		Rating.setUserId(Integer.parseInt(request.getParameter("UserId")));
		Rating.setBookId(Integer.parseInt(request.getParameter("BookId")));
		
		RatingDB dbConn = new RatingDB();
		int i = dbConn.editRating(Rating);
		if(i > 0)
		{
			response.sendRedirect("/RatingList.jsp");
		}
		else
		{
			response.sendRedirect("AddRatingError.html");
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request, response);
	}

}
