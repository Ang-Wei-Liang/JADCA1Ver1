

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Details</title>
    <!-- Add your CSS stylesheets or links to external stylesheets here -->
</head>
<body>
    <h1>Book Details</h1>

    <h2>${book.title}</h2>
    <p>Author: ${book.author}</p>
    <p>Price: ${book.price}</p>
    <p>Quantity: ${book.quantity}</p>
    <p>Publisher: ${book.publisher}</p>
    <p>Publication Date: ${book.publicationdate}</p>
    <p>ISBN: ${book.ISBN}</p>
    <p>Genre: ${book.genre}</p>
    <p>Rating: ${book.rating}</p>
    <p>Description: ${book.description}</p>

    <!-- Add any additional content or components as needed -->

    <a href="browse.jsp">Back to Browse</a> <!-- Link to navigate back to the browsing page -->

    <!-- Add your JavaScript code or links to external JavaScript files here -->
</body>
</html>
