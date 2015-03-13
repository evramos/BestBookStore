<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<%@ page import="java.sql.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>
<%@ page import="UserMgmt.business.User" %>
<%@ page import="UserMgmt.business.UserDB"%> 
<%@ page import="UserMgmt.business.UserUpdate"%>

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

	
	int userId = Integer.parseInt(request.getParameter("userId"));
	UserDB userDB = new UserDB();
	User user = userDB.selectUser(userId);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Edit Profile - The Best Bookstore</title>
	<link rel="stylesheet" href="css/c06.css" />
</head>
	<body>
		<div>
		<h1>THE BEST BOOKSTORE</h1>
<%
	if (!firstName.equals(""))
	{
		out.println("Welcome " + firstName);
		if (isAdmin.equals("true")) { out.println("[ADMIN MODE]"); }
		out.println("<br/><a href=\"index.jsp\">Home</a>");
		out.println("<a href=\"userList.jsp\">User list</a>");
		out.println("<a href=\"SignOut\">Logout</a>");
	} 
	else { out.println("Please <a href=\"SignIn.jsp\">SignIn</a> or <a href=\"signUpForm_User.jsp\">Create an account</a>");	}
%>

		</div>
	
	
		<form action="UserUpdate" method="post">
			<fieldset>
				<legend class="legend_text"> Your Login Info</legend>
				<div><label>  First Name: </label><input type="text" name="FirstName" value="<%=user.getFirstName()%>"/>
				<label>  Last Name: </label><input type="text" name="LastName" value="<%=user.getLastName()%>"/></div>
				<div><span class="star"></span><label>  Email: </label><input type="text" name="email" id="email" value="<%=user.getEmail()%>"/></div>
				<input type="hidden" name="UserId" value="<%=user.getUserId()%>"/>
				<input type="submit" value="Update Info" id="submit"/>
				<div><a href="/index?UserId="<%=user.getUserId() %> id="passwd_change">Change your password</a></div>
			</fieldset>
		</form>
	</body>
</html>