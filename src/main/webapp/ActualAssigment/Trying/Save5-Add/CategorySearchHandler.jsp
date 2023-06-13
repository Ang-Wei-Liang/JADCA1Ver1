



<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>


<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<%@ page import="books.Book"%>


<%
String searchCategory = request.getParameter("category");
//String searchAuthor = request.getParameter("author");
Boolean foundStatus = false;

Boolean loggedIn = false;

if ((Boolean) session.getAttribute("loggedIn") == null){
	loggedIn = false;
} else {
	loggedIn = (Boolean) session.getAttribute("loggedIn");
}


List<Book> bookList = new ArrayList<>();

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    String connURL = "jdbc:mysql://localhost/jadassignment1?user=root&password=SQLPass123&serverTimezone=UTC";
    Connection conn = DriverManager.getConnection(connURL);

    String sqlStr = "SELECT * FROM bookbrowse2 WHERE genre = ?";
    PreparedStatement pstmt = conn.prepareStatement(sqlStr);
    pstmt.setString(1, searchCategory);


    ResultSet rs = pstmt.executeQuery();

    while (rs.next()) {
    	int bookid = rs.getInt("book_id");
        //System.out.println(bookid);
    	String isbn = rs.getString("isbn");
        //System.out.println(isbn);
        String title = rs.getString("title");
        //System.out.println(title);
        String author = rs.getString("author");
        //System.out.println(author);
        String publisher = rs.getString("publisher");
        //System.out.println(publisher);
        String category = rs.getString("genre");
        //System.out.println(category);
        int quantity = rs.getInt("quantity");
        //System.out.println(quantity);
        double price = rs.getDouble("price");
        //System.out.println(price);
       
        

        Book book = new Book(bookid, isbn, title, author, publisher, category, quantity, price);
        bookList.add(book);
    }

    conn.close();
} catch (Exception e) {
    out.println("Error: " + e);
}

if (!bookList.isEmpty() && loggedIn != true) { //not logged in
    // Store search results in session attributes
    //HttpSession session = request.getSession();
    session.setAttribute("bookList", bookList);
    response.sendRedirect("BookSearchDisplay.jsp?validateBookPresent=true");

} else if (!bookList.isEmpty() && loggedIn == true){
	// Store search results in session attributes
    //HttpSession session = request.getSession();
    session.setAttribute("bookList", bookList);
    response.sendRedirect("BookSearchDisplayLogged.jsp?validateBookPresent=true");
    
} else if (bookList.isEmpty()&& loggedIn == true){
	// Redirect back to the search page with an error message
    response.sendRedirect("BookSearchDisplayLogged.jsp?validateBookPresent=false");
} else {
	response.sendRedirect("BookSearchDisplay.jsp?validateBookPresent=false");
}
	


%>