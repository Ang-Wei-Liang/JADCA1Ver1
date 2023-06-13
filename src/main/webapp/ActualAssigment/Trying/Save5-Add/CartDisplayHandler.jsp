


<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>


<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<%@ page import="books.Book"%>


<%
//String searchTitle = request.getParameter("title");
//String searchAuthor = request.getParameter("author");

Boolean foundStatus = false;
int userID = (int) session.getAttribute("userID");

Boolean loggedIn = false;

if ((Boolean) session.getAttribute("loggedIn") == null){
	loggedIn = false;
} else {
	loggedIn = (Boolean) session.getAttribute("loggedIn");
}


List<Book> cartList = new ArrayList<>();

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    String connURL = "jdbc:mysql://localhost/jadassignment1?user=root&password=SQLPass123&serverTimezone=UTC";
    Connection conn = DriverManager.getConnection(connURL);

    //String sqlStr = "SELECT * FROM cart WHERE user_id = ?";
    String sqlStr = "SELECT * FROM cart c JOIN bookbrowse2 b ON c.book_id = b.book_id WHERE c.user_id = ?";

    PreparedStatement pstmt = conn.prepareStatement(sqlStr);
    pstmt.setInt(1, userID);


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
        cartList.add(book);
    }

    conn.close();
} catch (Exception e) {
    out.println("Error: " + e);
}

if (!cartList.isEmpty() && loggedIn != true) { //not logged in
    // Store search results in session attributes
    //HttpSession session = request.getSession();
    session.setAttribute("cartList", cartList);
    response.sendRedirect("CartDisplayLogged.jsp?validateBookPresent=true");

} else if (!cartList.isEmpty() && loggedIn == true){
	// Store search results in session attributes
    //HttpSession session = request.getSession();
    session.setAttribute("cartList", cartList);
    response.sendRedirect("CartDisplayLogged.jsp?validateBookPresent=true");
    
} else if (cartList.isEmpty()&& loggedIn == true){
	// Redirect back to the search page with an error message
    response.sendRedirect("CartDisplayLogged.jsp?validateBookPresent=false");
} else {
	response.sendRedirect("CartDisplayLogged.jsp?validateBookPresent=false");
}


%>