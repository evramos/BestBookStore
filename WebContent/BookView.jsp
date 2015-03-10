<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>
<%@ page import="ratingMgmt.rating.*" %>
<%@ page import="UserMgmt.user.*" %>
<%@ page import="UserMgmt.business.UserDB" %>
<%@ page import="BookMgmt.Book.*"%>
<%	
	BookDB bookDB = new BookDB();
	UserDB userDB = new UserDB();
	RatingDB ratingDB = new RatingDB();
	
	Book book = bookDB.selectBook(Integer.parseInt(request.getParameter("BookId")));
	User user = userDB.selectUser(Integer.parseInt(request.getParameter("UserId")));
	ArrayList<rating> ratings = ratingDB.selectRatingsByBook(Integer.parseInt(request.getParameter("BookId")));
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Book - The Best Bookstore</title>
<link rel="stylesheet" href="css/c06.css" />
</head>
<body>

</body>
</html>