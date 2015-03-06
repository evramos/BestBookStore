<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>
<%@ page import="ratingMgmt.rating.*" %>
<%@ page import="UserMgmt.user.*" %>
<%@ page import="UserMgmt.business.UserDB" %>
<%@ page import="BookMgmt.Book.*"%>
<%	
	RatingDB ratingDB = new RatingDB();
	UserDB userDB = new UserDB();
	BookDB bookDB = new BookDB();
	
	Book book;
	User user = userDB.selectUser(Integer.parseInt(request.getParameter("UserId")));
%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head><title>User Ratings</title>
		<link rel="stylesheet" href="css/c06.css" />
	</head>
	<body>
	<label>You have Rated the following books: </label>
<table>
		<thead>
			<tr>
				<th>Book Title</th>
				<th>Author</th>
				<th>Category</th>
				<th>Stars</th>
				<th>Comments</th>
				<th>Modify</th>
			</tr>
		</thead>
		<tbody>
<%
		ArrayList<rating> ratingList=ratingDB.selectRatingsByUser(user.getUserId()); 
		for(int i = 0; i< ratingList.size(); i++){
			book = bookDB.selectBook(ratingList.get(i).getBookId());
			out.println("<tr>");
			out.println("<td>"+book.getTitle()+"</td>");
			out.println("<td>"+book.getAuthor()+"</td>");
			out.println("<td>"+book.getCategory()+"</td>");
			out.println("<td>"+ratingList.get(i).getStars()+"</td>");
			out.println("<td>"+ratingList.get(i).getComments()+"</td>");

			out.println("<td><a href=\"EditRating.jsp?ratingId="+ratingList.get(i).getRatingsId()+"\">[ Update ]</a>"+
				"<a href=\"DeleteRating?RatingId="+ratingList.get(i).getRatingsId()+"\">[ Delete ]</a></td>");
			out.println("</tr>");
		}
%>
		</tbody>
</table>

	</body>
</html>