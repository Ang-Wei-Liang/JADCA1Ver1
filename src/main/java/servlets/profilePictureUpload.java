package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.sql.*;

@MultipartConfig

@WebServlet("/profilePictureUpload")
public class profilePictureUpload extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if the form was submitted
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            int userID = 1;
            // Get the uploaded file
            Part filePart = request.getPart("profilePic");
            InputStream fileInputStream = filePart.getInputStream();

            try {
            	try {
					Class.forName("com.mysql.cj.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            	
                // Connect to the MySQL database
                String connURL = "jdbc:mysql://localhost/jadassignment1?user=root&password=SQLPass123&serverTimezone=UTC";
                Connection conn = DriverManager.getConnection(connURL);

                // Prepare the SQL statement
                String updateQuery = "UPDATE users SET profile_picture = ? WHERE id = ?";
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
                response.getWriter().println("<p>Profile picture updated successfully!</p>");
            } catch (SQLException e) {
            	System.out.println("--------------------------------");
                e.printStackTrace();
                System.out.println("--------------------------------");
                // Display error message
                response.getWriter().println("<h1>Error</h1>");
                response.getWriter().println("<p>Failed to update the profile picture.</p>");
            }
        } else {
            // Display an error message if the form was not submitted
            response.getWriter().println("<h1>Error</h1>");
            response.getWriter().println("<p>Invalid request. Please upload a profile picture using the form.</p>");
    
        }
    }
}
