


<%@page import="java.sql.*"%>
<%
int idNum;
String searchTitle = request.getParameter("title");
String searchAuthor = request.getParameter("author");

String rememberMe = request.getParameter("rememberMe");

ResultSet rs = null; // Declare the ResultSet object
boolean found = false;

System.out.print(searchTitle);
System.out.print(searchAuthor);

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    String connURL = "jdbc:mysql://localhost/jadassigment1?user=root&password=SQLPass123&serverTimezone=UTC";
    Connection conn = DriverManager.getConnection(connURL);
    
    String sqlStr = "SELECT * FROM bookbrowse2 WHERE title LIKE ? AND author LIKE ?";
    
    PreparedStatement pstmt = conn.prepareStatement(sqlStr);
    pstmt.setString(1, "%" + searchTitle + "%");
    pstmt.setString(2, "%" + searchAuthor + "%");

    rs = pstmt.executeQuery();

    if (rs.next()) {
        found = true;
    }

    conn.close();
} catch (Exception e) {
    out.println("Error: " + e);
}
System.out.print(found);


if (found) {
    // Display the list of books
    %>
    <!DOCTYPE html>
    <html>
    <head>
        <title>Book List</title>
    </head>
    <body>
        <h1>Book List</h1>
        <table>
            <tr>
                <th>Title</th>
                <th>Author</th>
                <!-- Add other columns as needed -->
            </tr>
            <% 
            do {
                String title = rs.getString("title");
                String author = rs.getString("author");
                // Retrieve other columns as needed
                
                %>
                <tr>
                    <td><%= title %></td>
                    <td><%= author %></td>
                    <!-- Add other cells as needed -->
                </tr>
                <% 
            } while (rs.next());
            %>
        </table>
    </body>
    </html>
    <% 
} else {
    // Redirect back to the search page with an error message
    System.out.print("record not found");
    response.sendRedirect("bookDetailsTrialTrial2.jsp?errCode=invalidLogin");
}
%>
