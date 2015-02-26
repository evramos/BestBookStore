<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%@ page import="exercise.servlet.*, java.io.*" %>
     
     
     
	<%
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
	%>

	<p>
		<%= num1 %> + <%= num2 %> = <%= (num1 + num2) %><br>
		<%= num1 %> - <%= num2 %> = <%= (num1 - num2) %><br>
		<%= num1 %> * <%= num2 %> = <%= (num1 * num2) %><br>
		<%= num1 %> / <%= num2 %> = <%= (num1 / num2) %><br>
		<%= num1 %> % <%= num2 %> = <%= (num1 % num2) %>
	</p>
		
	<form action="inputForm.html" method="get">
        <input type="submit" value="Back">
    </form>

</body>
</html>