package BookMgmt;
import java.io.IOException;
import java.sql.Blob;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BookMgmt.Book;

@WebServlet("/BookUpdate")
public class BookUpdate extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		Book book = new Book();
		book.setBookId(Integer.parseInt(request.getParameter("bookId")));
		book.setTitle(request.getParameter("title"));
		book.setAuthor(request.getParameter("author"));
		book.setCategory(request.getParameter("category"));
		
//	    book.setBookCoverArt(request.getParameter("bookCoverArt"));
		
		book.setBookDescription(request.getParameter("bookDescription"));
		book.setEdition(request.getParameter("edition"));
		book.setYear(Integer.parseInt(request.getParameter("year")));
		book.setPublisher(request.getParameter("publisher"));
		book.setCategory(request.getParameter("category"));
		book.setIsbn10(request.getParameter("isbn10"));
		book.setIsbn13(request.getParameter("isbn13"));
		book.setPrice(Integer.parseInt(request.getParameter("price")));
		book.setInvQty(Integer.parseInt(request.getParameter("invQty")));
		
		BookDB dbConn = new BookDB();
		int i = dbConn.updateBook(book);
		if(i > 0)
		{
			response.sendRedirect("/book.jsp");
		}
		else
		{
			response.sendRedirect("bookError.html");
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request, response);
	}

}
