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
	<head><title>Edit Book <%=book.getTitle() %></title>
		<link rel="stylesheet" href="css/c06.css" />
	</head>
	<body>
		<form action="BookUpdate" method="post">
			<fieldset>
				<legend class="legend_text"> Update a Book in the Inventory. </legend>

				
				
				<div><span class="star">*</span><label>  Title: </label>
					<input type="text" name="title" id="title"  value="<%=book.getTitle() %>"  /></div>

				<div><span class="star">*</span><label>  Author: </label>
					<input type="text" name="author" id="author"  value="<%=book.getAuthor() %>"  /></div>
					
				<div><span class="star">*</span><label>  Category: </label>
					<select name="category" id="category">
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
					<script>
					
					</script>						
				</div>
					
				<div><label> Description <br></label><textarea name="BookDiscription" rows="10" cols="80" ><% out.println(book.getBookDescription()); %></textarea></div>
									
				<div><span class="star"></span><label>  Edition  </label>
					<input type="text" name="edition" id="edition" value= "<%=book.getEdition() %>" /></div>
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
