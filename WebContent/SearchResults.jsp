<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>
<%@ page import="BookMgmt.Book.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/c06.css" />
<title>Search Results - The Best Bookstore</title>
</head>
<body>
<h1>Search Results</h1>
<table>
		<thead>
			<tr>	
				<th>Book ID</th>
				<th>Title </th>
				<th>Author</th>
				<th>Picture</th>
				<th>Description</th>
				<th>Edition</th>
				<th>Year</th>
				<th>Publisher</th>
				<th>Category</th>
				<th>ISBN-10</th>
				<th>ISBN-13</th>
				<th>Price</th>
				<th>Inventory Qty</th>
			</tr>
		</thead>
		<tbody>
		<%

		String type = request.getParameter("type");
		String term = "\"%" + request.getParameter("term") + "%\"";
		BookDB bookDB = new BookDB();
		ArrayList<Book> bookList= bookDB.selectBooksByTerm(type, term);

		for(int i = 0; i< bookList.size(); i++){
			out.println("<tr>");
			out.println("<td>"+bookList.get(i).getBookId()+"</td>");
			out.println("<td>"+bookList.get(i).getTitle()+"</td>");
			out.println("<td>"+bookList.get(i).getAuthor()+"</td>");
			out.println("<td><img style=\"display:block; width:40px; height:60px;\" src=\"BookCoverArt/" + bookList.get(i).getBookCoverPath() + "\"></td>");
			String descr = bookList.get(i).getBookDescription();
			descr = descr.substring(0, Math.min(descr.length(), 100));
			out.println("<td>"+descr+"</td>");
			out.println("<td>"+bookList.get(i).getEdition()+"</td>");
			out.println("<td>"+bookList.get(i).getYear()+"</td>");
			out.println("<td>"+bookList.get(i).getPublisher()+"</td>");
			out.println("<td>"+bookList.get(i).getCategory()+"</td>");
			out.println("<td>"+bookList.get(i).getIsbn10()+"</td>");
			out.println("<td>"+bookList.get(i).getIsbn13()+"</td>");
			out.println("<td>"+bookList.get(i).getPrice()+"</td>");
			out.println("<td>"+bookList.get(i).getInvQty()+"</td>");
			out.println("<td><a href=\"BookView.jsp?BookId="+bookList.get(i).getBookId()+"\">[View]</a>");
			out.println("</tr>");
		}
		%>
		</tbody>
</table>
</body>
</html>