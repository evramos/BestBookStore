package ratingMgmt.rating;

import java.sql.*;
import java.util.*;

import UserMgmt.user.User;
import BookMgmt.book;
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
				
				String strQuery = "INSERT INTO `bookstore`.`ratings` (`Date`,`Stars`,`Comments`,`User_User ID`,`Book_Book ID`) VALUES (\""+rating.getDate()+"\",\""+rating.getStars()+"\", \""+rating.getComments()+"\", "+rating.getUserId()+", "+rating.getBookId()+")";
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
		
	}
	public int deleteRating(int RatingId)
	{
		
	}
	public rating selectRating(int RatingId)
	{
		
	}
	public ArrayList<rating> selectRatings()
	{
		
	}
}
