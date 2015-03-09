package TransMgmt.trans;
import java.io.Serializable;
import java.sql.Timestamp;

	public class transview implements Serializable{
		private static final long serialVersionUID = 1L;
		
		private int order;
		private Timestamp transDate;
		private int userId;
		private int orderQty;
		private int bookId;
		private String title;
		private String category;
		private float price;

		public transview(){}//only default constructor needed.
		
		//setters and getters
		public int getOrder(){return order;}
		public void setOrder(int order){ this.order = order;}
		
		public Timestamp getTransDate(){return transDate;}
		public void setTransDate(Timestamp transDate){this.transDate = transDate;}
		
		public int getUserId(){return userId;}
		public void setUserId(int userId){this.userId = userId;}
		
		public int getOrderQty(){ return orderQty;}
		public void setOrderQty(int orderQty){ this.orderQty = orderQty;}
		
		public int getBookId(){return bookId;}
		public void setBookId(int bookId){ this.bookId = bookId;}
		
		public String getTitle(){return title;}
		public void setTitle(String title){ this.title = title;}
		
		public String getCategory(){return category;}
		public void setCategory(String category){ this.category = category;}
		
		public float getPrice(){return price;}
		public void setPrice(float price){this.price = price;}
	}
	

