package ratingMgmt.rating;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ratingMgmt.rating.RatingDB;
import ratingMgmt.rating.Rating;


@WebServlet("/UpdateRating")
public class UpdateRating extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		RatingDB dbConn = new RatingDB();
		Rating oldRating = dbConn.selectRating(Integer.parseInt(request.getParameter("RatingId")));
		
		Rating Rating = new Rating();
		Rating.setRatingsId(oldRating.getRatingsId());
		Rating.setComments(request.getParameter("comment"));
		Rating.setStars(Integer.parseInt(request.getParameter("Stars")));
		Rating.setUserId(oldRating.getUserId());
		Rating.setBookId(oldRating.getBookId());
		

		int i = dbConn.editRating(Rating);
		if(i > 0)
		{
			response.sendRedirect("UserListRatings.jsp?UserId="+Rating.getUserId());
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
