


<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>


<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<%@ page import="books.Book"%>


<%
Set<Integer> cartBookIDs = (Set<Integer>) session.getAttribute("cartBookIDs");

cartBookIDs = new HashSet<>();
session.setAttribute("cartBookIDs", cartBookIDs);

/*if (cartBookIDs == null) {
    cartBookIDs = new HashSet<>();
    session.setAttribute("cartBookIDs", cartBookIDs);
}*/


String searchCategory = request.getParameter("category");
//String searchAuthor = request.getParameter("author");
Boolean foundStatus = false;

Boolean loggedIn = false;


int userid = 0;

userid = (int) session.getAttribute("userID");

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

    String sqlStr = "SELECT * FROM cart WHERE user_id = ?";
    PreparedStatement pstmt = conn.prepareStatement(sqlStr);
    pstmt.setInt(1, userid);


    ResultSet rs = pstmt.executeQuery();

    while (rs.next()) {
    	int bookid = rs.getInt("book_id");
        System.out.println(bookid);
        foundStatus = true;
        cartBookIDs.add(bookid);

        //Book book = new Book(bookid, isbn, title, author, publisher, category, quantity, price);
        //bookList.add(book);
    }

    conn.close();
} catch (Exception e) {
    out.println("Error: " + e);
}

session.setAttribute("cartBookIDs", cartBookIDs);
response.sendRedirect("HomeLogged.jsp?userID=" + userid);




/*if (!bookList.isEmpty() && loggedIn != true) { //not logged in
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
}*/
	


%>