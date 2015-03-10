package BookMgmt.Book;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import data.dbConnect.DBConnectionPool;
import BookMgmt.Book.Book;

public class BookDB {
	final static String db_url ="jdbc:mysql://localhost:3306/bookstore";
	final static String db_username ="root";
	 final static String db_passwd ="p0p1c0rn";
	//final static String db_passwd ="Blacktail85$";

	
	DBConnectionPool connPool = null;
/*----------------------------------------------------------------------------*/
	//Default Constructor
	public BookDB(){
		this.connPool = setDBConnection();
	}
	
	public DBConnectionPool setDBConnection(){
		try{
			connPool = new DBConnectionPool(db_url, db_username, db_passwd);
		}catch (Exception et) {
			et.printStackTrace();
		}
		return connPool;
	}
	
/*----------------------------------------------------------------------------*/
	//select one book
	public Book selectBook(int bookId)
	{
		Statement stmt = null;
		ResultSet rs = null;
		Book book = new Book();
		Connection conn = null;

		try
		{
			conn = connPool.getConnection();
			
			if (conn != null)
			{
				stmt = conn.createStatement();
				
				String strQuery = "SELECT `Book ID`, title, author, bookCoverArt, bookDescription, edition, year,"
						+ "publisher, category, isbn_10, isbn_13, price, invQty FROM bookstore.book WHERE `Book ID` = " + bookId;
				rs = stmt.executeQuery(strQuery);
				
				if (rs.next())
				{					
					book.setBookId(rs.getInt(1));
					book.setTitle(rs.getString(2));
					book.setAuthor(rs.getString(3));
					book.setBookCoverArt(rs.getBytes(4));
					book.setBookDescription(rs.getString(5));
					book.setEdition(rs.getString(6));
					book.setYear(rs.getInt(7));
					book.setPublisher(rs.getString(8));
					book.setCategory(rs.getString(9));
					book.setIsbn10(rs.getString(10));
					book.setIsbn13(rs.getString(11));
					book.setPrice(rs.getFloat(12));
					book.setInvQty(rs.getInt(13));
				}
			}
		}
		catch (SQLException e) { for (Throwable t:e) { t.printStackTrace(); }}
		catch (Exception et) { et.printStackTrace(); }
		finally
		{
		    try {
		    	if (rs != null) { rs.close(); }
		    	if (stmt != null) { stmt.close(); }
		        if (conn != null) { connPool.returnConnection(conn); }
		    }
		    catch(Exception e) { System.err.println(e); }
		}
		return book;
	}

/*----------------------------------------------------------------------------*/
	//Insert a new book	
	public int addBook(Book book) throws IOException
	{
		ResultSet rs = null;
		int resultNo = 0;
		Connection conn = null;
		PreparedStatement stmt = null;

		try
		{
			conn = connPool.getConnection();
			
			if(conn != null)
			{
				String strQuery = "INSERT INTO BookStore.book (Title, Author, BookCoverArt, BookDescription, Edition, Year, Publisher, Category, ISBN_10, ISBN_13, Price, InvQty) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

				stmt = conn.prepareStatement(strQuery);

				stmt.setString(1, book.getTitle());
				stmt.setString(2, book.getAuthor());				
				stmt.setBytes(3, book.getBookCoverArt());
				stmt.setString(4, book.getBookDescription());
				stmt.setString(5, book.getEdition());
				stmt.setInt(6, book.getYear());
				stmt.setString(7, book.getPublisher());
				stmt.setString(8, book.getCategory());
				stmt.setString(9, book.getIsbn10());
				stmt.setString(10, book.getIsbn13());
				stmt.setFloat(11, book.getPrice());
				stmt.setInt(12, book.getInvQty());

				resultNo = stmt.executeUpdate();
			}
		}
		catch(SQLException e) { for(Throwable t:e) { t.printStackTrace(); } }
		catch(Exception et) { et.printStackTrace(); }
		finally
		{
		    try
		    {
		    	if (rs != null) { rs.close(); }
		    	if (stmt != null) { stmt.close(); }
		        if (conn != null) { connPool.returnConnection(conn); }
		    }
		    catch(Exception e) { System.err.println(e); }
		}
		return resultNo;
	}

/*----------------------------------------------------------------------------*/
	//update one book's information
	public int updateBook(Book book){
		Statement stmt = null;
		ResultSet rs = null;
		int resultNo = 0;
		Connection conn = null;

		try
		{
			conn = connPool.getConnection();
			
			if (conn != null)
			{
				stmt = conn.createStatement();	
	
				String strQuery = "UPDATE bookstore.book SET Title= \"" + book.getTitle() + "\", Author= \"" + book.getAuthor() + "\", bookCoverArt= \"" + book.getBookCoverArt() +
					"\", BookDescription= \"" + book.getBookDescription() + "\", Edition= \"" + book.getEdition() + "\", Year= \"" + book.getYear() + "\", Publisher= \"" + book.getPublisher() +
					"\", Category= \"" + book.getCategory() + "\", ISBN_10= \"" + book.getIsbn10() + "\", ISBN_13= \"" + book.getIsbn13() + "\", Price= \"" + book.getPrice() + 
					"\", InvQty=" + book.getInvQty() + " WHERE `Book ID` =" + book.getBookId(); 
				resultNo = stmt.executeUpdate(strQuery);
			}
		}
		catch (SQLException e) { for (Throwable t:e) { t.printStackTrace(); }}
		catch (Exception et) { et.printStackTrace(); }
		finally
		{
		    try
		    {
		    	if (rs != null) { rs.close(); }
		    	if (stmt != null) { stmt.close(); }
		        if (conn != null) { connPool.returnConnection(conn); }
		    }
		    catch(Exception e) { System.err.println(e); }
		}
		return resultNo;
	}

/*----------------------------------------------------------------------------*/
	//delete one book	
	public int deleteBook(int bookId)
	{
		Statement stmt = null;
		ResultSet rs = null;
		int resultNo = 0;
		Connection conn = null;
	
		try
		{
			conn = connPool.getConnection();
			
			if (conn != null)
			{
				stmt = conn.createStatement();
				
				String strQuery = "DELETE FROM bookstore.book WHERE `Book ID` = " + bookId;
				resultNo = stmt.executeUpdate(strQuery);
			}
		}
		catch(SQLException e) { for (Throwable t:e) { t.printStackTrace(); }}
		catch (Exception et) { et.printStackTrace(); }
		finally
		{
		    try
		    {
		    	if (rs != null) { rs.close(); }
		    	if (stmt != null) { stmt.close(); }
		        if (conn != null) { connPool.returnConnection(conn); }
		    }
		    catch (Exception e) { System.err.println(e); }
		}
		return resultNo;
	}

/*----------------------------------------------------------------------------*/
	//select all books 	
	public ArrayList<Book> selectBooks()
	{
		Statement stmt = null;
		ResultSet rs = null;
		Connection conn = null;
		ArrayList<Book> books = new ArrayList<>();

		try
		{
			conn = connPool.getConnection();
			
			if (conn != null)
			{
				stmt = conn.createStatement();
				
				String strQuery = "SELECT `Book ID`, title, author, bookCoverArt, bookDescription, edition, year, publisher, category, isbn_10, isbn_13, price, invQty FROM bookstore.book";
				rs = stmt.executeQuery(strQuery);

				while (rs.next())
				{
					Book book = new Book();
					book.setBookId(rs.getInt(1));
					book.setTitle(rs.getString(2));
					book.setAuthor(rs.getString(3));
					book.setBookCoverArt(rs.getBytes(4));
					book.setBookDescription(rs.getString(5));
					book.setEdition(rs.getString(6));
					book.setYear(rs.getInt(7));
					book.setPublisher(rs.getString(8));
					book.setCategory(rs.getString(9));
					book.setIsbn10(rs.getString(10));
					book.setIsbn13(rs.getString(11));
					book.setPrice(rs.getFloat(12));
					book.setInvQty(rs.getInt(13));
					books.add(book);
				}
			}
		}
		catch (SQLException e) { for (Throwable t: e) { t.printStackTrace(); }}
		catch (Exception et) { et.printStackTrace(); }
		finally
		{
		    try
		    {
		    	if (rs != null) { rs.close(); }
		    	if (stmt != null) { stmt.close(); }
		        if (conn != null) { connPool.returnConnection(conn); }
		    }
		    catch (Exception e) { System.err.println(e); }
		}
		return books;
	}

/*----------------------------------------------------------------------------*/
	//select all books 	
	public ArrayList<Book> selectBooksByTerm(String type, String term){
		Statement stmt = null;
		ResultSet rs = null;
		Connection conn = null;
		ArrayList<Book> books = new ArrayList<>();
		
		try{
			conn = connPool.getConnection();
			
			if(conn != null){
				stmt = conn.createStatement();
				
				String strQuery = "select `Book ID`, `title`, `author`, `bookCoverArt`, `bookDescription`, `edition`,"
						+ "`year`, `publisher`, `category`, `isbn_10`, `isbn_13`, `price`, `invQty` from `bookstore`.`book` "
						+ "where '"+type+"' like " + term;
				
				rs = stmt.executeQuery(strQuery);
				
				while(rs.next()){
					Book book = new Book();
					book.setBookId(rs.getInt(1));
					book.setTitle(rs.getString(2));
					book.setAuthor(rs.getString(3));
//					book.setBookCoverArt(rs.getBlob(4));
					book.setBookDescription(rs.getString(5));
					book.setEdition(rs.getString(6));
					book.setYear(rs.getInt(7));
					book.setPublisher(rs.getString(8));
					book.setCategory(rs.getString(9));
					book.setIsbn10(rs.getString(10));
					book.setIsbn13(rs.getString(11));
					book.setPrice(rs.getFloat(12));
					book.setInvQty(rs.getInt(13));
					books.add(book);
				}
			}
		}catch(SQLException e){
			for(Throwable t: e){	
				t.printStackTrace();
			}
		} catch (Exception et) {
			et.printStackTrace();
		}finally {
		    try {
		    	if (rs != null){
		            rs.close();
		        }
		    	if (stmt != null){
		            stmt.close();
		        }
		        if (conn != null) {
		            connPool.returnConnection(conn);
		        }
		    }catch(Exception e){
		    	 System.err.println(e);
		    }
		}
		return books;
	}
}
