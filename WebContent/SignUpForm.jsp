<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>
<%@ page import="UserMgmt.user.User" %>
<%@ page import="UserMgmt.business.UserDB"%> 
<%@ page import="UserMgmt.business.SignUp"%> 

<%	
	UserDB userDB = new UserDB();
	User user = new User(); 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>SignUpForm</title>
</head>

<body>
  <form action="SignUp" method="post">
			<fieldset>
				<legend class="legend_text"> Please enter your info</legend>
				<div><label>  First Name: </label><input type="text" name="FirstName" />
				<label>  Last Name: </label><input type="text" name="name" /></div>
				<div><span class="star"></span><label>  Email:</label><input type="text" name="email" id="email" /></div>
				<input type="hidden" name="UserId" />
				<input type="submit" value="Sign Up" id="submit"/>
			</fieldset>
		</form>
</body>
</html>