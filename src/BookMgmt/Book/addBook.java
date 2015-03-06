package BookMgmt.Book;
import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import BookMgmt.Book.Book;
import BookMgmt.Book.BookDB;


@WebServlet("/AddBook")
public class addBook extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public addBook() throws Exception
	{
		super();
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		Book book = new Book();

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
		int i = dbConn.addBook(book);
		if(i > 0){
				response.sendRedirect("../index.jsp");
		}else{
			response.sendRedirect("signUpError.html");
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request, response);
	}
}
