package UserMgmt.business;

import java.sql.*;
import java.util.*;

import UserMgmt.user.User;
import data.dbConnect.DBConnectionPool;

public class UserDB {
	//select one user
	final static String db_url = "jdbc:mysql://localhost:3306/CSS490D";
	final static String db_username = "test";
	final static String db_passwd = "test12";
	
	DBConnectionPool connPool = null;
	
	public UserDB(){
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
	
	public User selectUser(String username){
		Statement stmt = null;
		ResultSet rs = null;
		User user = new User();
		Connection conn = null;
		try{
			conn = connPool.getConnection();
			
			if(conn != null){
				stmt = conn.createStatement();
				
				String strQuery = "select username, u_name, email, signUpDate, lastLogin from user "+
						" where username = '"+username+"'";
				rs = stmt.executeQuery(strQuery);
				if(rs.next()){
					user.setUsername(rs.getString(1));
					user.setName(rs.getString(2));
					user.setEmail(rs.getString(3));
					user.setSignDate(rs.getString(4));
					user.setLastDate(rs.getString(5));
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
		return user;
	}
	
	//insert a new user
	
	public int registerUser(User user){
		Statement stmt = null;
		ResultSet rs = null;
		int resultNo = 0;
		Connection conn = null;
		try{
			conn = connPool.getConnection();
			
			if(conn != null){
				stmt = conn.createStatement();
				
				String strQuery = "insert user(username, passwd, u_name, email, signUpDate, lastLogin) values('"+
						user.getUsername()+"', '"+user.getPasswd()+"', '"+user.getName()+"', '"+user.getEmail()+
						"', now(), now())";
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
	
	//update one user's information
	
	public int updateUser(User user){
		Statement stmt = null;
		ResultSet rs = null;
		int resultNo = 0;
		Connection conn = null;
		try{

			conn = connPool.getConnection();
			
			if(conn != null){
				stmt = conn.createStatement();
				
				String strQuery = "update user set u_name= '"+user.getName()+"', email = '"+user.getEmail()+
						"' where username = '"+user.getUsername()+"'"; 
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
	
	//delete one user
	
	public int deleteUser(String username){
		Statement stmt = null;
		ResultSet rs = null;
		int resultNo = 0;
		Connection conn = null;
		try{

			conn = connPool.getConnection();
			
			if(conn != null){
				stmt = conn.createStatement();
				
				String strQuery = "delete from user where username = '"+username+"'";
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
	
	//select multiple users 
	
	public ArrayList<User> selectUsers(){
		Statement stmt = null;
		ResultSet rs = null;
		Connection conn = null;
		ArrayList<User> users = new ArrayList<>();
		try{

			conn = connPool.getConnection();
			
			if(conn != null){
				stmt = conn.createStatement();
				
				String strQuery = "select username, u_name, email, signUpDate, lastLogin from user";
				rs = stmt.executeQuery(strQuery);
				while(rs.next()){
					User u = new User();
					u.setUsername(rs.getString(1));
					u.setName(rs.getString(2));
					u.setEmail(rs.getString(3));
					u.setSignDate(rs.getString(4));
					u.setLastDate(rs.getString(5));
					users.add(u);
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
		return users;
	}
}
