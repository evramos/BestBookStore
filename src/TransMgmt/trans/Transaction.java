package TransMgmt.trans;
import java.io.Serializable;

import java.sql.Timestamp;


public class Transaction implements Serializable 
{
	private static final long serialVersionUID = 1L;
	
	private int userId;
	private int orderId;
	private Timestamp transDate;
	private int bookId;
	private int orderQty;
	
	public Transaction(){}
	public Transaction(int userId, int bookId, int orderQty)
	{
		this.userId = userId;
		this.bookId = bookId;
		this.orderQty = orderQty;
	}
	
	public int getUserId(){return userId;}
	public void setUserId(int userId){this.userId = userId;}
	
	public int getOrderId(){return orderId;}
	public void setOrderId(int orderId){ this.orderId = orderId;}
	
	public Timestamp getTransDate(){return transDate;}
	public void setTransDate(Timestamp transdate){ this.transDate = transDate;}
	
	public int getBookId(){return bookId;}
	public void setBookId(int bookId){ this.bookId = bookId;}
	
	public int getOrderQty(){return orderQty;}
	public void setOrderQty(int orderQty){this.orderQty = orderQty;}
}
