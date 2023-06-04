



<!-- ImageDisplay.jsp -->

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
String isbn = request.getParameter("isbn");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    String connURL = "jdbc:mysql://localhost/jadassignment1?user=root&password=SQLPass123&serverTimezone=UTC";
    Connection conn = DriverManager.getConnection(connURL);

    String sqlStr = "SELECT Picture FROM bookbrowse2 WHERE isbn = ?"; // Add your condition to fetch the desired image

    PreparedStatement pstmt = conn.prepareStatement(sqlStr);
    pstmt.setString(1, isbn);

    ResultSet rs = pstmt.executeQuery();

    if (rs.next()) {
        byte[] imageBytes = rs.getBytes("Picture");

        // Set the content type of the response
        response.setContentType("Picture/png"); // Adjust the content type based on your image format

        // Get the output stream of the response
        OutputStream outs = response.getOutputStream();
        outs.write(imageBytes);
        outs.flush();
        outs.close();
    }

    conn.close();
} catch (Exception e) {
    e.printStackTrace();
}

%>
