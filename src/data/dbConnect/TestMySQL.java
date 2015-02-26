package data.dbConnect;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MySQL
 */

@WebServlet("/TestMySQL")

public class TestMySQL extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public TestMySQL() throws Exception
    {
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

		try
		{
			PrintWriter out = response.getWriter();
        	
        	DBConnectionPool connPool = new DBConnectionPool();

        	Connection conn = connPool.getConnection();
        	
        	if (conn != null) {
        		out.println("Success");
        	} else {
        		out.println("Failed");
        	}
        	
        }
        catch (Exception e)
        {
        	e.printStackTrace();	
        }
	}
}
