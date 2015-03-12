<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII" import="java.io.*,java.util.*, javax.servlet.*"%>

<%@ page import="java.sql.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
	<title>signUp_db.jsp</title>

	<style type="text/css">
		img{	
			width: 50%;
			height: 50%;
		}
	</style>
</head>

<body>

<%
	DBConnectionPool connPool = null;
	Statement stmt = null;
	Connection conn = null;

	try
	{
		String db_url = "jdbc:mysql://localhost:3306/CSS490D";
		String db_username = "root";
		String db_passwd = "";

		connPool = new DBConnectionPool(db_url, db_username, db_passwd);
		conn = connPool.getConnection();
		
		if (conn != null)
		{
			stmt = conn.createStatement();
			
			String username = request.getParameter("username");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			
			boolean flag = false;
			
			String strQuery = "select * from user where username = '"+username+"' or email = '"+email+"'";
			ResultSet rs = stmt.executeQuery(strQuery);

			if(rs.next()) flag = true;
		
			if(flag) {
%>
			<script language="JavaScript">
	        	alert("Your username is already in use or you're our member");
	        	window.history.go(-1);
	 		</script>
<%
			}

			else {
		
				strQuery = "insert into user(username, passwd, u_name, email, signUpDate, lastLogin) "+
						   "values('"+username+"', '"+passwd+"', '"+name+"', '"+email+"', now(), now())";
				stmt.executeUpdate(strQuery);
				
				response.sendRedirect("../index.jsp");
			}
		}

	} catch (SQLException e) {
	} finally {
		if (stmt != null) stmt.close();
		if (conn!= null) connPool.returnConnection(conn);
	}
%>
</body>
</html>
