<!-- 
**********************************************
* Author: Ang Wei Liang (P2227791)
* Class: DIT/FT/2A/02
* Date: 4/5/23
* Description: Practical 4 Part 2
* Objective: Verify user login details against database
**********************************************
 -->
 

<%@page import="java.sql.*"%>

<%

//HttpSession session = request.getSession();

//Gets input values and stores them to variables
int userID = 0;

String user = request.getParameter("username");
String pwd = request.getParameter("password");
String userRole = request.getParameter("role");

System.out.print("username is " + user + ", password is " + pwd);

boolean found = false; //by default



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
	String sqlStr = "SELECT * FROM users WHERE username=? AND password=?";
	
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setString(1, user);
	pstmt.setString(2, pwd);

	ResultSet rs = pstmt.executeQuery();

	// Step 6: Process Result
	if (rs.next()) { //if there IS a record
		found = true;
		userID = rs.getInt("id");
	
	} else {
		
	}
	
	// Step 7: Close connection
	conn.close();
} catch (Exception e) {
	out.println("Error :" + e);
}

//====================[END Database]=======================




//validations (correct input), printing a table based on the input values
if (found) {
	session.setAttribute("loggedIn", true);
    session.setAttribute("username", user);
    session.setAttribute("userID", userID);
    System.out.print("record found");
    response.sendRedirect("CartDisplayButtonHandler.jsp?userID=" + userID);
	

} else {
	response.sendRedirect("login.jsp"); //returns errCode of invalidLogin back to login2.jsp
}
%>