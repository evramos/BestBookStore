package UserMgmt.user;
import java.io.Serializable;

public class User implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String UserId;
	private String FirstName;
	private String LastName;
	private String passwd;
	private String email;
	private String signDate;
	private String lastDate;
	
	public User(){
	}
	
	public User( String passwd, String FirstName, String LastName, String email){
		this.passwd = passwd;
		this.email = email;
		this.FirstName = FirstName;
		this.LastName = LastName;
	}
	
	public String getUserId() {

		return UserId;
	}
	
	public void setUserId(String UserId) {
		this.UserId = UserId;
	}
	
	public String getFirstName(){
		return FirstName;
	}
	
	public void setFirstName(String FirstName){
		this.FirstName = FirstName;
	}
	
	public String getLastName(){
		return LastName;
	}
	
	public void setLastName(String LastName){
		this.LastName = LastName;
	}
	
	public String getPasswd(){
		return passwd;
	}
	
	public void setPasswd(String passwd){
		this.passwd = passwd;
	}
	
	
	public String getEmail(){
		return email;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	
	public String getSignDate(){
		return SignUpDate;
	}
	
	public void setSignDate(String signDate){
		this.SignUpDate = SignUpDate;
	}
	
	public String getLastDate(){
		return LastSignIn;
	}
	
	public void setLastDate(String LastSignIn){
		this.LastSignIn = LastSignIn;
	}


}
