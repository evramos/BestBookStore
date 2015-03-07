package UserMgmt.user;
import java.io.Serializable;

public class User implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private int userId;
	private String lastName;
	private String firstName;
	private String passwd;
	private String email;

	private String signDate;
	private String lastDate;

/*------------------------------------------------------------------------------------------------*/
	//Default Constructors
	public User() {}

	public User(String lastName, String firstName, String passwd, String email)
	{
		this.lastName = lastName;
		this.firstName = firstName;
		this.passwd = passwd;
		this.email = email;
	}

	// public User( String passwd, String FirstName, String LastName, String email){
	// 	this.passwd = passwd;
	// 	this.email = email;
	// 	this.FirstName = FirstName;
	// 	this.LastName = LastName;
	// }

/*------------------------------------------------------------------------------------------------*/
	//Get & Set User ID
	public int getUserId() { return userId; }
	public void setUserId(int userId) { this.userId = userId; }	
	
	//Get & Set Last Name
	public String getLastName() { return lastName; }
	public void setLastName(String lastName) { this.lastName = lastName; }

	//Get & Set First Name
	public String getFirstName() { return firstName; }
	public void setFirstName(String firstName) { this.firstName = firstName; }

	//Get & Set Password
	public String getPasswd() { return passwd; }
	public void setPasswd(String passwd) { this.passwd = passwd; }
	
	//Get & Set Email
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }
	
	
	//Get & Set Sign-in Date (The date user was created)
	public String getSignDate() { return signDate; }
	public void setSignDate(String signDate) { this.signDate = signDate; }
	
	//Get & Set Last Date (The last time this user was signed in)
	public String getLastDate() { return lastDate; }
	public void setLastDate(String lastDate) { this.lastDate = lastDate; }
}
