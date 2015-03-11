package BookMgmt.Book;
import java.io.Serializable;
import java.sql.Blob;

public class Book implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private int bookId;
	private String title;
	private String author;
<<<<<<< HEAD
	private Blob bookCoverArt;
=======
	private String category;
	private String bookCoverPath;
>>>>>>> 8e7f5e2bae03de189905b0bb14dc6e7506771495
	private String bookDescription;
	private String edition;
	private int year;
	private String publisher;
	private String category;
	private String isbn10;
	private String isbn13;
	private float price;
	private int invQty;
	
/*----------------------------------------------------------------------------*/
	//Blank Constructor
	public Book(){}
	

	//Default Constructor
<<<<<<< HEAD
	public Book(String title, String author, int year, String publisher,
		String category, String isbn10, String isbn13, float price, int invQty)
	{
		this.title = title;
		this.author = author;
		this.year = year;
		this.publisher = publisher;
=======
	public Book(String title, String author, String bookCoverPath, String category, String description,
		String edition, int year, String publisher, String isbn10, String isbn13, float price, int invQty)
	{
		this.title = title;
		this.author = author;
		this.bookCoverPath = bookCoverPath;
>>>>>>> 8e7f5e2bae03de189905b0bb14dc6e7506771495
		this.category = category;
		this.isbn10 = isbn10;
		this.isbn13 = isbn13;
		this.price = price;
		this.invQty = invQty;
	}

	//Book Everything Constructor
	public Book(String title, String author, Blob art, String description, String edition, int year,
		String publisher, String category, String isbn10, String isbn13, float price, int invQty)
    {
		this.title = title;
		this.author = author;
		bookCoverArt = art;
		bookDescription = description;
		this.edition = edition;
		this.year = year;
		this.publisher = publisher;
		this.category = category;
		this.isbn10 = isbn10;
		this.isbn13 = isbn13;
		this.price = price;
		this.invQty = invQty;
	}
	
/*----------------------------------------------------------------------------*/
	public int getBookId() { return bookId; }
	public void setBookId(int bookId) { this.bookId = bookId; }
	
	public String getTitle() { return title; }
	public void setTitle(String title) { this.title = title; }
	
	public String getAuthor() { return author; }
	public void setAuthor(String author) { this.author = author; }
<<<<<<< HEAD
	
	public Blob getBookCoverArt() { return bookCoverArt; }
	public void setBookCoverArt(Blob art) { bookCoverArt = art; }
=======

	public String getCategory() { return category; }
	public void setCategory(String category) { this.category = category; }

	public String getBookCoverPath() { return bookCoverPath; }
	public void setBookCoverPath(String path) { bookCoverPath = path; }
>>>>>>> 8e7f5e2bae03de189905b0bb14dc6e7506771495
	
	public String getBookDescription() { return bookDescription; }
	public void setBookDescription(String description) { bookDescription = description; }
	
	public String getEdition() { return edition; }
	public void setEdition(String edition) { this.edition = edition; }
	
	public int getYear() { return year; }
	public void setYear(int year) { this.year = year; }
	
	public String getPublisher() { return publisher; }
	public void setPublisher(String publisher) { this.publisher = publisher; }
	
	public String getCategory() { return category; }
	public void setCategory(String category) { this.category = category; }
	
	public String getIsbn10() { return isbn10; }
	public void setIsbn10(String isbn10) { this.isbn10 = isbn10; }
	
	public String getIsbn13() { return isbn13; }
	public void setIsbn13(String isbn13) { this.isbn13 = isbn13;}
	
	public float getPrice() { return price; }
	public void setPrice(float price) { this.price = price; }
	
	public int getInvQty() { return invQty; }
	public void setInvQty(int qty) { this.invQty = qty; }
}

