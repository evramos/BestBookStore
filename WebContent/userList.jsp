<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>
<%@ page import="UserMgmt.user.User" %>
<%@ page import="UserMgmt.business.UserDB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>List of Users</title>
<link rel="stylesheet" href="css/c06.css"/>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>UserId</th>
				<th>FirstName </th>
				<th>LastName</th>
				<th>Email</th>
				<th>Date of Signup</th>
				<th>Last Date to Log In</th>
				<th>Update/Delete</th>
			</tr>
		</thead>
		<tbody>
<%
		
		UserDB userDB = new UserDB();
		ArrayList<User> userList= userDB.selectUsers(); 
		for(int i = 0; i< userList.size(); i++){
			out.println("<tr>");
			out.println("<td>"+userList.get(i).getUserId()+"</td>");
			out.println("<td>"+userList.get(i).getFirstName()+"</td>");
			out.println("<td>"+userList.get(i).getLastName()+"</td>");
			out.println("<td>"+userList.get(i).getEmail()+"</td>");
//			out.println("<td>"+userList.get(i).getSignDate()+"</td>");
//			out.println("<td>"+userList.get(i).getLastDate()+"</td>");
			out.println("<td><a href=\"userUpdateForm.jsp?username="+userList.get(i).getUserId()+"\">[ Update ]</a>"+
				"<a href=\"userDelete?username="+userList.get(i).getUserId()+"\">[ Delete ]</a></td>");
			out.println("</tr>");
		}

%>
		</tbody>
	</table>
</body>
</html>