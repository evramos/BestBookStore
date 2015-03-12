package UserMgmt.business;

import java.sql.*;
<<<<<<< HEAD
//import java.sql.Date;
=======
import java.sql.Date;
>>>>>>> davids-brqnch
import java.text.SimpleDateFormat;
import java.util.*;

import UserMgmt.user.User;
import data.dbConnect.DBConnectionPool;

public class UserDB
{	
	DBConnectionPool connPool = null;
	
// -----------------------------------------------------------------------------
	public UserDB() throws Exception
	{
		connPool = setDBConnection();    	
    }
	
// -----------------------------------------------------------------------------
	public DBConnectionPool setDBConnection()
	{
		try { connPool = new DBConnectionPool(); }
		catch (Exception et) { et.printStackTrace(); }
		return connPool;
	}
	
	public User selectUser(int userId){

<<<<<<< HEAD
=======
		Statement stmt = null;
		ResultSet rs = null;
		User user = new User();
		Connection conn = null;

		try
		{
			conn = connPool.getConnection();
			
			if (conn != null)
			{
				stmt = conn.createStatement();
				
				String strQuery = "select `User ID`, `FirstName`, `LastName`, `Email Address` from `user` where `User ID` = " + userId;

				rs = stmt.executeQuery(strQuery);
				
				if (rs.next())
				{
					user.setUserId(rs.getInt(1));
					user.setFirstName(rs.getString(2));
					user.setLastName(rs.getString(3));
					user.setEmail(rs.getString(4));
					user.setSignDate(rs.getTimestamp(5));
					user.setLastDate(rs.getTimestamp(6));
				}
			}
		}

		catch (SQLException e)
		{
			for(Throwable t:e) { t.printStackTrace(); }
		}

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
		return user;
	}
		
/*----------------------------------------------------------------------------*/
	public User selectUserByEmail(String email)
	{
		Statement stmt = null;
		ResultSet rs = null;
		User user = new User();
		Connection conn = null;
		try
		{
			conn = connPool.getConnection();
			
			if (conn != null)
			{
				stmt = conn.createStatement();
				
				String strQuery = "SELECT `User ID`, FirstName, LastName, Password, `Email Address`, SignUpDate FROM `user` where `Email Address` = \"" + email + "\"";
				rs = stmt.executeQuery(strQuery);

				if (rs.next())
				{
					user.setUserId(rs.getInt(1));
					user.setFirstName(rs.getString(2));
					user.setLastName(rs.getString(3));
					user.setPasswd(rs.getString(4));
					user.setEmail(rs.getString(5));
					user.setSignDate(rs.getString(6));
					
//					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSS");
//				    java.util.Date inDate = dateFormat.parse(rs.getString(7));
//				    Timestamp inTimestamp = new java.sql.Timestamp(inDate.getTime());
//					user.setSignDate(inTimestamp);
////					java.util.Date lastDate = dateFormat.parse(rs.getString(6));
////				    Timestamp lastTimestamp = new java.sql.Timestamp(lastDate.getTime());
////					user.setLastDate(lastTimestamp);
				}
			}
		catch (SQLException e)
		{
			for(Throwable t:e) { t.printStackTrace(); }
		}

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
		return user;
	}

	/*----------------------------------------------------------------------------*/
	//Insert a new user into the database
	public int registerUser(User user)
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
				String strQuery = "INSERT INTO `BookStore`.`user` (`LastName`, `FirstName`, `Password`, `Email Address`) VALUES (\"" + user.getLastName() + "\", \"" + user.getFirstName() + "\", \"" + user.getPasswd() + "\", \"" + user.getEmail() + "\")";
				resultNo = stmt.executeUpdate(strQuery);
			}
		}
		catch (SQLException e)
		{
			for (Throwable t:e) { t.printStackTrace(); }
		}
		catch(Exception et) {
			et.printStackTrace();
		}
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
	
/*------------------------------------------------------------------------------------------------*/
	//update one user's information
	public int updateUser(User user)
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
				String strQuery = "update `bookstore`.`user` set `FirstName` = \""+user.getFirstName()+"\", `LastName` = \""+user.getLastName()+"\",`Email Address` = \""+user.getEmail()+"\" where `User ID` = "+user.getUserId(); 
				resultNo = stmt.executeUpdate(strQuery);
			}
		}
		catch (SQLException e)
		{
			for (Throwable t: e) { t.printStackTrace(); }
		}
		catch (Exception et)
		{
			et.printStackTrace();
		}
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
	//delete one user
	
	public int deleteUser(int userId){
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
				String strQuery = "delete from `bookstore`.`user` where `User ID` = "+userId;
				resultNo = stmt.executeUpdate(strQuery);
			}
		}
		catch (SQLException e)
		{	
			for (Throwable t:e) { t.printStackTrace(); }
		}
		catch (Exception et)
		{
			et.printStackTrace();
		}
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
	//select multiple users 
	public ArrayList<User> selectUsers()
	{
		Statement stmt = null;
		ResultSet rs = null;
		Connection conn = null;
		ArrayList<User> users = new ArrayList<>();

		try
		{
			conn = connPool.getConnection();
			
			if (conn != null)
			{
				stmt = conn.createStatement();
				String strQuery = "select `User ID`, `FirstName`, `LastName`, `Email Address` from `user`";
				rs = stmt.executeQuery(strQuery);
				
				while (rs.next())
				{
					User u = new User();
					u.setUserId(rs.getInt(1));
					u.setFirstName(rs.getString(2));
					u.setLastName(rs.getString(3));
					u.setEmail(rs.getString(4));
//					u.setSignDate(rs.getString(5));
//					u.setLastDate(rs.getString(6));
					users.add(u);
				}
			}
		}
		catch (SQLException e)
		{
			for (Throwable t:e){ t.printStackTrace(); }
		} 
		catch (Exception et)
		{
			et.printStackTrace();
		}
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
		return users;
	}
}
