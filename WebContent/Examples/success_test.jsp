<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>success test.jsp</title>
</head>

<body>
    <!-- import packages and classes needed by the scripts -->
    <%@ page import="data.dbConnect.*, java.sql.Connection" %>
    
	<%
		String driver = "org.gjt.mm.mysql.Driver";
		String url = "jdbc:mysql://localhost:3306/CSS490D"; // your DB schema name
		String username = "root"; 							// your mysql username
		String passwd = ""; 							// your mysql user password

		DBConnectionPool connPool = new DBConnectionPool(url, username, passwd);
		Connection conn = connPool.getConnection();
	
		if (conn != null)
			out.println("Success");
		else
			out.println("Failed");
	%>

</body>
</html>