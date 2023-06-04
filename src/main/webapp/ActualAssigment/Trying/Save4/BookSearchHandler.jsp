

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>


<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<%@ page import="books.Book"%>


<%
String searchTitle = request.getParameter("title");
String searchAuthor = request.getParameter("author");
Boolean foundStatus = false;


List<Book> bookList = new ArrayList<>();

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    String connURL = "jdbc:mysql://localhost/jadassignment1?user=root&password=SQLPass123&serverTimezone=UTC";
    Connection conn = DriverManager.getConnection(connURL);

    String sqlStr = "SELECT * FROM bookbrowse2 WHERE title LIKE ? AND author LIKE ?";
    PreparedStatement pstmt = conn.prepareStatement(sqlStr);
    pstmt.setString(1, "%" + searchTitle + "%");
    pstmt.setString(2, "%" + searchAuthor + "%");

    ResultSet rs = pstmt.executeQuery();

    while (rs.next()) {
        String isbn = rs.getString("isbn");
        System.out.println(isbn);
        String title = rs.getString("title");
        System.out.println(title);
        String author = rs.getString("author");
        System.out.println(author);
        String publisher = rs.getString("publisher");
        System.out.println(publisher);
        String category = rs.getString("genre");
        System.out.println(category);
        int quantity = rs.getInt("quantity");
        System.out.println(quantity);
        double price = rs.getDouble("price");
        System.out.println(price);

        Book book = new Book(isbn, title, author, publisher, category, quantity, price);
        bookList.add(book);
    }

    conn.close();
} catch (Exception e) {
    out.println("Error: " + e);
}

if (!bookList.isEmpty()) {
    // Store search results in session attributes
    //HttpSession session = request.getSession();
    session.setAttribute("bookList", bookList);
    response.sendRedirect("BookSearchDisplay.jsp");

} else {
    // Redirect back to the search page with an error message
    response.sendRedirect("bookDetailsTrialTrial2.jsp?errCode=invalidLogin");
}


%>
