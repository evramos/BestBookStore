package TransMgmt.trans;
import java.io.Serializable;
import java.sql.Timestamp;

	public class transview implements Serializable{
		private static final long serialVersionUID = 1L;
		
		private int order;
		private Timestamp transDate;
		private int userId;
		private String lastName;
		private String firstName;
		private String email;
		private int orderQty;
		private int bookId;
		private String title;
		private String author;
		private String category;
		private float price;
		private int invQty;

		public transview(){}//only default constructor needed.
		
		//setters
		public int getOrder(){return order;}
		public void setOrder(int order){ this.order = order;}
		
		public Timestamp getTransDate(){return transDate;}
		public void setTransDate(Timestamp transDate){this.transDate = transDate;}
		
		public int getUserId(){return userId;}
		public void setUserId(int userId){this.userId = userId;}
		
		public String getLastName(){return lastName;}
		public void setLastName(String lastName){this.lastName = lastName;}
		
		public String getFirstName(){return firstName;}
		public void setFirstName(String firstName){this.firstName = firstName;}
		
		public String getEmail(){return email;}
		public void setEmail(String email){ this.email = email;}
		
		public int getOrderQty(){ return orderQty;}
		public void setOrderQty(int orderQty){ this.orderQty = orderQty;}
		
		public int getBookId(){return bookId;}
		public void setBookId(int bookId){ this.bookId = bookId;}
		
		public String getTitle(){return title;}
		public void setTitle(String title){ this.title = title;}
		
		public String getAuthor(){return author;}
		public void setAuthor(String author){ this.author = author;}
		
		public String getCategory(){return category;}
		public void setCategory(String category){ this.author = category;}
		
		public float getPrice(){return price;}
		public void setPrice(float price){this.price = price;}
		
		public int getInvQty(){return invQty;}
		public void setInvQty(int invQty){ this.invQty = invQty;}
	}
	

