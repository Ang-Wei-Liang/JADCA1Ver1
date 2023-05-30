

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Browse</title>
    <!-- Add your CSS stylesheets or links to external stylesheets here -->
</head>
<body>
    <h1>Book Browse</h1>

    <form method="GET" action="searchBooks.jsp"> <!-- Assuming you'll handle the search in a separate JSP file named "searchBooks.jsp" -->
        <label for="title">Search by Title:</label>
        <input type="text" name="title" id="title">

        <label for="author">Search by Author:</label>
        <input type="text" name="author" id="author">

        <input type="submit" value="Search">
    </form>

    <!-- Display the search results here -->
    <%-- Iterate over the search results and display them --%>
    <c:forEach var="book" items="${searchResults}">
        <div>
            <h2>${book.title}</h2>
            <p>Author: ${book.author}</p>
            <!-- Add more details or customize the display as per your requirements -->
            <a href="bookDetails.jsp?id=${book.book_id}">View Details</a> <!-- Assuming the book ID is used to identify individual books -->
        </div>
    </c:forEach>

    <!-- Add any additional content or components as needed -->

    <!-- Add your JavaScript code or links to external JavaScript files here -->
</body>
</html>
