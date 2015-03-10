<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>
<%@ page import="UserMgmt.user.User" %>
<%@ page import="UserMgmt.business.UserDB" %>
<%	
	UserDB userDB = new UserDB();
	
	User user = userDB.selectUser(Integer.parseInt(request.getParameter("UserId")));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="css/c06.css" />
	<title>Profile - The Best Bookstore</title>
</head>
<body>

</body>
</html>