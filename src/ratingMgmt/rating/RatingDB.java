package ratingMgmt.rating;

import java.sql.*;
import java.util.*;

<<<<<<< HEAD
import UserMgmt.user.User;
import BookMgmt.book;
=======
>>>>>>> davids-brqnch
import ratingMgmt.rating.rating;
import data.dbConnect.DBConnectionPool;

public class RatingDB {
	final static String db_url ="jdbc:mysql://localhost:3306/bookstore";
	final static String db_username ="root";
	final static String db_passwd ="p0p1c0rn";
	
	DBConnectionPool connPool = null;
	
	public RatingDB()
	{
		this.connPool = setDBConnection();
	}
	
	public DBConnectionPool setDBConnection()
	{
		try{
			connPool = new DBConnectionPool(db_url, db_username, db_passwd);
		}catch (Exception et) {
			et.printStackTrace();
		}
		return connPool;
	}
	
	public int addRating(rating Rating)
	{
		Statement stmt = null;
		ResultSet rs = null;
		int resultNo = 0;
		Connection conn = null;
		try{
			conn = connPool.getConnection();
			
			if(conn != null){
				stmt = conn.createStatement();
				
				String strQuery = "INSERT INTO `bookstore`.`ratings` (`Date`,`Stars`,`Comments`,`User_User ID`,`Book_Book ID`) VALUES (\""+Rating.getDate()+"\",\""+Rating.getStars()+"\", \""+Rating.getComments()+"\", "+Rating.getUserId()+", "+Rating.getBookId()+")";
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
	
	public int editRating(rating Rating)
	{
		Statement stmt = null;
		ResultSet rs = null;
		int resultNo = 0;
		Connection conn = null;
		try{

			conn = connPool.getConnection();
			
			if(conn != null){
				stmt = conn.createStatement();
				
				String strQuery = "update `bookstore`.`rating` set `Date` = \""+Rating.getDate()+"\",`Stars` = \""+Rating.getStars()+"\",`Comments` = \""+Rating.getComments()+"\", `User_User ID` = "+Rating.getUserId()+", `Book_Book ID` = "+Rating.getBookId()+" where `RatingId` = "+Rating.getRatingsId(); 
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
	
	public int deleteRating(int RatingId)
	{
		Statement stmt = null;
		ResultSet rs = null;
		int resultNo = 0;
		Connection conn = null;
		try{

			conn = connPool.getConnection();
			
			if(conn != null){
				stmt = conn.createStatement();
				
				String strQuery = "delete from `bookstore`.`rating` where `RatingId` = "+RatingId;
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

	public rating selectRating(int RatingId)
	{
		Statement stmt = null;
		ResultSet rs = null;
		rating Rating = new rating();
		Connection conn = null;
		try{
			conn = connPool.getConnection();
			
			if(conn != null){
				stmt = conn.createStatement();
				
				String strQuery = "select `Book_Book ID`,`Comments`,`Date`,`Ratings ID`,`Stars`,`User_User ID` from `bookstore`.`ratings` where `RatingId` = " + RatingId;
				rs = stmt.executeQuery(strQuery);
				if(rs.next())
				{
					Rating.setBookId(rs.getInt(1));
					Rating.setComments(rs.getString(2));
					Rating.setDate(rs.getString(3));
					Rating.setRatingsId(Integer.parseInt(rs.getString(4)));
					Rating.setStars(Integer.parseInt(rs.getString(5)));
					Rating.setUserId(Integer.parseInt(rs.getString(6)));
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
		return Rating;
	}
	
	public ArrayList<rating> selectRatingsByUser(int UserId)
	{
		Statement stmt = null;
		ResultSet rs = null;
		Connection conn = null;
		ArrayList<rating> ratings = new ArrayList<>();
		try{

			conn = connPool.getConnection();
			
			if(conn != null){
				stmt = conn.createStatement();
				
				String strQuery = "select `Book_Book ID`,`Comments`,`Date`,`Ratings ID`,`Stars`,`User_User ID` from `bookstore`.`ratings` where `User_User ID = "+ UserId;
				rs = stmt.executeQuery(strQuery);
				while(rs.next()){
					rating r = new rating();
					r.setBookId(rs.getInt(1));
					r.setComments(rs.getString(2));
					r.setDate(rs.getString(3));
					r.setRatingsId(Integer.parseInt(rs.getString(4)));
					r.setStars(Integer.parseInt(rs.getString(5)));
					r.setUserId(Integer.parseInt(rs.getString(6)));
					ratings.add(r);
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
		return ratings;
	}
public ArrayList<rating> selectRatingsByBook(int BookId)
	{
		Statement stmt = null;
		ResultSet rs = null;
		Connection conn = null;
		ArrayList<rating> ratings = new ArrayList<>();
		try{

			conn = connPool.getConnection();
			
			if(conn != null){
				stmt = conn.createStatement();
				
				String strQuery = "select `Book_Book ID`,`Comments`,`Date`,`Ratings ID`,`Stars`,`User_User ID` from `bookstore`.`ratings` where `User_User ID = "+ BookId;
				rs = stmt.executeQuery(strQuery);
				while(rs.next()){
					rating r = new rating();
					r.setBookId(rs.getInt(1));
					r.setComments(rs.getString(2));
					r.setDate(rs.getString(3));
					r.setRatingsId(Integer.parseInt(rs.getString(4)));
					r.setStars(Integer.parseInt(rs.getString(5)));
					r.setUserId(Integer.parseInt(rs.getString(6)));
					ratings.add(r);
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
		return ratings;
	}	
}

