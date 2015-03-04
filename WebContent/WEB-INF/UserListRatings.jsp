<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>
<%@ page import="ratingMgmt.rating.*" %>
<%@ page import="UserMgmt.user.*" %>
<%@ page import="UserMgmt.business.UserDB" %>
<%@ page import="BookMgmt.*"%>
<%	
	RatingDB ratingDB = new RatingDB();
	UserDB userDBConn = new UserDB();
	BookDB bookDBConn = new BookDB();
	
	Book book;
	User user = userDBConn.selectUser(Integer.parseInt(request.getParameter("UserId")));
%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head><title>User Table</title>
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

		ArrayList<rating> ratingList=ratingDBConn.selectRatings(); 
		for(int i = 0; i< ratingList.size(); i++){
			book = BookDBConn.selectBook(ratingList(i).getBookId));
			out.println("<tr>");
			out.println("<td>"+book.getTitle()+"</td>");
			out.println("<td>"+book.getAuthor()+"</td>");
			out.println("<td>"+book.getCategory()+"</td>");
			out.println("<td>"+ratingList.get(i).getStars()+"</td>");
			out.println("<td>"+ratingList.get(i).getComment()+"</td>");

			out.println("<td><a href=\"EditRating.jsp?ratingId="+ratingList.get(i).getRatingId()+"\">[ Update ]</a>"+
				"<a href=\"DeleteRating?RatingId="+ratingList.get(i).getRatingId()+"\">[ Delete ]</a></td>");
			out.println("</tr>");
		}
%>
		</tbody>
</table>

	</body>
</html>