<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<%@ page import="java.sql.*,java.util.*" %>
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
						<option <% if(book.getCategory() == "Arts & Photography Books"){out.println("selected");} %> value="Arts & Photography Books">Arts & Photography Books</option>
						<option <% if(book.getCategory() == "Biographies & Memoirs"){out.println("selected");} %>value="Biographies & Memoirs">Biographies & Memoirs</option>
						<option <% if(book.getCategory() == "Business & Money"){out.println("selected");} %>value="Business & Money">Business & Money</option>
						<option <% if(book.getCategory() == "Calendars"){out.println("selected");} %>value="Calendars">Calendars</option>
						<option <% if(book.getCategory() == "Children's Books"){out.println("selected");} %>value="Children's Books">Children's Books</option>
						<option <% if(book.getCategory() == "Christian Books & Bibles"){out.println("selected");} %>value="Christian Books & Bibles">Christian Books & Bibles</option>
						<option <% if(book.getCategory() == "Comics & Graphic Novels"){out.println("selected");} %>value="Comics & Graphic Novels">Comics & Graphic Novels</option>
						<option <% if(book.getCategory() == "Computers & Technology"){out.println("selected");} %>value="Computers & Technology">Computers & Technology</option>
						<option <% if(book.getCategory() == "Cookbooks, Food & Wine"){out.println("selected");} %>value="Cookbooks, Food & Wine">Cookbooks, Food & Wine</option>
						<option <% if(book.getCategory() == "Crafts, Hobbies & Home"){out.println("selected");} %>value="Crafts, Hobbies & Home">Crafts, Hobbies & Home</option>
						<option <% if(book.getCategory() == "Education & Teaching"){out.println("selected");} %>value="Education & Teaching">Education & Teaching</option>
						<option <% if(book.getCategory() == "Engineering & Transportation"){out.println("selected");} %>value="Engineering & Transportation">Engineering & Transportation</option>
						<option <% if(book.getCategory() == "Gay & Lesbian"){out.println("selected");} %>value="Gay & Lesbian">Gay & Lesbian</option>
						<option <% if(book.getCategory() == "Health, Fitness & Dieting"){out.println("selected");} %>value="Health, Fitness & Dieting">Health, Fitness & Deiting</option>
						<option <% if(book.getCategory() == "History"){out.println("selected");} %>value="History">History</option>
						<option <% if(book.getCategory() == "Humor & Entertainment"){out.println("selected");} %>value="Humor & Entertainment">Humor & Entertainment</option>
						<option <% if(book.getCategory() == "Law"){out.println("selected");} %>value="Law">Law</option>
						<option <% if(book.getCategory() == "Literature & Fiction"){out.println("selected");} %>value="Literature & Fiction">Literature & Fiction</option>
						<option <% if(book.getCategory() == "Medical Books"){out.println("selected");} %>value="Medical Books">Medical Books</option>
						<option <% if(book.getCategory() == "Mystery, Thriller & Suspense"){out.println("selected");} %>value="Mystery, Thriller & Suspense">Mystery, Thriller & Suspense</option>
						<option <% if(book.getCategory() == "Parenting & Relationships"){out.println("selected");} %>value="Parenting & Relationships">Parenting & Relationships</option>
						<option <% if(book.getCategory() == "Politics & Social Sciences"){out.println("selected");} %>value="Politics & Social Sciences">Politics & Social Sciences</option>
						<option <% if(book.getCategory() == "Reference"){out.println("selected");} %>value="Reference">Reference</option>
						<option <% if(book.getCategory() == "Religion & Spirituality"){out.println("selected");} %>value="Religion & Spirituality">Religion & Spirituality</option>
						<option <% if(book.getCategory() == "Romance"){out.println("selected");} %>value="Romance">Romance</option>
						<option <% if(book.getCategory() == "Science & Math"){out.println("selected");} %>value="Science & Math">Science & Math</option>
						<option <% if(book.getCategory() == "Science Fiction & Fantasy"){out.println("selected");} %>value="Science Fiction & Fantasy">Science Fiction & Fantasy</option>
						<option <% if(book.getCategory() == "Self-Help"){out.println("selected");} %>value="Self-Help">Self-Help</option>
						<option <% if(book.getCategory() == "Sports & Outdoors"){out.println("selected");} %>value="Sports & Outdoors">Sports & Outdoors</option>
						<option <% if(book.getCategory() == "Teen & Young Adult"){out.println("selected");} %>value="Teen & Young Adult">Teen & Young Adult</option>
						<option <% if(book.getCategory() == "Travel"){out.println("selected");} %>value="Travel">Travel</option>
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
