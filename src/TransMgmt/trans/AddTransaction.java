package TransMgmt.trans;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import TransMgmt.trans.Transaction;
import TransMgmt.trans.TransactionDB;

@WebServlet("/AddOrder")
public class AddTransaction extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public AddTransaction() throws Exception
	{
		super();
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
			int userId = Integer.parseInt(request.getParameter("UserId"));
			int bookId = Integer.parseInt(request.getParameter("BookId"));
			int orderQty = Integer.parseInt(request.getParameter("OrderQty"));
			
			Transaction order = new Transaction(userId, bookId, orderQty);
		
			TransactionDB dbConn = new TransactionDB();
			
			int i = dbConn.AddTransaction(order);
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
