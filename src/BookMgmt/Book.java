package BookMgmt;
import java.io.Serializable;
import java.sql.Blob;

public class Book implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int bookId;
	private String title;
	private String author;
	private Blob bookCoverArt;
	private String bookDescription;
	private String edition;
	private int year;
	private String publisher;
	private String category;
	private String isbn10;
	private String isbn13;
	private float price;
	private int invQty;
	
	public Book(){
	}
	
	public Book(String title, String author, Blob art, String description, String edition, int year, String publisher, 
    String category, String isbn10, String isbn13, float price, int invQty){
		this.title = title;
		this.author = author;
		this.bookCoverArt = art;
		this.bookDescription = description;
		this.edition = edition;
		this.year = year;
		this.publisher = publisher;
		this.category = category;
		this.isbn10 = isbn10;
		this.isbn13 = isbn13;
		this.price = price;
		this.invQty = invQty;
	}
	
	public int getBookId() {
		return this.bookId;
	}
	
	public void setBookId(int BookId) {
		this.bookId = BookId;
	}
	
	public String getTitle() {
		return this.title; 
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getAuthor(){
		return this.author;
	}
	
	public void setAuthor(String Author){
		this.author = Author;
	}
	
	public Blob getBookCoverArt() {
		return this.bookCoverArt;
	}
	
	public void setBookCoverArt(Blob art) {
		this.bookCoverArt = art;
	}
	
	public String getBookDescription() {
		return this.bookDescription;
	}
	
	public void setBookDescription(String description) {
		this.bookDescription = description;
	}
	
	public String getEdition() {
		return this.edition;
	}
	
	public void setEdition(String edition) {
		this.edition = edition;
	}
	
	public int getYear() {
		return this.year;
	}
	
	public void setYear(int year) {
		this.year = year;
	}
	
	public String getPublisher() {
		return this.publisher;
	}
	
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	
	public String getCategory(){
		return this.category;
	}
	
	public void setCategory(String Category){
		this.category = Category;
	}
	
	public String getIsbn10() {
		return this.isbn10;
	}
	
	public void setIsbn10(String isbn10) {
		this.isbn10 = isbn10;
	}
	
	public String getIsbn13() {
		return this.isbn13;
	}
	
	public void setIsbn13(String isbn13) {
		this.isbn13 = isbn13;
	}
	
	public float getPrice() {
		return this.price;
	}
	
	public void setPrice(float price) {
		this.price = price;
	}
	
	public int getInvQty() {
		return this.invQty;
	}
	
	public void setInvQty(int qty) {
		this.invQty = qty;
	}
}

