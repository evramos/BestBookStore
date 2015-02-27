<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="UserMgmt.business.SignUp"%> 

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Create New Account</title>
	<link rel="stylesheet" href="css/c06.css" />
 </head>
	<body>
		<form action="SignUp" method="post">
			<fieldset>
				<legend class="legend_text"> New to BestBooks.com? Register Below. </legend>

				<a href="https://www.google.com" class="login icon-lock">Sign In</a>
				
				<div><span class="star">*</span><label>  First Name: </label>
					<input type="text" name="firstName" id="firstName"  required="required"/></div>

				<div><span class="star">*</span><label>  Last Name: </label>
					<input type="text" name="lastName" id="lastName"  required="required"/></div>
					
				<div><span class="star">*</span><label>  Password: </label>
					<input type="password" name="password" id="password"  required="required"/></div>
					
				<div><span class="star">*</span><label>  Confirm Password:  </label>
					<input type="password" name="repasswd" id="repasswd" required="required"/></div>
									
				<div><span class="star">*</span><label>  Email: </label>
					<input type="text" name="email" id="email"/></div>
					
				<div id="warning" class="feedback"></div>
				<input type="submit" value="Sign Up" id="submit"/>
				
			</fieldset>
			<div><span class="star">*</span><label>Mandatory Information</label></div><br/>
		</form>
		
		<script>
   		var elMsg = document.getElementById('warning');
		 
		function loginCheck()
		{
	        if (document.getElementById('firstName').value == "")
	        {
	                elMsg.textContent= "Pleaes enter a first name";
	                document.getElementById('firstName').focus();
	                return false;
	        }
	        if (document.getElementById('lastName').value == "")
	        {
	                elMsg.textContent= "Pleaes enter a last name";
	                document.getElementById('lastName').focus();
	                return false;
	        }
	        if (document.getElementById('password').value == "")
	        {
	              	elMsg.textContent = "Please enter a password";
	                document.getElementById('password').focus();
	                return false;
	        }
	        if (document.getElementById('repasswd').value == "")
	        {
	        	elMsg.textContent = "Please confirm your password";
                document.getElementById('repasswd').focus();
                return false;
	        }

	        if (document.getElementById('password').value != document.getElementById('repasswd').value)
			{
                elMsg.textContent = "The new password and confirmation password do not match.";
                document.getElementById('password').focus();
                return false;
        	}

	        if (document.getElementById('email').value == "")
	        {
	        	elMsg.textContent = "Please enter your email";
                document.getElementById('email').focus();
                return false;
	        }
		}
		
		var elSubmit = document.getElementById('submit');
		elSubmit.onclick =loginCheck;
	</script>
	</body>
</html>