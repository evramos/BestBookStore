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

			String category = request.getParameter("category");
			String description = request.getParameter("bookDescription");
			String edition = request.getParameter("edition");
			int year = Integer.parseInt(request.getParameter("year"));
			String publisher = request.getParameter("publisher");
			String isbn10 = request.getParameter("isbn10");
			String isbn13 = request.getParameter("isbn13");
			Float price = Float.parseFloat(request.getParameter("price"));
			int invQty = Integer.parseInt(request.getParameter("invQty"));

			Book book = new Book(title, author, bookCoverArt, category, description, edition, year, publisher, isbn10, isbn13, price, invQty);

			out.println("<p>" + title + "</p>");
			out.println("<p>" + author + "</p>");

			String bookCoverImage = new String(Base64.encodeBase64(IOUtils.toByteArray(bookCoverArt)));
			out.println("<img style='display:block; width:200px; height:300px;' src='data:image/jpeg;base64," + bookCoverImage + "' />");

			out.println("<p>" + category + "</p>");
			out.println("<p>" + description + "</p>");
			out.println("<p>" + edition + "</p>");
			out.println("<p>" + year + "</p>");
			out.println("<p>" + publisher + "</p>");
			out.println("<p>" + isbn10 + "</p>");
			out.println("<p>" + isbn13 + "</p>");
			out.println("<p>" + price + "</p>");
			out.println("<p>" + invQty + "</p>");
			
			BookDB dbConn = new BookDB();

			int i = dbConn.addBook(book);

			out.println("<p>" + "Number: " + i + "</p>");

			if (i > 0)
			{
				// response.sendRedirect("../addBook.jsp");
				out.println("<p>Successful Added Book" + "</p>");
			}
			else
			{
				out.println("<p>Unsuccessful Added Book" + "</p>");
			 	// response.sendRedirect("signUpError.html");
			}
		}
		else
		{
			response.sendRedirect("./addBook.jsp");
		}		
	}
}
