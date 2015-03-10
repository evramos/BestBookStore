<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>
<%@ page import="TransMgmt.trans.transviewDB" %>
<%@ page import="TransMgmt.trans.transview" %>
<%@ page import="org.apache.commons.io.IOUtils"%>
<%@ page import="org.apache.commons.codec.binary.Base64"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sales Reports</title>
</head>
<body>

<%
	
	transviewDB transviewDB = new transviewDB();
	java.util.Date date = new java.util.Date();
	java.sql.Timestamp now = new Timestamp(date.getTime());
	java.sql.Timestamp lastweek = new Timestamp(date.getTime() - 604800000);
	java.sql.Timestamp lastmonth= new Timestamp(date.getTime() - (604800000 * 4));
	float TotalSales = 0;
	int TotalTrans = 0;
	float prevTotalSales = 0;
	int prevTotalTrans = 0;
	float currMonSales = 0;
	int currMonTrans = 0;
	float prevMonSales = 0;
	int prevMonTrans = 0;
	
	out.println(now+"<br>");
	out.println(lastweek+"<br>");
	out.println(lastmonth+"<br>");
	
	ArrayList<transview> weekTrans = transviewDB.selectWeek(now);
	ArrayList<transview> prevWeekTrans = transviewDB.selectWeek(lastweek);
	ArrayList<transview> monTrans = transviewDB.selectMonth(now);
	ArrayList<transview> PrevMonTrans = transviewDB.selectMonth(lastmonth);
	
	for(int i = 0; i < weekTrans.size(); i++)
	{
				
		TotalTrans = TotalTrans++;
		TotalSales = TotalSales + (weekTrans.get(i).getPrice() * weekTrans.get(i).getOrderQty());
	}
	
	for(int i = 0; i < prevWeekTrans.size(); i++)
	{
		prevTotalTrans++;
		TotalSales = TotalSales + (prevWeekTrans.get(i).getPrice() * prevWeekTrans.get(i).getOrderQty());
	}

	for(int i = 0; i < monTrans.size(); i++)
	{
				
		currMonTrans = currMonTrans++;
		currMonSales = currMonSales + (monTrans.get(i).getPrice() * monTrans.get(i).getOrderQty());
	}
	
	for(int i = 0; i < PrevMonTrans.size(); i++)
	{
				
		prevMonTrans = prevMonTrans++;
		prevMonSales = prevMonSales + (PrevMonTrans.get(i).getPrice() * PrevMonTrans.get(i).getOrderQty());
	}
	
%>
<h2>Sales this week</h2>
<div>
	<p>Total Transactions: <%=TotalTrans %></p>
	<p>Total Sales: <%=TotalSales %></p>
</div>

<h2>Difference Since Last Week</h2>
	<p>Transaction Difference <%=prevTotalTrans - TotalTrans %></p>
	<p>Transaction Difference <%=prevTotalSales - TotalSales %></p>

<h2>Sales this Month</h2>
<div>
	<p>Total Transactions: <%=currMonTrans %></p>
	<p>Total Sales: <%=currMonSales %></p>
</div>

<h2>Difference Since Last Month</h2>
	<p>Transaction Difference <%=prevMonTrans - currMonTrans %></p>
	<p>Sales Difference <%=prevMonSales - currMonSales %></p>

</body>
</html>