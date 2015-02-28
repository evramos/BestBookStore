package ratingMgmt.rating;
import java.io.Serializable;

public class rating implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int ratingsId;
	private String date;
	private int stars;
	private String comments;
	private int userId;
	private int bookId;

	public rating(){}
	public rating(String date, int stars, String comments, int userId, int bookId)
	{
		this.date = date;
		this.stars = stars;
		this.comments = comments;
		this.userId = userId;
		this.bookId = bookId;
	}
	public int getRatingsId()
	{
		return ratingsId;
	}
	public void setRatingsId(int ratingsId)
	{
		this.ratingsId = ratingsId;
	}
	public String getDate()
	{
		return date;
	}
	public void setDate(String date)
	{
		this.date = date;
	}
	public int getStars()
	{
		return stars;
	}
	public void setStars(int stars)
	{
		this.stars = stars;
	}
	public String getComments()
	{
		return comments;
	}
	public void setComments(String comments)
	{
		this.comments = comments;
	}
	public int getUserId()
	{
		return userId;
	}
	public void setUserId(int userId)
	{
		this.userId = userId;
	}
	public int getbookId()
	{
		return bookId;
	}
	public void setBookId(int bookId)
	{
		this.bookId = bookId;
	}
}
