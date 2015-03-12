<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/c06.css"/>
</head>
<title>Sign In - The Best Bookstore</title>
</head>
<body>
		<form action="SignIn" method="post">
			<fieldset>
				
				<legend class="legend_text"> Have an account at TheBestBookstore.com? Sign in Below. </legend>
				
				<div><label>  Email: </label>
					<input type="text" name="email" id="email"/></div>
					
				<div><label>  Password: </label>
					<input type="password" name="password" id="password"></div>
					
				<div id="warning" class="feedback"></div>
				<input type="submit" value="Sign In" id="submit"/>
				Don't have an account? <a href="signUpForm_User.jsp">Sign Up</a>
				
			</fieldset>
		</form>
</body>
</html>