

<%@page import="java.sql.*"%>
<%
//Gets input values and stores them to variables
int idNum;
String searchTitle = request.getParameter("title");
String searchAuthor = request.getParameter("author");
//String userRole = request.getParameter("role");

String rememberMe = request.getParameter("rememberMe");


boolean found = false; //by default

System.out.print("Title is " +searchTitle + "\n");
System.out.print("Author " + searchAuthor + "\n");

//====================[START Database]=====================

try {
	// Step 1: Load JDBC Driver
	Class.forName("com.mysql.cj.jdbc.Driver");
	// Step 2: Define Connection URL
	String connURL = "jdbc:mysql://localhost/jadassigment1?user=root&password=SQLPass123&serverTimezone=UTC";
	// Step 3: Establish connection to URL
	Connection conn = DriverManager.getConnection(connURL);
	// Step 4: Create Statement object
	//Statement stmt = conn.createStatement();
	// Step 5: Execute SQL Command
	String sqlStr = "SELECT * FROM bookbrowse2 WHERE title=? AND author=?";
	
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setString(1, searchTitle);
	pstmt.setString(2, searchAuthor);

	ResultSet rs = pstmt.executeQuery();

	// Step 6: Process Result
	if (rs.next()) { //if there IS a record

		found = true;
	} else {
		
	}
	// Step 7: Close connection
	conn.close();
} catch (Exception e) {
	out.println("Error :" + e);
}

//====================[END Database]=======================


//validations (correct input), setting sessions based on the input values
if (found) {

	//session.setAttribute("sessUserID", user);
	//session.setAttribute("sessUserRole"/*, userRole);*/
	//session.setAttribute("loginStatus", "success"); //interesting, can also give a boolean
	
    System.out.print("record found, session object set");
	
	
	/*session.setAttribute("sessUserID", user);
	session.setAttribute("sessUserRole", userRole);
	session.setAttribute("loginStatus", "success"); //interesting, can also give a boolean
	
    System.out.print("record found, session object set");*/
    //response.sendRedirect("displayItem.jsp?loginid=" + user + "&userRole=" + userRole);
    
    //response.sendRedirect("displayItem.jsp?loginid=" + user + "&userRole=" + userRole);
    //response.sendRedirect("Pract5/part4Extra/displayMember.jsp");
 
} else {
	System.out.print("record not found");
	//response.sendRedirect("bookDetailsTrialTrial2.jsp"); //returns errCode of invalidLogin back to login2.jsp
    response.sendRedirect("bookDetailsTrialTrial2.jsp?errCode=invalidLogin"); //returns errCode of invalidLogin back to login2.jsp
	
}    



%>