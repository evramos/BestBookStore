<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>
<%@ page import="BookMgmt.Book.BookDB" %>
<%@ page import="BookMgmt.Book.*" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="css/bootstrap.css" />
	    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.css">
	<title>Home - The Best Bookstore</title>
	
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
 
			$("[rel='tooltip']").tooltip();	
 
			$('#hover-cap-4col .thumbnail').hover(
				function() { $(this).find('.caption').fadeIn(250);}, //.slideDown(250)
				function() { $(this).find('.caption').fadeOut(500);} //.slideUp(205)
			);	
		});	
	</script>
	
	
	<style type="text/css">
		element.style { border-color: rgb(29, 107, 176); }
		.navigation { background-color: lightblue; padding: 5px; }
		
		.center
		{
    		margin-left: auto;
    		margin-right: auto;
    		width: 85%;
		}
		
/*  		.container {border: 1px solid Black}
 */ 		
 		#hover-cap-4col .thumbnail
 		{
			position:relative;
			overflow:hidden;	
		}
		.caption
		{
			display: none;
			position: absolute;
			top: 0;
			left: 0;
			background: rgba(0,0,0,0.4);
			width: 100%;
			height: 100%;
			color:#fff !important;
		}
 
 		
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
	out.println("<div class=\"row\">");
	out.println("<div class=\"container navigation\"><h1 class=\"col-md-9\">THE BEST BOOKSTORE</h1>");
			
	out.println("<div class=\"col-md-3\">");
	if (!firstName.equals(""))
	{
		out.println("Welcome " + firstName);
		if (isAdmin == true) { out.println("[ADMIN MODE]"); }
		out.println("<br/><a href=\"SignOut\">Logout</a>");
	} 
	else { out.println("<a style=\"width: 85px\" class=\"btn btn-primary \" href=SignIn.jsp>Sign In</a> or <a href=signUpForm_User.jsp>Create an account</a>"); }
	out.println("</div></div></div>");
%>
	<div class="container">
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
	</div>

	<div class="container">
		<h2>Top 10 books</h2>
		<div class="center row">
		
<%
	BookDB bookDB = new BookDB();
	ArrayList<Book> bookList= bookDB.selectTopBooks(10); 
	
	for (int i = 0; i < 10; i++)
	{%>
		<div class="col-xs-2" id="hover-cap-4col"> <!-- col-xs-1 col-sm-2 col-md-3  -->
		
			<div class="thumbnail">
				<div style="text-align: center" class="caption">
				<br/>
				<h4><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span></h4>
 				<p>View Details</p>
				 <p>View Reviews</p>
				 <p>Book Price</p>
				 <p>Add to Cart</p>
				</div>		
					
				<img style="display:block; width:140px; height:185px" src="BookCoverArt/<%=bookList.get(i).getBookCoverPath() %>" >
<!-- 				<img src="BookCoverArt/51MWGzWGOKL.jpg" alt="...">
 -->			</div>
			<h5 style="text-align: center;"> Ranked #<%=i+1 %></h5>
		</div>
  <%}
%>
		</div>
	</div>
	

	<form action="SearchResults.jsp" method="get">
		<h2 class="container">Search for a book</h2>
		<div class="container navigation"><select name="type">
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
	</form>

		<!-- Button trigger modal -->
		<!--<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  		Launch demo modal
		</button>-->

</body>
</html>