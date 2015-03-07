<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<%@ page import="java.sql.*" %>
<%@ page import="data.dbConnect.DBConnectionPool" %>
<%@ page import="BookMgmt.Book.*" %>
<%	
	String bookId = request.getParameter("BookId");
	BookDB bookDB = new BookDB();
	Book book = bookDB.selectBook(Integer.parseInt(bookId));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head><title>Book Table</title>
		<link rel="stylesheet" href="css/c06.css" />
	</head>
	<body>
		<form action="BookUpdate" method="post">
			<fieldset>
				<legend class="legend_text"> Update a Book in the Inventory. </legend>

				
				
				<div><span class="star">*</span><label>  Title: </label>
					<input type="text" name="title" id="title"  value=<%=book.getTitle() %>  /></div>

				<div><span class="star">*</span><label>  Author: </label>
					<input type="text" name="author" id="author"  value=<%=book.getAuthor() %> /></div>
					
				<div><span class="star">*</span><label>  Category: </label>
					<select name="category" >
						<option value="">Please Choose a Category</option>
						<option <% if(book.getCategory() == "Arts & Photography Books"){echo("selected");} %> value="Arts & Photography Books">Arts & Photography Books</option>
						<option <% if(book.getCategory() == "Biographies & Memoirs"){echo("selected");} %>value="Biographies & Memoirs">Biographies & Memoirs</option>
						<option <% if(book.getCategory() == "Business & Money"){echo("selected");} %>value="Business & Money">Business & Money</option>
						<option <% if(book.getCategory() == "Calendars"){echo("selected");} %>value="Calendars">Calendars</option>
						<option <% if(book.getCategory() == "Children's Books"){echo("selected");} %>value="Children's Books">Children's Books</option>
						<option <% if(book.getCategory() == "Christian Books & Bibles"){echo("selected");} %>value="Christian Books & Bibles">Christian Books & Bibles</option>
						<option <% if(book.getCategory() == "Comics & Graphic Novels"){echo("selected");} %>value="Comics & Graphic Novels">Comics & Graphic Novels</option>
						<option <% if(book.getCategory() == "Computers & Technology"){echo("selected");} %>value="Computers & Technology">Computers & Technology</option>
						<option <% if(book.getCategory() == "Cookbooks, Food & Wine"){echo("selected");} %>value="Cookbooks, Food & Wine">Cookbooks, Food & Wine</option>
						<option <% if(book.getCategory() == "Crafts, Hobbies & Home"){echo("selected");} %>value="Crafts, Hobbies & Home">Crafts, Hobbies & Home</option>
						<option <% if(book.getCategory() == "Education & Teaching"){echo("selected");} %>value="Education & Teaching">Education & Teaching</option>
						<option <% if(book.getCategory() == "Engineering & Transportation"){echo("selected");} %>value="Engineering & Transportation">Engineering & Transportation</option>
						<option <% if(book.getCategory() == "Gay & Lesbian"){echo("selected");} %>value="Gay & Lesbian">Gay & Lesbian</option>
						<option <% if(book.getCategory() == "Health, Fitness & Dieting"){echo("selected");} %>value="Health, Fitness & Dieting">Health, Fitness & Deiting</option>
						<option <% if(book.getCategory() == "History"){echo("selected");} %>value="History">History</option>
						<option <% if(book.getCategory() == "Humor & Entertainment"){echo("selected");} %>value="Humor & Entertainment">Humor & Entertainment</option>
						<option <% if(book.getCategory() == "Law"){echo("selected");} %>value="Law">Law</option>
						<option <% if(book.getCategory() == "Literature & Fiction"){echo("selected");} %>value="Literature & Fiction">Literature & Fiction</option>
						<option <% if(book.getCategory() == "Medical Books"){echo("selected");} %>value="Medical Books">Medical Books</option>
						<option <% if(book.getCategory() == "Mystery, Thriller & Suspense"){echo("selected");} %>value="Mystery, Thriller & Suspense">Mystery, Thriller & Suspense</option>
						<option <% if(book.getCategory() == "Parenting & Relationships"){echo("selected");} %>value="Parenting & Relationships">Parenting & Relationships</option>
						<option <% if(book.getCategory() == "Politics & Social Sciences"){echo("selected");} %>value="Politics & Social Sciences">Politics & Social Sciences</option>
						<option <% if(book.getCategory() == "Reference"){echo("selected");} %>value="Reference">Reference</option>
						<option <% if(book.getCategory() == "Religion & Spirituality"){echo("selected");} %>value="Religion & Spirituality">Religion & Spirituality</option>
						<option <% if(book.getCategory() == "Romance"){echo("selected");} %>value="Romance">Romance</option>
						<option <% if(book.getCategory() == "Science & Math"){echo("selected");} %>value="Science & Math">Science & Math</option>
						<option <% if(book.getCategory() == "Science Fiction & Fantasy"){echo("selected");} %>value="Science Fiction & Fantasy">Science Fiction & Fantasy</option>
						<option <% if(book.getCategory() == "Self-Help"){echo("selected");} %>value="Self-Help">Self-Help</option>
						<option <% if(book.getCategory() == "Sports & Outdoors"){echo("selected");} %>value="Sports & Outdoors">Sports & Outdoors</option>
						<option <% if(book.getCategory() == "Teen & Young Adult"){echo("selected");} %>value="Teen & Young Adult">Teen & Young Adult</option>
						<option <% if(book.getCategory() == "Travel"){echo("selected");} %>value="Travel">Travel</option>
					</select>						
				</div>
					
				<div><label> Description <br></label><textarea name="BookDiscription" rows="10" cols="80" value=<%=book.getBookDescription() %>></textarea></div>
									
				<div><span class="star"></span><label>  Edition  </label>
					<input type="text" name="edition" id="edition" value=<%=book.getEdition() %> /></div>
				<div><span class="star">*</span><label>  Year  </label>
					<input type="text" name="year" id="year" value=<%=book.getYear() %> /></div>					
				<div><span class="star">*</span><label>  Publisher  </label>
					<input type="text" name="publisher" id="publisher" value=<%=book.getPublisher() %>/></div>				
				<div><span class="star"></span><label>  ISBN-10  </label>
					<input type="text" name="isbn-10" id="isbn-10" value=<%=book.getIsbn10() %> /></div>
				<div><span class="star"></span><label>  ISBN-13  </label>
					<input type="text" name="isbn-13" id="isbn-13" value=<%=book.getIsbn13() %> /></div>
				<div><span class="star">*</span><label>  Price  </label>
					<input type="text" name="price" id="price" value=<%=book.getPrice() %> /></div>
				<div><span class="star">*</span><label>  Inventory Quantity  </label>
					<input type="text" name="invQty" id="invQty" value=<%=book.getInvQty() %> /></div>										
			</fieldset>
			<div><span class="star">*</span><label>Mandatory Information</label></div><br/>
				<input type="hidden" name="BookId" value=<%=book.getBookId() %> />
				<input type="submit" value="Update Book" id="submit" />
		</form>
	</body>
</html>
