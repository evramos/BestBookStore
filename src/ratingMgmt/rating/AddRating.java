package ratingMgmt.rating;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


import ratingMgmt.rating.RatingDB;
import ratingMgmt.rating.Rating;

@WebServlet("/AddRating")
public class AddRating extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public AddRating() throws Exception
	{
		super();
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			int Stars = Integer.parseInt(request.getParameter("Stars"));
			String Comments= request.getParameter("comment");
			int BookId = Integer.parseInt(request.getParameter("BookId"));
			int UserId = Integer.parseInt(request.getParameter("UserId"));
			
			Rating Rating = new Rating(Stars, Comments, UserId, BookId );
			RatingDB dbConn = new RatingDB();
			
			int i = dbConn.addRating(Rating);
			if(i > 0){
					response.sendRedirect("BookListRatings.jsp?BookId="+BookId);
			}else{
				response.sendRedirect("/AddRatingsError.html");
			}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request, response);
	}
}
