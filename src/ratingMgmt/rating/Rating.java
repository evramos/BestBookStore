package ratingMgmt.rating;
import java.io.Serializable;

public class Rating implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private int ratingsId;
	private String date;

	private int stars;
	private String comment;
	private int userId;
	private int bookId;

	//Default Constructors
	public Rating() {}
	
	public Rating(int stars, String comment, int userId, int bookId)
	{
		this.stars = stars;
		this.comment = comment;
		this.userId = userId;
		this.bookId = bookId;
	}

	//Get & Set Ratings ID
	public int getRatingsId() { return ratingsId; }
	public void setRatingsId(int ratingsId) { this.ratingsId = ratingsId; }

	//Get & Set Date
	public String getDate() { return date; }
	public void setDate(String date) { this.date = date; }

	//Get & Set Stars
	public int getStars() { return stars; }
	public void setStars(int stars) { this.stars = stars; }

	//Get & Set Comment
	public String getComments() { return comment; }
	public void setComments(String comment) { this.comment = comment; }

	//Get & Set User ID
	public int getUserId() { return userId; }
	public void setUserId(int userId) { this.userId = userId; }

	//Get & Set Book ID
	public int getBookId() { return bookId; }
	public void setBookId(int bookId) { this.bookId = bookId; }
}
