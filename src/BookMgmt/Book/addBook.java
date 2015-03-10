package BookMgmt.Book;
import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.apache.commons.io.IOUtils;
import org.apache.commons.codec.binary.Base64;

import BookMgmt.Book.Book;
import BookMgmt.Book.BookDB;


@WebServlet("/addBook")
public class addBook extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public addBook() throws Exception
	{
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String title = request.getParameter("title");

		if (title != null)
		{
			String author = request.getParameter("author");
			
			String filepath = "/Users/RevZero/Desktop/images/" + request.getParameter("bookCoverArt");
			InputStream bookCoverArt = new FileInputStream(new File(filepath));
			byte[] bytes = IOUtils.toByteArray(bookCoverArt);			
			
			String category = request.getParameter("category");
			String description = request.getParameter("bookDescription");
			String edition = request.getParameter("edition");
			int year = Integer.parseInt(request.getParameter("year"));
			String publisher = request.getParameter("publisher");
			String isbn10 = request.getParameter("isbn10");
			String isbn13 = request.getParameter("isbn13");
			Float price = Float.parseFloat(request.getParameter("price"));
			int invQty = Integer.parseInt(request.getParameter("invQty"));

			Book book = new Book(title, author, bytes, category, description, edition, year, publisher, isbn10, isbn13, price, invQty);

			out.println("<p>Title: " + title + "</p>");
			out.println("<p>Author: " + author + "</p>");

			String bookCoverImage = new String(Base64.encodeBase64(book.getBookCoverArt()));
			out.println("<img style='display:block; width:200px; height:300px;' src='data:image/jpeg;base64," + bookCoverImage + "' />");

			out.println("<p>Category: " + category + "</p>");
			out.println("<p>Description: " + description + "</p>");
			out.println("<p>Edition: " + edition + "</p>");
			out.println("<p>Year: " + year + "</p>");
			out.println("<p>Publisher: " + publisher + "</p>");
			out.println("<p>ISBN-10: " + isbn10 + "</p>");
			out.println("<p>ISBN-13: " + isbn13 + "</p>");
			out.println("<p>Price: " + price + "</p>");
			out.println("<p>Inventory: " + invQty + "</p>");
			
			BookDB dbConn = new BookDB();

			int i = dbConn.addBook(book);

			out.println("<p>Number: " + i + "</p>");

			if (i > 0)
			{
				// response.sendRedirect("../addBook.jsp");
				out.println("<p>Successful Added Book</p>");
			}
			else
			{
				out.println("<p>Unsuccessful Added Book</p>");
			 	// response.sendRedirect("signUpError.html");
			}
		}
		else
		{
			response.sendRedirect("./addBook.jsp");
		}		
	}
}
