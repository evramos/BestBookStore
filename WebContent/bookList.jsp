<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>

<%@ page import="java.sql.*,java.util.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>
<%@ page import="BookMgmt.Book.*" %>
<%@ page import="org.apache.commons.io.IOUtils"%>
<%@ page import="org.apache.commons.codec.binary.Base64"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
	<title>All Books in the Bookstore</title>
	<link rel="stylesheet" href="css/c06.css"/>
</head>
<body>
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
		BookDB bookDB = new BookDB();
		ArrayList<Book> bookList= bookDB.selectBooks(); 

		for (int i = 0; i < bookList.size(); i++)
		{
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
			out.println("<td><a href=\"bookUpdateForm.jsp?BookId="+bookList.get(i).getBookId()+"\">[ Update ]</a>"+
				"<a href=\"DeleteBook?BookId="+bookList.get(i).getBookId()+"\">[ Delete ]</a></td>");
			out.println("</tr>");
		}

%>
		</tbody>
	</table>
</body>
</html>