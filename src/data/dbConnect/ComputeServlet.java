package data.dbConnect;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ComputeServlet")
public class ComputeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ComputeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));

    	PrintWriter out = response.getWriter();

    	out.println("ComputeServlet.java");
    	out.println(num1 + " + " + num2 + " = " + (num1 + num2));
    	out.println(num1 + " - " + num2 + " = " + (num1 - num2));
    	out.println(num1 + " * " + num2 + " = " + (num1 * num2));
    	out.println(num1 + " / " + num2 + " = " + (num1 / num2));
	}

}
