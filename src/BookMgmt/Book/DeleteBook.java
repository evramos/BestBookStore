package BookMgmt.Book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import BookMgmt.Book.BookDB;
@WebServlet("/DeleteBook")
public class DeleteBook extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String BookId= request.getParameter("RatingId");
		
		BookDB dbConn = new BookDB();
		
		int i = dbConn.deleteBook(Integer.parseInt(BookId));
		if(i > 0){
				response.sendRedirect("/bookList.jsp");
		}else{
			response.sendRedirect("AddRatingsError.html");
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		doPost(request, response);
	}

}


