<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<%@ page import="java.sql.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>
<%@ page import="BookMgmt.Book.*" %>
<%	
	String bookId = request.getParameter("bookId");
	BookDB bookDB = new BookDB();
	Book book = bookDB.selectBook(Integer.parseInt(bookId));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head><title>Book Table</title>
		<link rel="stylesheet" href="css/c06.css" />
	</head>
	<body>
		<form action="BookUpdate" method="post">
			<fieldset>
				<legend class="legend_text"> Book Info</legend>
				<div><label> Title: </label><input type="text" name="title" value="<%=book.getTitle()%>"/></div>
				<div><label>  Author: </label><input type="text" name="author" value="<%=book.getAuthor()%>"/></div>
				<div><span class="star"></span><label>  Description: </label><input type="text" name="email" id="email" value="<%=book.getBookDescription()%>"/></div>
				<input type="hidden" name="BookId" value="<%=book.getBookId()%>"/>
				<input type="submit" value="Update Info" id="submit"/>
			</fieldset>
		</form>
	</body>
</html>