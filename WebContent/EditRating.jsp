<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>
<%@ page import="ratingMgmt.rating.*" %>
<%@ page import="UserMgmt.business.*" %>
<%@ page import="BookMgmt.Book.*"%>
<%
	RatingDB ratingDB = new RatingDB();
	UserDB userDBConn = new UserDB();
	BookDB bookDBConn = new BookDB();
	
/* 	Rating rating = ratingDB.selectRating(Integer.parseInt(request.getParameter("ratingId")));
	Book book= bookDBConn.selectBook(rating.getBookId());
	User user = userDBConn.selectUser(rating.getUserId());
 */%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<link rel="stylesheet" href="css/c06.css"/>
<title>Edit Rating - The Best Bookstore</title>
</head>
<body>
<div>
	<form action="UpdateRating" method="post">

			<div>
<%-- 				<label>  Title: </label><%=book.getTitle()%><br>
				<label>  Author: </label><%=book.getAuthor()%><br>
				<label>  Category: </label><%=book.getTitle()%><br> --%>
			</div>
		<fieldset>
			<div><span class="star"></span><label>  Stars: </label>
				<input type="radio" name="Stars" value="1" /> 1<input type="radio" name="Stars" value="2" /> 2
				<input type="radio" name="Stars" value="3" /> 3<input type="radio" name="Stars" value="4" /> 4
				<input type="radio" name="Stars" value="5" /> 5
			</div>
			<div><label> Comments: </label><textarea name="comment" rows="5" cols="80"></textarea></div>
<%-- 				<input type="hidden" name="RatingId" value=<%=rating.getRatingsId()%> />
 --%>				<input type="submit" value="Update Rating" id="submit"/>
		</fieldset>
	</form>
</div>
</body>
</html>