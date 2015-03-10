<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>
<%@ page import="BookMgmt.Book.BookDB" %>
<%@ page import="BookMgmt.Book.*" %>
<%@ page import="UserMgmt.user.*" %>
<%@ page import="UserMgmt.business.*" %>
<%
    BookDB bookDB = new BookDB();
	UserDB userDB = new UserDB();
	User user = new User();
	int userid = 0;
	if (request.getParameter("UserId") != null) {
		userid = Integer.parseInt(request.getParameter("UserId"));
		user = userDB.selectUser(userid);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="css/c06.css" />
	<title>Home - The Best Bookstore</title>
</head>
<body>
<h1>THE BEST BOOKSTORE</h1>
<% if (userid == 0)  {%>
	<ul style="list-style-type:none">
	<li><a href="signUpForm_User.jsp">Create an account</a></li>
	<li><a href="SignIn.jsp">Log in</a></li>
	</ul>
<%} else {%>
<h1>Welcome <%=user.getFirstName()%>!</h1>
<h2>Search for a book</h2>
<form action="SearchResults.jsp" method="get">
<div><select name="type">
		<option value="" disabled>Search By...</option>
		<option value="Title">Title</option>
		<option value="Author">Author</option>
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
<ul style="list-style-type:none">
<li><a href="userUpdateForm.jsp?UserId="<%=user.getUserId()%>>Edit Info</a></li>
<li><a href="bookList.jsp">View all books</a></li>
<li><a href="userList.jsp">View all users</a>
</ul>
<%} %>

</body>
</html>