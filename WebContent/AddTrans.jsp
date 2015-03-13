<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>
<%@ page import="TransMgmt.trans.Transaction" %>
<%@ page import="TransMgmt.trans.TransactionDB"%> 
<%@ page import="TransMgmt.trans.AddTransaction"%> 
<%	

	Cookie[] cookies = request.getCookies();
	String userId = "";

	if (cookies != null)
	{
		for (int i = 0; i< cookies.length; i++)
		{
			if (cookies[i].getName().equals("userId")) { userId = cookies[i].getValue(); }
		}
	}
	
	int bookID = Integer.parseInt(request.getParameter("BookId"));
	TransactionDB transDB = new TransactionDB();
	Transaction trans = new Transaction(); 
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Purchase Form</title>
</head>
<body>
<form action="AddOrder" method="post">
			<fieldset>
				<legend class="legend_text"> Please enter purchase info</legend>
				<div><label>  UserId: </label><input type="text" name="UserId" id="UserId" value="<%=userId %>"/>
				<label>  BookId: </label><input type="text" name="BookId" id="BookId" value="<%=bookID%>"/></div>
				<div><label>  OrderQty:</label><input type="test" name="OrderQty" id="OrderQty"></div>
				<input type="submit" value="Purchase" id="submit"/>
			</fieldset>
		</form>
</body>
</html>