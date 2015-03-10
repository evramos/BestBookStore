<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="BookMgmt.Book.addBook2"%> 

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Add Book - The Best Bookstore</title>
	<link rel="stylesheet" href="css/c06.css" />
 </head>
	<body>
		<form action="addBook" method="post" enctype="multipart/form-data">
			<fieldset>
				<legend class="legend_text"> Add a New Book to the Inventory. </legend>
				
				<div><label>  Title: </label>
					<input type="text" name="title" id="title"/></div>

				<div><label>  Author: </label>
					<input type="text" name="author" id="author"  required/></div>
					
				<div><p>Upload Book Cover: <input type="file" name="bookCoverArt" id="bookCoverArt"/></p></div>

				<div></span><label>  Category: </label>
					<select name="category">
						<option value="">Please Choose a Category</option>
						<option value="Arts & Photography Books">Arts & Photography Books</option>
						<option value="Biographies & Memoirs">Biographies & Memoirs</option>
						<option value="Business & Money">Business & Money</option>
						<option value="Calendars">Calendars</option>
						<option value="Children's Books">Children's Books</option>
						<option value="Christian Books & Bibles">Christian Books & Bibles</option>
						<option value="Comics & Graphic Novels">Comics & Graphic Novels</option>
						<option value="Computers & Technology">Computers & Technology</option>
						<option value="Cookbooks, Food & Wine">Cookbooks, Food & Wine</option>
						<option value="Crafts, Hobbies & Home">Crafts, Hobbies & Home</option>
						<option value="Education & Teaching">Education & Teaching</option>
						<option value="Engineering & Transportation">Engineering & Transportation</option>
						<option value="Gay & Lesbian">Gay & Lesbian</option>
						<option value="Health, Fitness & Dieting">Health, Fitness & Deiting</option>
						<option value="History">History</option>
						<option value="Humor & Entertainment">Humor & Entertainment</option>
						<option value="Law">Law</option>
						<option value="Literature & Fiction">Literature & Fiction</option>
						<option value="Medical Books">Medical Books</option>
						<option value="Mystery, Thriller & Suspense">Mystery, Thriller & Suspense</option>
						<option value="Parenting & Relationships">Parenting & Relationships</option>
						<option value="Politics & Social Sciences">Politics & Social Sciences</option>
						<option value="Reference">Reference</option>
						<option value="Religion & Spirituality">Religion & Spirituality</option>
						<option value="Romance">Romance</option>
						<option value="Science & Math">Science & Math</option>
						<option value="Science Fiction & Fantasy">Science Fiction & Fantasy</option>
						<option value="Self-Help">Self-Help</option>
						<option value="Sports & Outdoors">Sports & Outdoors</option>
						<option value="Teen & Young Adult">Teen & Young Adult</option>
						<option value="Travel">Travel</option>
					</select>						
				</div>
					
				<div><label> Description <br></label><textarea name="bookDescription" id="bookDescription" rows="10" cols="80"></textarea></div>
									
				<div><label>  Edition  </label>
					<input type="text" name="edition" id="edition" /></div>
				<div><label>  Year  </label>
					<input type="text" name="year" id="year" /></div>					
				<div><label>  Publisher  </label>
					<input type="text" name="publisher" id="publisher" /></div>				
				<div><label>  ISBN-10  </label>
					<input type="text" name="isbn10" id="isbn10" /></div>
				<div><label>  ISBN-13  </label>
					<input type="text" name="isbn13" id="isbn13" /></div>
				<div><label>  Price  </label>
					<input type="text" name="price" id="price" /></div>
				<div><label>  Inventory Quantity  </label>
					<input type="text" name="invQty" id="invQty" /></div>										
			</fieldset>
			<br/>
				<input type="hidden" name="BookId" />
				<input type="submit" value="Add Book" id="submit"/>
		</form>
		
	</body>
</html>