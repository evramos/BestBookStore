package TransMgmt.trans;
import java.sql.*;


import TransMgmt.trans.Transaction;
import data.dbConnect.DBConnectionPool;

public class TransactionDB {
	final static String db_url ="jdbc:mysql://localhost:3306/bookstore";
	final static String db_username ="root";
	final static String db_passwd ="p0p1c0rn";
	
	DBConnectionPool connPool = null;
	
	public TransactionDB()
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
	
	public int AddTransaction(Transaction order)
	{
		Statement stmt = null;
		ResultSet rs = null;
		int resultNo = 0;
		Connection conn = null;
		try{
			conn = connPool.getConnection();
			
			if(conn != null){
				stmt = conn.createStatement();
				
				String strQuery = "INSERT INTO `bookstore`.`transaction` (`User_User ID`, `Book_Book ID`, `OrderQty`) VALUES (\""+order.getUserId()+"\", \""+order.getBookId()+"\", \""+order.getOrderQty()+"\")";
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
	
}
