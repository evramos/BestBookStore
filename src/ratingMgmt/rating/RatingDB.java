package ratingMgmt.rating;

//import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import ratingMgmt.rating.Rating;
import data.dbConnect.DBConnectionPool;

public class RatingDB
{	
	DBConnectionPool connPool = null;
	Connection conn = null;

/*------------------------------------------------------------------------------------------------*/
	public RatingDB()
	{ 
		connPool = setDBConnection();
	}
	
	public DBConnectionPool setDBConnection()
	{
		try { connPool = new DBConnectionPool(); }
		catch (Exception et) { et.printStackTrace();}
		return connPool;
	}
	//SELECT Stars FROM Ratings WHERE `Book_Book ID` = 1; Update book rating

/*------------------------------------------------------------------------------------------------*/
	public int addRating(Rating r)
	{
		System.out.println("Add Rating");

		PreparedStatement stmt = null;
		ResultSet rs = null;
		int resultNo = 0;
		
		try
		{
			conn = connPool.getConnection();
			
			if (conn != null)
			{	
				String strQuery = "INSERT INTO bookstore.ratings (Stars, Comments,`User_User ID`,`Book_Book ID`) VALUES (?,?,?,?)";
				
				stmt = conn.prepareStatement(strQuery);

				stmt.setInt(1, r.getStars());
				stmt.setString(2, r.getComments());
				stmt.setInt(3, r.getUserId());
				stmt.setInt(4, r.getBookId());

				resultNo = stmt.executeUpdate();	
			}	
		}
		catch(SQLException e) { for (Throwable t:e) { t.printStackTrace(); }}
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

/*------------------------------------------------------------------------------------------------*/
	public int editRating(Rating r)
	{	
		System.out.println("Edit Rating");
		Statement stmt = null;
		ResultSet rs = null;
		int resultNo = 0;

		try
		{
			conn = connPool.getConnection();
			
			if(conn != null)
			{
				stmt = conn.createStatement();
				
				String strQuery = "update `bookstore`.`ratings` set `Date` = \""+r.getDate()+"\",`Stars` = \""+r.getStars()+"\",`Comments` = \""+r.getComments()+"\", `User_User ID` = "+r.getUserId()+", `Book_Book ID` = "+r.getBookId()+" where `Ratings Id` = "+r.getRatingsId(); 
				
				resultNo = stmt.executeUpdate(strQuery);
			}
		}
		catch(SQLException e) { for (Throwable t:e) { t.printStackTrace(); }}
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
/*------------------------------------------------------------------------------------------------*/
	//Delete a Rating by it's ID Number
	public int deleteRating(int ratingID)
	{
		Statement stmt = null;
		int resultNo = 0;

		try
		{
			conn = connPool.getConnection();
			
			if (conn != null)
			{
				stmt = conn.createStatement();
				
				String strQuery = "DELETE FROM bookstore.ratings WHERE `Ratings Id` = " + ratingID;
				
				resultNo = stmt.executeUpdate(strQuery);
			}
		}
		catch(SQLException e) { for (Throwable t:e) { t.printStackTrace(); }}
		catch(Exception et) { et.printStackTrace(); }
		finally
		{
		    try
		    {
		    	if (stmt != null) { stmt.close(); }
		        if (conn != null) { connPool.returnConnection(conn); }
		    }
		    catch(Exception e) { System.err.println(e); }
		}
		return resultNo;
	}

/*------------------------------------------------------------------------------------------------*/
	public Rating selectRating(int RatingId)
	{
		System.out.println("Select a rating by ID");
		Statement stmt = null;
		ResultSet rs = null;
		Rating r = new Rating();

		try
		{
			conn = connPool.getConnection();
			
			if (conn != null)
			{
				stmt = conn.createStatement();
				
				String strQuery = "select `Book_Book ID`,`Comments`,`Date`,`Ratings ID`,`Stars`,`User_User ID` from `bookstore`.`ratings` where `Ratings Id` = " + RatingId;
				
				rs = stmt.executeQuery(strQuery);
				
				if (rs.next())
				{
					r.setBookId(rs.getInt(1));
					r.setComments(rs.getString(2));
					r.setDate(rs.getString(3));
					r.setRatingsId(Integer.parseInt(rs.getString(4)));
					r.setStars(Integer.parseInt(rs.getString(5)));
					r.setUserId(Integer.parseInt(rs.getString(6)));
				}
			}
		}
		catch(SQLException e) { for (Throwable t:e) { t.printStackTrace(); }}
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
		return r;
	}
	
/*------------------------------------------------------------------------------------------------*/
	//Select all ratings by user
	public ArrayList<Rating> selectRatingsByUser(int UserId)
	{
		System.out.println("Select all ratings by UserID");
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Rating> ratings = new ArrayList<>();
		
		try
		{
			conn = connPool.getConnection();
			
			if (conn != null)
			{
				stmt = conn.createStatement();
				
				String strQuery = "SELECT `Book_Book ID`, Comments, Date, `Ratings ID`, Stars,`User_User ID` FROM bookstore.ratings WHERE `User_User ID` = " + UserId;

				rs = stmt.executeQuery(strQuery);
				while(rs.next())
				{
					Rating r = new Rating();
					
					r.setBookId(rs.getInt(1));
					r.setComments(rs.getString(2));
					r.setDate(rs.getString(3));
					r.setRatingsId(Integer.parseInt(rs.getString(4)));
					r.setStars(Integer.parseInt(rs.getString(5)));
					r.setUserId(Integer.parseInt(rs.getString(6)));
					
					ratings.add(r);
				}
			}
		}
		catch(SQLException e) { for (Throwable t:e) { t.printStackTrace(); }}
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
		return ratings;
	}

/*------------------------------------------------------------------------------------------------*/
	//Select all ratings by book
	public ArrayList<Rating> selectRatingsByBook(int BookId)
	{
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Rating> ratings = new ArrayList<>();
		
		try
		{
			conn = connPool.getConnection();
			
			if (conn != null)
			{
				stmt = conn.createStatement();
				String strQuery = "SELECT `Book_Book ID`, Comments, Date, `Ratings ID`, Stars,`User_User ID` FROM bookstore.ratings WHERE `Book_Book ID` = " + BookId;
			
				rs = stmt.executeQuery(strQuery);
				
				double totalStarsOfBook = 0.0;
				
				while (rs.next())
				{
					Rating r = new Rating();
					
					r.setBookId(rs.getInt(1));
					r.setComments(rs.getString(2));
					r.setDate(rs.getString(3));
					r.setRatingsId(Integer.parseInt(rs.getString(4)));
					
					int stars = Integer.parseInt(rs.getString(5));
					r.setStars(stars);
					totalStarsOfBook += stars;
					
					r.setUserId(Integer.parseInt(rs.getString(6)));
					
					ratings.add(r);
				}
				
				if (totalStarsOfBook != 0.0)
				{
					strQuery = "UPDATE BookStore.book SET bookRating=" + String.format("%.2f", totalStarsOfBook / ratings.size()) + " WHERE `Book ID`=" + BookId;
					stmt.executeUpdate(strQuery);	
				}
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
		return ratings;
	}	

/*------------------------------------------------------------------------------------------------*/
	//Does this user have a rating with this book
	public boolean isRated(int UserId, int BookId) throws Exception
	{	
		boolean result = false;
		//Opens up a connection with the database
		conn = connPool.getConnection();
		if (conn != null)
		{
			//SQL Query
			String strQuery = "SELECT `Ratings ID` FROM Ratings WHERE `User_User ID`=" + UserId + " AND `Book_Book ID`=" + BookId;
			//Checking to see if entries exist base on the user and current book they may be looking at. 
			result = conn.createStatement().executeQuery(strQuery).next();			
			connPool.returnConnection(conn);
		}
		return result;	
	}
	
}