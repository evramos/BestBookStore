package TransMgmt.trans;

import java.sql.*;
import java.sql.Timestamp;
import java.util.*;

import TransMgmt.trans.transviewDB;
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
	public ArrayList<transview> selectWeek( Timestamp date)
	{
		Statement stmt = null;
		ResultSet rs = null;
		Connection conn = null;
		Timestamp week = new Timestamp(604800000);
		ArrayList<transview> transviewresult = new ArrayList<>();
		try{

			conn = connPool.getConnection();
			
			if(conn != null){
				stmt = conn.createStatement();
				
				String strQuery = "select `order`, `Tran Date`, `user_user id`, `book_book id`, `orderqty`, `title`, `category`, `price` from `bookstore`.`trans_view` where (`Tran Date` BETWEEN "+date.getTime()+" and "+(date.getTime() -  week.getTime())+")) order by `Order`";
				rs = stmt.executeQuery(strQuery);
				while(rs.next()){
					transview tv = new transview();
					tv.setOrder(rs.getInt(1));
					tv.setTransDate(rs.getTimestamp(2));
					tv.setUserId(rs.getInt(3));
					tv.setBookId(rs.getInt(4));
					tv.setOrderQty(rs.getInt(5));
					tv.setTitle(rs.getString(6));
					tv.setCategory(rs.getString(7));
					tv.setPrice(rs.getFloat(8));

					
					
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
	public ArrayList<transview> selectMonth(Timestamp date)
	{
		Statement stmt = null;
		ResultSet rs = null;
		Connection conn = null;
		Timestamp month = new Timestamp(604800000 * 4);
		ArrayList<transview> transviewresult = new ArrayList<>();
		try{

			conn = connPool.getConnection();
			
			if(conn != null){
				stmt = conn.createStatement();
				
				String strQuery = "select `order`, `Tran Date`, `user_user id`, `book_book id`, `orderqty`, `title`, `category`, `price` from `bookstore`.`traqns_view` where (`Tran Date` <= " +date+ " and `Tran Date` >= "+(date.getTime() - month.getTime())+") sortby \"";
						rs = stmt.executeQuery(strQuery);
						while(rs.next()){
							transview tv = new transview();
							tv.setOrder(rs.getInt(1));
							tv.setTransDate(rs.getTimestamp(2));
							tv.setUserId(rs.getInt(3));
							tv.setBookId(rs.getInt(4));
							tv.setOrderQty(rs.getInt(5));
							tv.setTitle(rs.getString(6));
							tv.setCategory(rs.getString(7));
							tv.setPrice(rs.getFloat(8));
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
