package BookMgmt.Book;
import java.io.*;
import java.util.Iterator;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import BookMgmt.Book.Book;
import BookMgmt.Book.BookDB;


@WebServlet("/addBook")
public class addBook extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public addBook() throws Exception { super(); }
	
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


		// Check that we have a file upload request
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if (isMultipart == true)
		{
			// Configure a repository parameter or a path to upload the image
			ServletContext context = request.getServletContext();
			String fileUploadPath = context.getInitParameter("file-upload");

			// Create a factory for disk-based file items
			DiskFileItemFactory factory = new DiskFileItemFactory();

			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);

			try
			{ 
				// Parse the request to get file items.
				List<FileItem> items = upload.parseRequest((RequestContext) request);

				// Process the uploaded file items
				Iterator<FileItem> iter = items.iterator();

				FileItem fi;

				//Request Title
				fi = iter.next();
				String title = fi.getString();

				fi = iter.next();
				String author = fi.getString();

				fi = iter.next();
				String bookCoverArt = fi.getName();

				// Write the file
				File file = new File(fileUploadPath + File.separator + bookCoverArt);		
            	fi.write(file);
				
				fi = iter.next();
				String category = fi.getString();

				fi = iter.next();
				String description = fi.getString();
				
				fi = iter.next();
				String edition = fi.getString();
				
				fi = iter.next();
				int year = Integer.parseInt(fi.getString());
				
				fi = iter.next();
				String publisher = fi.getString();
				
				fi = iter.next();
				String isbn10 = fi.getString();
				
				fi = iter.next();
				String isbn13 = fi.getString();
				
				fi = iter.next();
				Float price = Float.parseFloat(fi.getString());
				
				fi = iter.next();
				int invQty = Integer.parseInt(fi.getString());

				Book book = new Book(title, author, bookCoverArt, category, description, edition, year, publisher, isbn10, isbn13, price, invQty);

				out.println("<p>Title: " + book.getTitle() + "</p>");
				out.println("<p>Author: " + author + "</p>");

            	if (!bookCoverArt.equals(""))
            	{
            		out.println("<img style='display:block; width:200px; height:300px;' src='BookCoverArt/" + bookCoverArt + "'/>");
            	}

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
			catch (FileUploadException e) { e.printStackTrace(); }
			catch (Exception e) { e.printStackTrace(); }		
		}
		else
		{
			response.sendRedirect("./addBook.jsp");
		}
	}
}
