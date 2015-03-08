package TransMgmt.trans;

import java.sql.*;
import java.sql.Timestamp;
import java.util.*;

import ratingMgmt.rating.rating;
import data.dbConnect.DBConnectionPool;

public class transviewDB {
	final static String db_url ="jdbc:mysql://localhost:3306/bookstore";
	final static String db_username ="root";
	final static String db_passwd ="p0p1c0rn";
	
	DBConnectionPool connPool = null;
	
	public transviewDB()
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
	
	//Sales last week
	public ArrayList<transview> selectWeek( Date date)
	{
		Statement stmt = null;
		ResultSet rs = null;
		Connection conn = null;
		ArrayList<transview> transviewresult = new ArrayList<>();
		try{

			conn = connPool.getConnection();
			
			if(conn != null){
				stmt = conn.createStatement();
				
				String strQuery = "select * from `bookstore`.`trans_view` where `Tran Date` <= " date "and `Tran Date` >= " Date - 7 days;
				rs = stmt.executeQuery(strQuery);
				while(rs.next()){
					transview tv = new transview();
					tv.setOrder(rs.getInt(1));
					tv.setTransDate(rs.getTimestamp(2));
					tv.setUserId(rs.getInt(3));
					tv.setLastName(rs.getString(4));
					tv.setFirstName(rs.getString(5));
					tv.setEmail(rs.getString(6));
					tv.setOrderQty(rs.getInt(7));
					tv.setBookId(rs.getInt(8));
					tv.setTitle(rs.getString(9));
					tv.setAuthor(rs.getString(10));
					tv.setCategory(rs.getString(11));
					tv.setPrice(rs.getFloat(12));
					tv.setInvQty(rs.getInt(13));
					
					
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
		return transviewresult;
	}


	
	//Sales Last Month
	public ArrayList<transview> selectMonth(Date date)
	{
		Statement stmt = null;
		ResultSet rs = null;
		Connection conn = null;
		ArrayList<transview> transviewresult = new ArrayList<>();
		try{

			conn = connPool.getConnection();
			
			if(conn != null){
				stmt = conn.createStatement();
				
				String strQuery = "select * from `bookstore`.`traqns_view` where `Tran Date` <= " date "and `Tran Date` >= " date - 30 days;
						rs = stmt.executeQuery(strQuery);
						while(rs.next()){
							transview tv = new transview();
							tv.setOrder(rs.getInt(1));
							tv.setTransDate(rs.getTimestamp(2));
							tv.setUserId(rs.getInt(3));
							tv.setLastName(rs.getString(4));
							tv.setFirstName(rs.getString(5));
							tv.setEmail(rs.getString(6));
							tv.setOrderQty(rs.getInt(7));
							tv.setBookId(rs.getInt(8));
							tv.setTitle(rs.getString(9));
							tv.setAuthor(rs.getString(10));
							tv.setCategory(rs.getString(11));
							tv.setPrice(rs.getFloat(12));
							tv.setInvQty(rs.getInt(13));
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
		return transviewresult;
	}
}
