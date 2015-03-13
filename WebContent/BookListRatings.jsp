<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>
<%@ page import="ratingMgmt.rating.*" %>
<%@ page import="UserMgmt.business.*" %>
<%@ page import="BookMgmt.Book.*"%>

<%
	Cookie[] cookies = request.getCookies();
	String firstName = "";
	String isAdmin = "";
	if (cookies != null)
	{
		for (int i = 0; i< cookies.length; i++)
		{
			if (cookies[i].getName().equals("firstName")) { firstName = cookies[i].getValue(); }
			if (cookies[i].getName().equals("isAdmin")) { isAdmin = cookies[i].getValue(); }
		}
	}

	RatingDB ratingDB = new RatingDB();
	UserDB userDB = new UserDB();
	BookDB bookDB = new BookDB();
	
	Book book = bookDB.selectBook(Integer.parseInt(request.getParameter("BookId")));
	User user;
%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>All Ratings - The Best Bookstore</title>
	<link rel="stylesheet" href="css/c06.css" />
	<style type="text/css">
	 	element.style { border-color: rgb(29, 107, 176); }
	 	div { background-color: lightblue; padding: 5px; }
	</style>
	</head>
	<body>
	
		<div>
		<h1>THE BEST BOOKSTORE</h1>
<%
	if (!firstName.equals(""))
	{
		out.println("Welcome " + firstName);
		if (isAdmin.equals("true")) { out.println("[ADMIN MODE]"); }
		out.println("<br/><a href=\"./index.jsp\">Home</a>");
		out.println("<a href=\"SignOut\">Logout</a>");

	} 
	else { out.println("Please <a href=\"SignIn.jsp\">SignIn</a> or <a href=\"signUpForm_User.jsp\">Create an account</a>");	}
%>

	</div>
	
	
	<p><h3><a href="BookView.jsp?BookId=<%= book.getBookId()%>"> Return to book details</a></h3></p>
	
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
		for(int i = 0; i < ratingList.size(); i++)
		{
			user = userDB.selectUser(ratingList.get(i).getUserId());
			
			out.println("<tr>");
			out.println("<td>"+user.getLastName()+", "+user.getFirstName()+"</td>");
			out.println("<td>"+ratingList.get(i).getStars()+"</td>");			
			
			String descr = ratingList.get(i).getComments();
			descr = descr.substring(0, Math.min(descr.length(), 500));
			out.println("<td>"+descr+"</td>");
			
			out.println("</tr>");
		}
%>
		</tbody>
</table>

	</body>
</html>