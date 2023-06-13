
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<%@ page import="java.util.*" %>
<%@ page import="books.Book"%>

<!DOCTYPE html>
<html>
<head>
    <title>Book List</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
        }
        
        input[type="submit"],
        input[type="reset"] {
            
            height: 30px;
            margin-top: 10px;
            /*background-color: #4CAF50;*/
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
        .explore {
        background-color: #4CAF50;
        }
        
        .explore:hover {
        background-color: #45a049;
        }
        
        .addToCart {
        width: 100px;
        background-color: #4285F4;
        }
        
        .removeFromCart {
        width: 130px;
        background-color: #ff3300;
        }
        
        .addToCart:hover {
        width: 100px;
        background-color: #4266f4;
        }
        
        .removeFromCart:hover {
        width: 130px;
        background-color: #FF0000;
        }
        
        
        /*input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #45a049;
        }*/
        
        

        .header {
            background-color: #333;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            color: #fff;
            margin: auto;
        }

        .header-links {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .header-links a {
            color: #fff;
            text-decoration: none;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            align-items: flex-start;
            padding: 20px;
        }

        .box {
            width: calc(35% - 40px);
            padding: 20px;
            margin: 10px;
            margin-bottom: 40px;
            border: 1px solid #000;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .box p {
            margin-top: 0;
        }

        .box img {
            max-width: 100%;
            max-height: 200px;
            object-fit: contain;
            margin-bottom: 10px;
        }
        
        .noResults {
            
            margin-left: 100px;
            
            /*margin: auto;*/
        }
        
        .form-container {
 
        display: flex;
        justify-content: space-between;
        
        }
        
     
        

        
    </style>
</head>
<body>
<div class="header">
    <div class="header-links">
        <a href="LogoutHandler.jsp">Logout</a>
        <a href="HomeLogged.jsp">Books</a>
        <a href="ProfileHandler.jsp">Profile</a>
        <a href="CartDisplayHandler.jsp">Cart</a>
    </div>
    <h1>Books</h1>
</div>
<div class="container">
    <% 
    Set<Integer> cartBookIDs = (Set<Integer>) session.getAttribute("cartBookIDs");
    if (cartBookIDs == null) {
        cartBookIDs = new HashSet<>();
    }
    
    String cartAddStatus = null;
    if (request.getParameter("cartAddStatus") != null){
    cartAddStatus = request.getParameter("cartAddStatus");
    }
    
    
    
    String parameterValue = request.getParameter("validateBookPresent"); 
    Boolean trueOrFalse = Boolean.valueOf(parameterValue);
    
    int userID = (int) session.getAttribute("userID");    
    
    // Retrieve bookList from session attribute
    List<Book> bookList = (List<Book>) session.getAttribute("bookList");

    // Display book details
    if (bookList != null && true) {
        for (Book book : bookList) {
            String title = book.getTitle();
            String author = book.getAuthor();
            String isbn = book.getIsbn();
            int bookid = book.getBookID();

         // Determine the button label based on the cartAddStatus parameter
            String buttonLabel;
            String formDestination;
            if (cartBookIDs.contains(bookid)) {
                buttonLabel = "Remove from Cart";
                formDestination = "DeleteFromCartHandler.jsp";
            } else {
                buttonLabel = "Add to Cart";
                formDestination = "AddToCartHandler.jsp";
            }
            //System.out.println(bookid);
            
            
      
            
            /*if (cartAddStatus != null && cartAddStatus.equals("success")) {
                buttonLabel = "Remove from Cart";
            } else {
                buttonLabel = "Add to Cart";
            }*/
            
    %>
    <div class="box">
        <img src="ImageDisplay.jsp?isbn=<%=isbn%>" alt="Book Image">
        <div>
            <p>Title: <%= title %></p>
            <p>Author: <%= author %></p>
        </div>
        <div class="form-container"></div>
        <form action="BookSpecificDetails.jsp" method="get">
                   <input type="hidden" name="bookid" value="<%=bookid%>"/>
                   <input type="hidden" name="isbn" value="<%=isbn%>"/>
                   <input type="submit" value="Explore" class="explore"/>
        </form>
        <form action="<%= formDestination %>" method="get">
                   <input type="hidden" name="bookid" value="<%=bookid%>"/>
                   <input type="hidden" name="userid" value="<%=userID%>"/>
                   
                   <input type="submit" value="<% if (buttonLabel.equals("Remove from Cart")) { %>Remove from Cart<% } else { %>Add to Cart<% } %>" class="<% if (buttonLabel.equals("Remove from Cart")) { %>removeFromCart<% } else { %>addToCart<% } %>"/>
                   
                  
        </form>
    </div>
    <% 
        }
    } else {
    %>	
    	
    	<h1 class="noResults">No search results found.</h1>
        
    <% 
    }
    %>
</div>
</body>
</html>

