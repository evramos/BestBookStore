<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>
<%@ page import="UserMgmt.business.User" %>
<%@ page import="UserMgmt.business.UserDB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
	<title>All Users - The Best Bookstore</title>
	<link rel="stylesheet" href="css/c06.css"/>
	 <style type="text/css">
	 	element.style { border-color: rgb(29, 107, 176); }
	 	div { background-color: lightblue; padding: 5px; }
	 </style>

</head>
<body>

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
		Please <a href="SignIn.jsp">SignIn</a> or <a href="signUpForm_User.jsp">Create an account</a>
	<%}
%>

	</div>

	<table>
		<thead>
			<tr>
 				<th>UserId</th>	
 				<th>FirstName </th>
				<th>LastName</th>
				<th>Email</th>
				<th>Status</th>
				<th>Modify</th>
			</tr>
		</thead>
		<tbody>

<%
		UserDB userDB = new UserDB();
		ArrayList<User> userList= userDB.selectUsers();

		for (int i = 0; i< userList.size(); i++)
			{
			out.println("<tr>");
			out.println("<td>"+userList.get(i).getUserId() +"</td>");
			out.println("<td>"+userList.get(i).getFirstName()+"</td>");
			out.println("<td>"+userList.get(i).getLastName()+"</td>");
			out.println("<td>"+userList.get(i).getEmail()+"</td>");
			out.println("<td>"+ (userList.get(i).getIsAdmin()?"admin":"user") +"</td>");
//			out.println("<td>"+userList.get(i).getSignDate()+"</td>");
//			out.println("<td>"+userList.get(i).getLastDate()+"</td>");
			out.println("<td><a href=\"userUpdateForm.jsp?userId="+userList.get(i).getUserId()+"\">[Update]</a>"+
				"<a href=\"UserDelete?UserId="+userList.get(i).getUserId()+"\">[Delete]</a></td>");
			out.println("</tr>");
		}

%>
		</tbody>
	</table>
</body>
</html>