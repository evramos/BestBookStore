<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>
<%@ page import="ratingMgmt.rating.*" %>
<%@ page import="UserMgmt.business.UserDB" %>
<%@ page import="BookMgmt.Book.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>View Book - The Best Bookstore</title>
	<link rel="stylesheet" href="css/c06.css" />
	<link rel="stylesheet" href="css/bootstrap.css" />
	
	<style type="text/css">
		element.style { border-color: rgb(29, 107, 176); }
	 	div { background-color: lightblue; padding: 5px; }
	</style>
</head>
<body>
<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<%
	Cookie[] cookies = request.getCookies();

	String firstName = "";
	String isAdmin = "";
	int userId = 0;
	
	if (cookies != null)
	{
		for (int i = 0; i< cookies.length; i++)
		{
			if (cookies[i].getName().equals("firstName")) { firstName = cookies[i].getValue(); }
			if (cookies[i].getName().equals("isAdmin")) { isAdmin = cookies[i].getValue(); }
			if (cookies[i].getName().equals("userId")) { userId = Integer.parseInt(cookies[i].getValue()); }
		}
	}
%>

	<div>
		<h1>THE BEST BOOKSTORE</h1>
<%
	if (!firstName.equals("")) {%>
		Welcome <%= firstName %>
		<% if (isAdmin.equals("true")) {%>[ADMIN MODE]<%}%>
		<br/>
		<a href="./index.jsp">Home</a>		
		<a href="SignOut">Logout</a>
		
	<%} else {%>
		Please <a href="SignIn.jsp">SignIn</a> or <a href="signUpForm_User.jsp">Create an account</a><br/>
		<a href="./index.jsp">Home</a>
		<a href="./bookList.jsp">View all books</a>		
	<%}
%>
	</div>
<!-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	
<%
	//Acquire the current book information
	BookDB bookDB = new BookDB();
	Book book = bookDB.selectBook(Integer.parseInt(request.getParameter("BookId")));

	
	//Display the current book information
	out.println("<h1>"+book.getTitle()+"</h1>");
	out.println("<h2>by "+book.getAuthor()+"</h2>");
	out.println("<img style='display:block; width:200px; height:300px;' src='BookCoverArt/" + book.getBookCoverPath() + "'/>");
	out.println("<h3><b>About this book: </b></h3>");
	out.println(book.getBookDescription());
	out.println("<br/><b>Edition: </b>"+book.getEdition());
	out.println("<br/><b>Year: </b>"+book.getYear());
	out.println("<br/><b>Publisher: </b>"+book.getPublisher());
	out.println("<br/><b>Category: </b>"+book.getCategory());
	out.println("<br/><b>ISBN-10: </b>"+book.getIsbn10());
	out.println("<br/><b>ISBN-13: </b>"+book.getIsbn13());
	out.println("<br/><b>Price: </b>"+book.getPrice());
	out.println("<br/><b>Available: </b>"+book.getInvQty());

	
	//Link to buy book (create transaction)
	/* code goes here */
	
	//Gets all the reviews from this book
	RatingDB ratingDB = new RatingDB();
	ArrayList<Rating> rate =  ratingDB.selectRatingsByBook(book.getBookId());
%>
	<h3><a href="BookListRatings.jsp?BookId=<%= book.getBookId()%>"> View all book ratings</a></h3>
<%	
	//Display the login users options
	if (!firstName.equals(""))
	{		
		//Check if this user has already rated this book		
		if (ratingDB.isRated(userId , book.getBookId()))
		{
			out.println("<h3><a href=EditRating.jsp?BookId=" + book.getBookId() + "&UserId="+ userId + ">Edit your rating</a></h3>");
		}
		else
		{
			out.println("<h3><a href=AddRating.jsp?BookId=" + book.getBookId() + ">Rate this book</a></h3>");
		}
		
		out.println("<h3><a href=AddTrans.jsp?BookId=" + book.getBookId() + ">Buy this book</a></h3>");
	}

%>
	<table>
		<thead>
			<tr>	
				<th>Ratings ID</th>
				<th>Stars</th>
				<th>Date</th>
				<th>Comments</th>
				<th>User ID</th>
				<th>Book ID</th>
			</tr>
		</thead>
		<tbody>
<%
		for (int i = 0; i< rate.size(); i++)
		{
			out.println("<tr>");
			out.println("<td>" + rate.get(i).getRatingsId() + "</td>");
			out.println("<td>" + rate.get(i).getStars() + "</td>");
			out.println("<td>" + rate.get(i).getDate() + "</td>");
			String descr = rate.get(i).getComments();
			descr = descr.substring(0, Math.min(descr.length(), 100));
			out.println("<td>" + descr + "</td>");
			out.println("<td>" + rate.get(i).getUserId() + "</td>");
			out.println("<td>" + rate.get(i).getBookId() + "</td>");
			out.println("</tr>");
		}
%>
		</tbody>
	</table>
</body>
</html>