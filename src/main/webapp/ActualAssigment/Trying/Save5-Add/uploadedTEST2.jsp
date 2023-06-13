<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.util.List" %>

<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.FileItemFactory" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.FileUploadException" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.FileItem" %>

<%@ page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext" %>
<%@ page import="org.apache.tomcat.util.http.fileupload.RequestContext" %>




<%
// Check if the request is a multi-part form data request
boolean isMultipart = ServletFileUpload.isMultipartContent(request);

if (isMultipart) {
    // Create a file item factory
    FileItemFactory factory = new DiskFileItemFactory();

    // Create a new file upload handler
    ServletFileUpload upload = new ServletFileUpload(factory);

    try {
    	//List<FileItem> items = new ServletRequestContext(request);
    	RequestContext requestContext = new ServletRequestContext(request);
    	List<FileItem> items = upload.parseRequest(requestContext);


        // Process the file items
        for (FileItem item : items) {
            if (!item.isFormField() && "profilePic".equals(item.getFieldName())) {
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
                out.println("<h1>Profile Picture Updated</h1>");
                out.println("<p>Profile picture updated successfully!</p>");
            }
        }
    } catch (FileUploadException e) {
        e.printStackTrace();
        // Display error message
        out.println("<h1>Error</h1>");
        out.println("<p>Failed to process the uploaded file.</p>");
    }
} else {
    // Display an error message if it's not a multi-part form data request
    out.println("<h1>Error</h1>");
    out.println("<p>Invalid request. Please upload a profile picture using the form.</p>");
}
%>