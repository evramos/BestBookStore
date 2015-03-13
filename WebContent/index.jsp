<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>
<%@ page import="BookMgmt.Book.BookDB" %>
<%@ page import="BookMgmt.Book.*" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<!-- <link rel="stylesheet" href="css/c06.css" /> -->	
	<title>Home - The Best Bookstore</title>
	<style type="text/css">
		element.style { border-color: rgb(29, 107, 176); }
		div { background-color: lightblue; padding: 5px; }
	</style>
</head>
<body>

<%
/*------------------------------------------------------------------------------------------------*/
	//Request all the cookies
	Cookie[] cookies = request.getCookies();

	String firstName = "";
	boolean isAdmin = false;
	if (cookies != null)
	{
		for (int i = 0; i< cookies.length; i++)
		{
			if (cookies[i].getName().equals("firstName")) { firstName = cookies[i].getValue(); }
			if (cookies[i].getName().equals("isAdmin")) { isAdmin = cookies[i].getValue().equals("true"); }
		}
	}

	//Navigation Menubar
	out.println("<div><h1>THE BEST BOOKSTORE</h1>");
			
	if (!firstName.equals(""))
	{
		out.println("Welcome " + firstName);
		if (isAdmin == true) { out.println("[ADMIN MODE]"); }
		out.println("<br/><a href=\"SignOut\">Logout</a>");
	} 
	else { out.println("Please <a href=SignIn.jsp>SignIn</a> or <a href=signUpForm_User.jsp>Create an account</a>"); }
	
	out.println("</div>");
%>
	<h2>Useful Links</h2>
		<ul style="list-style-type:none">
<%
  	if (!firstName.equals(""))
	{	
		//Visible only to the administration members
		if (isAdmin == true)
		{%>
			<li><a href=addBook.jsp>Add a new book</a></li>
			<li><a href=userList.jsp>View all users</a></li>
			<li><a href=SalesReports.jsp>View Sales Report</a></li>
	   <%}
	}
/*------------------------------------------------------------------------------------------------*/
%>
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
			<option value="ISBN_10">ISBN-10</option>
			<option value="ISBN_13">ISBN-13</option>
		</select>
		<input type="text" name="term" id="Search box"/>
		<input type="submit" value="Search" id="submit"/>
		</div>
		
		<p></p>
		<div> 
		Privacy Notice | © 2015, BestBookStore.com
		</div>
	</form>
</body>
</html>