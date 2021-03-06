<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="UserMgmt.business.SignUp"%> 

<%
	Cookie[] cookies = request.getCookies();
	String firstName = "";
	String isAdmin = "";
	if (cookies != null)
	{
		for (int i = 0; i< cookies.length; i++)
		{
			if (cookies[i].getName().equals("firstName")) { firstName = cookies[i].getValue(); }
			if (cookies[i].getName().equals("isAdmin")) { isAdmin = cookies[i].getValue(); }
		}
	}
%>


<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Create Account - The Best Bookstore</title>
	<link rel="stylesheet" href="css/c06.css" />
	<style type="text/css">
	 	element.style { border-color: rgb(29, 107, 176); }
	 	div { background-color: lightblue; padding: 5px; }
	 </style>
 </head>
	<body>
	
		<div>
		<h1>THE BEST BOOKSTORE</h1>
<%
	if (!firstName.equals(""))
	{
		out.println("Welcome " + firstName);
		if (isAdmin.equals("true")) { out.println("[ADMIN MODE]"); }
		out.println("<br/><a href=\"SignOut\">Logout</a>");
	} 
	else { out.println("Please <a href=\"SignIn.jsp\">SignIn</a> or <a href=\"signUpForm_User.jsp\">Create an account</a>");	}
%>

	</div>
	
	
		<form action="SignUp" method="post">
			<fieldset>
				<legend class="legend_text"> New to BestBooks.com? Register Below. </legend>

				<a href="/SignIn.jsp" class="login icon-lock">Sign In</a>
				
				<div><span class="star"></span><label>  *First Name: </label>
					<input type="text" name="firstName" id="firstName"  required/></div>

				<div><span class="star"></span><label>  *Last Name: </label>
					<input type="text" name="lastName" id="lastName"  required/></div>
					
				<div><span class="star"></span><label>  *Password: </label>
					<input type="password" name="password" id="password"  required/></div>
					
				<div><span class="star"></span><label>  *Confirm Password:  </label>
					<input type="password" name="repasswd" id="repasswd" required/></div>
									
				<div><span class="star"></span><label>  *Email: </label>
					<input type="text" name="email" id="email"/></div>
					
				<div id="warning" class="feedback"></div>
				<input type="submit" value="SignUp" id="submit"/>
				
			</fieldset>
			<div><span class="star"></span><label>* = Required</label></div><br/>
		</form>
		
		<script>
   		var elMsg = document.getElementById('warning');
		 
		function loginCheck()
		{
	        if (document.getElementById('firstName').value == "")
	        {
	                elMsg.textContent= "Please enter a first name";
	                document.getElementById('firstName').focus();
	                return false;
	        }
	        if (document.getElementById('lastName').value == "")
	        {
	                elMsg.textContent= "Please enter a last name";
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