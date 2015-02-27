package UserMgmt.business;

import java.sql.*;
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
		try
		{
			connPool = new DBConnectionPool();
		}
		catch (Exception et) { et.printStackTrace(); }

		return connPool;
	}
	
// -----------------------------------------------------------------------------
	public User selectUser(String email)
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
				
				String strQuery = "SELECT 'User ID', 'FirstName', 'LastName', 'Email Address', 'SignUpDate', 'LastSignIn' FROM User WHERE 'Email Address' = " + email;
				rs = stmt.executeQuery(strQuery);
				
				if (rs.next())
				{
					user.setUserId(rs.getString(1));
					user.setFirstName(rs.getString(2));
					user.setLastName(rs.getString(3));
					user.setEmail(rs.getString(4));
					user.setSignDate(rs.getString(5));
					user.setLastDate(rs.getString(6));
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
	
/*------------------------------------------------------------------------------------------------*/
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
								// INSERT INTO `BookStore`.`User` (`Username`, `LastName`, `FirstName`, `Password`, `Email Address`) VALUES ('a', 'b', 'c', 'e', 'f');
				String strQuery = "INSERT INTO `BookStore`.`user` (`Username`, `LastName`, `FirstName`, `Password`, `Email Address`) VALUES (\"" + user.getUserId() + "\", \"" + user.getLastName() + "\", \"" + user.getFirstName() + "\", \"" + user.getPasswd() + "\", \"" + user.getEmail() + "\")";
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
	
// -----------------------------------------------------------------------------
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
				
				String strQuery = "UPDATE User set = FirstName'" + user.getFirstName() + "', LastName'" + user.getLastName() + "',email = '" + user.getEmail() + "' WHERE User ID = '" + user.getUserId() + "'"; 
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
	
// -----------------------------------------------------------------------------
	//Delete one user
	public int deleteUser(String username)
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
				
				String strQuery = "DELETE FROM User WHERE username = '" + username + "'";
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
	
// -----------------------------------------------------------------------------
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
				
				String strQuery = "SELECT User ID, FirstName, LastName email, signUpDate, lastLogin FROM User";
				rs = stmt.executeQuery(strQuery);
				
				while (rs.next())
				{
					User u = new User();
					u.setUserId(rs.getString(1));
					u.setFirstName(rs.getString(2));
					u.setLastName(rs.getString(3));
					u.setEmail(rs.getString(4));
					u.setSignDate(rs.getString(5));
					u.setLastDate(rs.getString(6));
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
