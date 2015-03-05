<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>
<%@ page import="ratingMgmt.rating.*" %>
<%@ page import="UserMgmt.user.*" %>
<%@ page import="UserMgmt.business.UserDB" %>
<%@ page import="BookMgmt.*"%>
<%	
	RatingDB ratingDB = new RatingDB();
	UserDB userDB = new UserDB();
	BookDB bookDB = new BookDB();
	
	Book book = bookDB.selectBook(Integer.parseInt(request.getParameter("BookId")));
	User user;
%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head><title>Book Ratings</title>
		<link rel="stylesheet" href="css/c06.css" />
	</head>
	<body>
	<label>User Ratings: </label>
<table>
		<thead>
			<tr>
				<th>User</th>
				<th>Stars</th>
				<th>Comments</th>
			</tr>
		</thead>
		<tbody>
<%
		ArrayList<rating> ratingList=ratingDB.selectRatingsByBook(book.getBookId()); 
		for(int i = 0; i < ratingList.size(); i++){
			user = userDB.selectUser(ratingList.get(i).getUserId());
			out.println("<tr>");
			out.println("<td>"+user.getFirstName()+"</td>");
			out.println("<td>"+ratingList.get(i).getStars()+"</td>");
			out.println("<td>"+ratingList.get(i).getComments()+"</td>");
			out.println("</tr>");
		}
%>
		</tbody>
</table>

	</body>
</html>