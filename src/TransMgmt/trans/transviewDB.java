package TransMgmt.trans;

import java.sql.*;
import java.sql.Timestamp;
import java.util.*;

import TransMgmt.trans.transviewDB;
import data.dbConnect.DBConnectionPool;

public class transviewDB
{	
	DBConnectionPool connPool = null;

/*----------------------------------------------------------------------------*/
	public transviewDB() { connPool = setDBConnection(); }
	
	public DBConnectionPool setDBConnection()
	{
		try { connPool = new DBConnectionPool(); }
		catch (Exception et) { et.printStackTrace(); }
		return connPool;
	}

/*----------------------------------------------------------------------------*/
	//Sales last week
	public ArrayList<transview> selectWeek(int start, int end)
	{
		Statement stmt = null;
		ResultSet rs = null;
		Connection conn = null;
		ArrayList<transview> transviewresult = new ArrayList<>();

		try
		{
			conn = connPool.getConnection();
			
			if (conn != null)
			{
				stmt = conn.createStatement();
				String strQuery = "SELECT `Order`, `Tran Date`, `user_user id`, `book_book id`, Orderqty, Title, Category, Price FROM bookstore.trans_view WHERE `Tran Date` BETWEEN DATE_SUB(NOW(), INTERVAL " + end + " DAY) AND DATE_SUB(NOW(), INTERVAL " + start + " DAY)";
				rs = stmt.executeQuery(strQuery);

				while (rs.next())
				{
					transview tv = new transview();

					tv.setOrder(rs.getInt(1));
					tv.setTransDate(rs.getTimestamp(2));
					tv.setUserId(rs.getInt(3));
					tv.setBookId(rs.getInt(4));
					tv.setOrderQty(rs.getInt(5));
					tv.setTitle(rs.getString(6));
					tv.setCategory(rs.getString(7));
					tv.setPrice(rs.getFloat(8));

					transviewresult.add(tv);
				}
			}
		}
		catch(SQLException e) { for(Throwable t:e) { t.printStackTrace(); }}
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
		return transviewresult;
	}
/*----------------------------------------------------------------------------*/

	
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
