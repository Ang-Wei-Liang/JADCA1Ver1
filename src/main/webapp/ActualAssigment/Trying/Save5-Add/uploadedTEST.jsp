

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%

// Check if the form was submitted
if ("POST".equalsIgnoreCase(request.getMethod())) {
    	int userID = 1;
        // Get the uploaded file
        Part filePart = request.getPart("profilePic");
        InputStream fileInputStream = filePart.getInputStream();

        // Connect to the MySQL database
        String connURL = "jdbc:mysql://localhost/jadassignment1?user=root&password=SQLPass123&serverTimezone=UTC";
        
        Connection conn = DriverManager.getConnection(connURL);

        // Prepare the SQL statement
        String updateQuery = "UPDATE user_table SET profile_picture = ? WHERE user_id = ?";
        PreparedStatement statement = conn.prepareStatement(updateQuery);

        // Set the parameters
        statement.setBlob(1, fileInputStream);
        statement.setInt(2, userID); // Replace userId with the actual user ID

        // Execute the query
        statement.executeUpdate();

        // Close the database connection
        statement.close();
        conn.close();

        // Display success message
        out.println("<p>Profile picture updated successfully!</p>");
} else {
    // Display an error message if the form was not submitted
    out.println("<h1>Error</h1>");
    out.println("<p>Invalid request. Please upload a profile picture using the form.</p>");
}
%>
