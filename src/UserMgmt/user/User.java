package UserMgmt.user;
import java.io.Serializable;

public class User implements Serializable{
	private static final long serialVersionUID = 1L;
	
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
	
	public String getUsername(){
		return username;
	}
	
	public void setUsername(String username){
		this.username = username;
	}
	
	public String getPasswd(){
		return passwd;
	}
	
	public void setPasswd(String passwd){
		this.passwd = passwd;
	}
	
	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}
	
	public String getEmail(){
		return email;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	
	public String getSignDate(){
		return signDate;
	}
	
	public void setSignDate(String signDate){
		this.signDate = signDate;
	}
	
	public String getLastDate(){
		return lastDate;
	}
	
	public void setLastDate(String lastDate){
		this.lastDate = lastDate;
	}
}
