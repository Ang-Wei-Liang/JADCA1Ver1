
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
    </style>
</head>
<body>
<div class="header">
    <div class="header-links">
        <a href="/login">Login</a>
        <a href="/register">Register</a>
    </div>
    <h1>Books</h1>
</div>
<div class="container">
    <% 
    String isbnRef = request.getParameter("isbn");
    String isbn = request.getParameter("isbn");
    
    // Retrieve bookList from session attribute
    List<Book> bookList = (List<Book>) session.getAttribute("bookList");

    // Display book details
    if (bookList != null) {
        for (Book book : bookList) {
            if (isbnRef.equals(book.getIsbn())) {
                String title = book.getTitle();
                String author = book.getAuthor();
                isbn = book.getIsbn();
                String genre = book.getCategory();
                String publisher = book.getPublisher();
                int quantity = book.getQuantity();
                double price = book.getPrice();
                
                // Display the book details here
                %>
                <div class="box">
                    <img src="ImageDisplay.jsp?isbn=<%=isbn%>" alt="Book Image">
                    <div>
                        <p>Title: <%= title %></p>
                        <p>Author: <%= author %></p>
                        <p>ISBN: <%= isbn %></p>
                        <p>Genre: <%= genre %></p>
                        <p>Publisher: <%= publisher %></p>
                        <p>Quantity: <%= quantity %></p>
                        <p>Price: <%= price %></p>
                    </div>
                </div>
                <% 
                break; // Exit the loop since we found the matching book
            }
        }
    } else {
        out.println("No search results found.");
    }
    %>
</div>

</body>
</html>

