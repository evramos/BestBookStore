<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>
<%@ page import="TransMgmt.trans.transviewDB" %>
<%@ page import="TransMgmt.trans.transview" %>

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


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Sales Reports</title>
	<style type="text/css">
	 	element.style { border-color: rgb(29, 107, 176); }
	 	div { background-color: lightblue; padding: 5px; }
	 </style>
</head>
<body>
	<div>
		<h1>THE BEST BOOKSTORE</h1>
<%
	if (!firstName.equals(""))
	{
		out.println("Welcome " + firstName);
		if (isAdmin.equals("true")) { out.println("[ADMIN MODE]"); }
		out.println("<br/><a href=\"./index.jsp\">Home</a>");
		out.println("<a href=\"SignOut\">Logout</a>");

	} 
	else { out.println("Please <a href=\"SignIn.jsp\">SignIn</a> or <a href=\"signUpForm_User.jsp\">Create an account</a>");	}
%>

	</div>
<%
	
	transviewDB tviewDB = new transviewDB();
	java.util.Date date = new java.util.Date();
	java.sql.Timestamp now = new Timestamp(date.getTime());
	java.sql.Timestamp lastweek = new Timestamp(date.getTime() - 604800000);
	java.sql.Timestamp lastmonth= new Timestamp(date.getTime() - (604800000 * 4));
	
	float totalSales = 0;
	int totalTrans = 0;
	
	float prevTotalSales = 0;
	int prevTotalTrans = 0;
	
	float currMonSales = 0;
	int currMonTrans = 0;
	
	float prevMonSales = 0;
	int prevMonTrans = 0;
	
/* 	out.println(now+"<br>");
	out.println(lastweek+"<br>");
	out.println(lastmonth+"<br>");
	 */
	ArrayList<transview> weekTrans = tviewDB.selectWeek(0,7); 			// 0 equals now; 7 equals number of days before now
	ArrayList<transview> prevWeekTrans = tviewDB.selectWeek(8, 15);
//	ArrayList<transview> monTrans = transviewDB.selectMonth(now);
//	ArrayList<transview> PrevMonTrans = transviewDB.selectMonth(lastmonth);
	
	for (int i = 0; i < weekTrans.size(); i++)
	{		
		totalTrans++;
		totalSales += (weekTrans.get(i).getPrice() * weekTrans.get(i).getOrderQty());
	}

   	for(int i = 0; i < prevWeekTrans.size(); i++)
	{
		prevTotalTrans++;
		prevTotalSales += (prevWeekTrans.get(i).getPrice() * prevWeekTrans.get(i).getOrderQty());
	}

//	for(int i = 0; i < monTrans.size(); i++)
//	{
//				
//		currMonTrans = currMonTrans++;
//		currMonSales = currMonSales + (monTrans.get(i).getPrice() * monTrans.get(i).getOrderQty());
//	}
//	
//	for(int i = 0; i < PrevMonTrans.size(); i++)
//	{
//				
//		prevMonTrans = prevMonTrans++;
//		prevMonSales = prevMonSales + (PrevMonTrans.get(i).getPrice() * PrevMonTrans.get(i).getOrderQty());
//	}
	out.println("<h2>Sales this week</h2>");
	out.println("<div>");	
	out.println("<p>Total Transactions: " + totalTrans + "</p>");
	out.println("<p>Total Sales: $" + String.format("%.2f",totalSales) + "</p>");
	out.println("</div>");

	out.println("<h2>Difference Since Last Week</h2>");
	out.println("<div>");	
	out.println("<p>Total Transactions: " + prevTotalTrans + "</p>");
	out.println("<p>Total Sales: $" + String.format("%.2f",prevTotalSales) + "</p>");
	out.println("</div>");


%>

<h2>Difference Since Last Week</h2>
	<p>Transaction Difference <%=prevTotalTrans - totalTrans %></p>
	<p>Transaction Difference $<%=prevTotalSales - totalSales %></p>

<h2>Sales this Month</h2>
<div>
	<p>Total Transactions: <%=currMonTrans %></p>
	<p>Total Sales: $<%=currMonSales %></p>
</div>

<h2>Difference Since Last Month</h2>
	<p>Transaction Difference <%=prevMonTrans - currMonTrans %></p>
	<p>Sales Difference $<%=prevMonSales - currMonSales %></p>

</body>
</html>