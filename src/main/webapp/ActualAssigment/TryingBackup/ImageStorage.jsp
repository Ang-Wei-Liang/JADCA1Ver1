

<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<%@ page import="java.util.*" %>
<%@ page import="books.Book"%>
<%@ page import="java.io.File" %>
<%@ page import="java.nio.file.Files" %>

<% 
// Assuming you have the image file as a byte array


File imageFile = new File("Images/YouTube-Logo1.wine.jpg"); // Replace with the actual path to your image file
byte[] imageData = Files.readAllBytes(imageFile.toPath());


try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    String connURL = "jdbc:mysql://localhost/jadassignment1?user=root&password=SQLPass123&serverTimezone=UTC";
    Connection conn = DriverManager.getConnection(connURL);

    String sqlStr = "INSERT INTO bookbrowse2 (Picture) VALUES (?)";
    PreparedStatement pstmt = conn.prepareStatement(sqlStr);
    pstmt.setBytes(1, imageData);

    pstmt.executeUpdate();

    conn.close();
} catch (Exception e) {
    e.printStackTrace();
}


%>