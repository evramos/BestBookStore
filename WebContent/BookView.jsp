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
	//User user = userDB.selectUser(Integer.parseInt(request.getParameter("UserId")));
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
<%
out.println("<h1>"+book.getTitle()+"</h1>");
out.println("<h2>by "+book.getAuthor()+"</h2>");
out.println(book.getBookCoverArt());
out.println("<h3><b>About this book: </b>");
out.println(""+book.getBookDescription()+"</h3");
out.println("<h3><b>Edition: </b>"+book.getEdition()+"</h3>");
out.println("<h3><b>Year: </b>"+book.getYear()+"</h3>");
out.println("<h3><b>Publisher: </b>"+book.getPublisher()+"</h3>");
out.println("<h3><b>Category: </b>"+book.getCategory()+"</h3>");
out.println("<h3><b>ISBN-10: </b>"+book.getIsbn10()+"</h3>");
out.println("<h3><b>ISBN-13: </b>"+book.getIsbn13()+"</h3>");
out.println("<h3><b>Price: </b>"+book.getPrice()+"</h3>");
out.println("<h3><b>Available: </b>"+book.getInvQty()+"</h3>");

// link to buy book (create transaction)

%>
<h3><a href=/BookListRatings.jsp?BookId=<%= book.getBookId()%>>View all book ratings</a></h3>
<h3><a href=/AddRating.jsp?BookId=<%= book.getBookId()%>>Rate this book</a></h3>
<h3><a href=/BuyBook.jsp?BookId=<%=book.getBookId() %>>Buy this book</a></h3>
</body>
</html>