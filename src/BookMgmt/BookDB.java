package BookMgmt;

import java.sql.*;
import java.util.*;

import data.dbConnect.DBConnectionPool;

public class BookDB {
	final static String db_url ="jdbc:mysql://localhost:3306/bookstore";
	final static String db_username ="root";
	final static String db_passwd ="nopassword";
	
	DBConnectionPool connPool = null;
	
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
	
	//select one book
	
	public Book selectBook(int bookId){
		Statement stmt = null;
		ResultSet rs = null;
		Book book = new Book();
		Connection conn = null;
		try{
			conn = connPool.getConnection();
			
			if(conn != null){
				stmt = conn.createStatement();
				
				String strQuery = "select `bookId`, `title`, `author`, `bookCoverArt`, `bookDescription`, `edition`, `year`,"
						+ "`publisher`, `category`, `isbn10`, `isbn13`, `price`, `invQty` from `book` where `bookId` = " + bookId;
				rs = stmt.executeQuery(strQuery);
				if(rs.next())
				{					
					book.setBookId(rs.getInt(1));
					book.setTitle(rs.getString(2));
					book.setAuthor(rs.getString(3));
					book.setBookCoverArt(rs.getBlob(4));
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
		}catch(SQLException e){
			for(Throwable t: e){	
				t.printStackTrace();
			}
		}catch (Exception et) {
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
		return book;
	}
	
	//insert a new book
	
	public int registerBook(Book book){
		Statement stmt = null;
		ResultSet rs = null;
		int resultNo = 0;
		Connection conn = null;
		try{
			conn = connPool.getConnection();
			
			if(conn != null){
				stmt = conn.createStatement();
				
				String strQuery = "insert into `bookstore`.`book` (`bookId`, `title`, `author`, `bookCoverArt`, `bookDescription`, `edition`, `year`,"
						+ "`publisher`, `category`, `isbn10`, `isbn13`, `price`, `invQty`) values (\"" + book.getBookId()+"\",\""+book.getTitle()+"\",\""
						+book.getAuthor()+"\",\""+book.getBookCoverArt()+"\",\""+book.getBookDescription()+"\",\""+book.getEdition()+"\",\""+book.getYear()+
						book.getPublisher()+"\",\""+book.getCategory()+"\",\""+book.getIsbn10()+"\",\""+book.getIsbn13()+"\",\""+book.getPrice()+"\",\""+book.getInvQty()+"\")";
				resultNo = stmt.executeUpdate(strQuery);
			}
		}catch(SQLException e){
			for(Throwable t: e){	
				t.printStackTrace();
			}
		}catch(Exception et) {
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
		return resultNo;
	}
	
	//update one book's information
	
	public int updateBook(Book book){
		Statement stmt = null;
		ResultSet rs = null;
		int resultNo = 0;
		Connection conn = null;
		try{

			conn = connPool.getConnection();
			
			if(conn != null){
				stmt = conn.createStatement();		
				String strQuery = "update `bookstore`.`book` set `title` = \""+book.getTitle()+"\", `author` = \""+book.getAuthor()+"\",`bookCoverArt` = \""+book.getBookCoverArt()+
				"\", `description` = \""+book.getBookDescription()+"\",`edition' = \""+book.getEdition()+"\",`year` = \""+book.getYear()+"\", `publisher` = \""+book.getPublisher()+
				"\", `category` = \""+ book.getCategory()+"\", `isbn10` = \""+ book.getIsbn10()+"\", `isbn13` = \""+ book.getIsbn13()+"\", `price` = \""+ book.getPrice()+"\","
				+"`invQty` = \""+ book.getInvQty()+"\", where `bookId` = "+book.getBookId(); 
				resultNo = stmt.executeUpdate(strQuery);
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
		return resultNo;
	}
	
	//delete one book
	
	public int deleteBook(int bookId){
		Statement stmt = null;
		ResultSet rs = null;
		int resultNo = 0;
		Connection conn = null;
		try{
			conn = connPool.getConnection();
			
			if(conn != null){
				stmt = conn.createStatement();
				
				String strQuery = "delete from `bookstore`.`book` where `bookId` = "+bookId;
				resultNo = stmt.executeUpdate(strQuery);
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
		    } catch(Exception e){
		    	 System.err.println(e);
		    }
		}
		return resultNo;
	}
	
	//select all books 
	
	public ArrayList<Book> selectBooks(){
		Statement stmt = null;
		ResultSet rs = null;
		Connection conn = null;
		ArrayList<Book> books = new ArrayList<>();
		try{
			conn = connPool.getConnection();
			
			if(conn != null){
				stmt = conn.createStatement();
				
				String strQuery = "select `bookId`, `title`, `author`, `bookCoverArt`, `bookDescription`, `edition`,"
						+ "`year`, `publisher`, `category`, `isbn10`, `isbn13`, `price`, `invQty` from `book`";
				rs = stmt.executeQuery(strQuery);
				while(rs.next()){
					Book book = new Book();
					book.setBookId(rs.getInt(1));
					book.setTitle(rs.getString(2));
					book.setAuthor(rs.getString(3));
					book.setBookCoverArt(rs.getBlob(4));
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
	
	//select all books 
	
	public ArrayList<Book> selectBooks(String category){
		Statement stmt = null;
		ResultSet rs = null;
		Connection conn = null;
		ArrayList<Book> books = new ArrayList<>();
		try{
			conn = connPool.getConnection();
			
			if(conn != null){
				stmt = conn.createStatement();
				
				String strQuery = "select `bookId`, `title`, `author`, `bookCoverArt`, `bookDescription`, `edition`,"
						+ "`year`, `publisher`, `category`, `isbn10`, `isbn13`, `price`, `invQty` from `book` "
						+ "where 'category' = " + category;
				rs = stmt.executeQuery(strQuery);
				while(rs.next()){
					Book book = new Book();
					book.setBookId(rs.getInt(1));
					book.setTitle(rs.getString(2));
					book.setAuthor(rs.getString(3));
					book.setBookCoverArt(rs.getBlob(4));
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
