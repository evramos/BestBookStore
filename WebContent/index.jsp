<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>
<%@ page import="BookMgmt.Book.BookDB" %>
<%@ page import="BookMgmt.Book.*" %>
 
<%
	Cookie[] cookies = request.getCookies();
	String firstName = "";
	if (cookies != null)
	{
		for (int i = 0; i< cookies.length; i++)
		{
			if (cookies[i].getName().equals("firstName"))
			{
				firstName = cookies[i].getValue();
			}
		}
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- 	<link rel="stylesheet" href="css/c06.css" /> -->	
	 <title>Home - The Best Bookstore</title>
	 
	 <style type="text/css">
	 	element.style
	 	{
	 		border-color: rgb(29, 107, 176);
	 	}

	 	div
	 	{
	 		background-color: lightblue;
	 		padding: 5px;
	 	}

	 </style>
</head>
<body>
	<div>
		<h1>THE BEST BOOKSTORE</h1>
<%
	if (!firstName.equals("")) {%>
		Welcome <%= firstName %><br/><a href="SignOut">Logout</a>
	<%} else {%>
		Please <a href="SignIn.jsp">SignIn</a> or <a href="signUpForm_User.jsp">Create an account</a>
	<%}
%>

	</div>

	<h2>Useful Links</h2>
	<ul style="list-style-type:none">
	<li><a href="signUpForm_User.jsp">Create an account</a></li>
	<li><a href="SignIn.jsp">Log in</a></li>
	<li><a href="bookList.jsp">View all books</a></li>
	</ul>

	<form action="SearchResults.jsp" method="get">
	<h2>Search for a book</h2>
	<div><select name="type">
			<option value="" disabled>Search By...</option>
			<option value="Author">Author</option>
			<option value="Title">Title</option>
			<option value="Publisher">Publisher</option>
			<option value=" Edition">Edition</option>
			<option value="Year">Year</option>
			<option value="ISBN-10">ISBN-10</option>
			<option value="ISBN-13">ISBN-13</option>
		</select>
		<input type="text" name="term" id="Search box"/>
		<input type="submit" value="Search" id="submit"/>
		

	</div>
	</form>
</body>
</html>