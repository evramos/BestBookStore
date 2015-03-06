<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>
<%@ page import="ratingMgmt.rating.*" %>
<%@ page import="UserMgmt.user.*" %>
<%@ page import="UserMgmt.business.UserDB" %>
<%@ page import="BookMgmt.Book.Book"%>
<%@ page import="BookMgmt.Book.BookDB"%>
<%	
	RatingDB ratingDB = new RatingDB();
	UserDB userDBConn = new UserDB();
	BookDB bookDBConn = new BookDB();
	
	rating Rating = new rating(); 
	User user = userDBConn.selectUser(Integer.parseInt(request.getParameter("UserId")));
	Book book = bookDBConn.selectBook(Integer.parseInt(request.getParameter("BookId")));

%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Rating for <%=book.getTitle()%>></title>
</head>
<body>
<div>
<label>User Info: </label>
<%=user.getFirstName() %>, <%=user.getLastName() %><br>
</div>
<div>
<label>Book Info: </label>
<%=book.getTitle() %><br>
</div>
<form action="AddRating" method="post">
			<fieldset>
				<legend class="legend_text"> Please enter your Rating</legend>
				<div><label>  Stars: <br> </label>
				<input type="radio" name="Stars" value="1" /> 1<input type="radio" name="Stars" value="2" /> 2
				<input type="radio" name="Stars" value="3" /> 3<input type="radio" name="Stars" value="4" /> 4
				<input type="radio" name="Stars" value="5" /> 5
				</div>
				<div><label> Comments: <br></label><textarea name="comment" rows="5" cols="80"></textarea></div>
				<input type="hidden" name="RatingId" />
				<input type = "hidden" name="BookId" value=<%=book.getBookId() %> />
				<input type = "hidden" name="UserId" value=<%=user.getUserId() %> />
				<input type="submit" value="Add Rating" id="submit"/>
			</fieldset>
		</form>
</body>
</html>