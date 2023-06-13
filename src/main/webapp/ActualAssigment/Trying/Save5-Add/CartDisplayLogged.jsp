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
            width: 100px;
            height: 30px;
            margin-top: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #45a049;
        }

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
    <h1>Cart</h1>
</div>
<div class="container">
    <% 
    
    
    
    String parameterValue = request.getParameter("validateBookPresent"); 
    Boolean trueOrFalse = Boolean.valueOf(parameterValue);
    
    
    // Retrieve bookList from session attribute
    List<Book> cartList = (List<Book>) session.getAttribute("cartList");

    // Display book details
    if (cartList != null && trueOrFalse == true) {
        for (Book book : cartList) {
            String title = book.getTitle();
            String author = book.getAuthor();
            String isbn = book.getIsbn();
            
            
    %>
    <div class="box">
        <img src="ImageDisplay.jsp?isbn=<%=isbn%>" alt="Book Image">
        <div>
            <p>Title: <%= title %></p>
            <p>Author: <%= author %></p>
        </div>
        <form action="BookSpecificDetails.jsp" method="get">
                   <input type="hidden" name="isbn" value="<%=isbn%>"/>
                   <input type="submit" value="Explore" />
        </form>
    </div>
    <% 
        }
    } else {
    %>	
    	
    	<h1 class="noResults">No items in cart.</h1>
        
    <% 
    }
    %>
</div>
</body>
</html>