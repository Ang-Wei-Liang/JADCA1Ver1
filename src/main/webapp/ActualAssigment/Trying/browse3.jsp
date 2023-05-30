<%@page import="java.sql.*"%>
<%
// Gets input values and stores them in variables
String searchTitle = request.getParameter("title");
String searchAuthor = request.getParameter("author");

System.out.print("Title is " +searchTitle + "\n");
System.out.print("Author " + searchAuthor + "\n");


boolean found = false;

try {
    // Step 1: Load JDBC Driver
    Class.forName("com.mysql.cj.jdbc.Driver");
    // Step 2: Define Connection URL
    String connURL = "jdbc:mysql://localhost/jadassignment1?user=root&password=SQLPass123&serverTimezone=UTC";
    // Step 3: Establish connection to URL
    Connection conn = DriverManager.getConnection(connURL);
    // Step 4: Create Prepared Statement
    String sqlStr = "SELECT * FROM bookbrowse2 WHERE title=? AND author=?";
    PreparedStatement pstmt = conn.prepareStatement(sqlStr);
    pstmt.setString(1, searchTitle);
    pstmt.setString(2, searchAuthor);

    // Step 5: Execute Query
    ResultSet rs = pstmt.executeQuery();

    // Step 6: Process Result
    if (rs.next()) {
    	found = true;
    	
        // Retrieve values from the result set
        int bookId = rs.getInt("book_id");
        String title = rs.getString("title");
        String author = rs.getString("author");
        double price = rs.getDouble("price");
        int quantity = rs.getInt("quantity");
        String publisher = rs.getString("publisher");
        Date publicationDate = rs.getDate("publicationdate");
        String isbn = rs.getString("ISBN");
        String genre = rs.getString("genre");
        double rating = rs.getDouble("rating");
        String description = rs.getString("description");

        

        // You can use the retrieved values as needed
        // For example, you can store them in session attributes:
        //HttpSession session = request.getSession();
        /*session.setAttribute("bookId", bookId);
        session.setAttribute("title", title);
        session.setAttribute("author", author);*/
        // ...

        // Or you can pass them as parameters to another page:
        response.sendRedirect("displayItem2.jsp?bookId=" + bookId + "&title=" + title + "&author=" + author + "&price=" + price + "&quantity=" + quantity + "&publisher=" + publisher + "&publicationDate=" + publicationDate + "&isbn=" + isbn + "&genre=" + genre + "&rating=" + rating + "&description=" + description);
    }

    // Step 7: Close Connection
    conn.close();
} catch (Exception e) {
    out.println("Error: " + e);
}

if (!found) {
    System.out.println("Record not found");
    response.sendRedirect("bookDetailsTrialTrial2.jsp?errCode=invalidLogin");
}
%>
