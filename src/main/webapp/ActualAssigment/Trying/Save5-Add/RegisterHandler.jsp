<!-- 
**********************************************
* Author: Ang Wei Liang (P2227791)
* Class: DIT/FT/2A/02
* Date: 4/5/23
* Description: Practical 4 Part 2
* Objective: Verify user login details against database
**********************************************
 -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.*"%>

<%
//HttpSession session = request.getSession();

//Gets input values and stores them in variables
int idNum; // Remove this line if not required for registration
String username = request.getParameter("username");
String password = request.getParameter("password");
String confirmPassword = request.getParameter("confirmPassword");
String email = request.getParameter("email"); // Assuming "role" is changed to "email" for registration

if (!password.equals(confirmPassword)) {
    // Passwords don't match, redirect to an error page or display an error message
    response.sendRedirect("register.jsp?errCode=passwordMismatch");
    return;
}


boolean found = false; //by default
int rowsAffected = 0; // Declare the variable
		

//====================[START Database]=====================

try {
	// Step 1: Load JDBC Driver
	Class.forName("com.mysql.cj.jdbc.Driver");
	// Step 2: Define Connection URL
	String connURL = "jdbc:mysql://localhost/jadassignment1?user=root&password=SQLPass123&serverTimezone=UTC";
	// Step 3: Establish connection to URL
	Connection conn = DriverManager.getConnection(connURL);
	// Step 4: Create Statement object
	//Statement stmt = conn.createStatement();
	// Step 5: Execute SQL Command
	String sqlStr = "INSERT INTO users (username, password, email) VALUES (?, ?, ?)";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setString(1, username);
	pstmt.setString(2, password);
	pstmt.setString(3, email);

	//ResultSet rs = pstmt.executeQuery();
	
	rowsAffected = pstmt.executeUpdate();


	// Step 6: Process Result
	/*if (rs.next()) { //if there IS a record

		found = true;
	} else {

	}*/
	// Step 7: Close connection
	conn.close();
} catch (Exception e) {
	out.println("Error :" + e);
}

//====================[END Database]=======================

if (rowsAffected > 0) {
    // Registration successful
    // Add JavaScript code to display a browser popup alert
    out.println("<script type=\"text/javascript\">");
    out.println("alert('Registration successful!');");
    out.println("window.location.href = 'login.jsp';");
    out.println("</script>");
} else {
    // Registration failed, redirect to an error page or display an error message
    response.sendRedirect("register.jsp");
    //response.sendRedirect("register.jsp?errCode=invalidLogin");

}



//validations (correct input), printing a table based on the input values
/*if (found) {
	System.out.print("record found");
	response.sendRedirect("displayMember.jsp?loginid=" + user + "&userRole=" + userRole);

} else {
	response.sendRedirect("login2.jsp?errCode=invalidLogin"); //returns errCode of invalidLogin back to login2.jsp
}*/
%>