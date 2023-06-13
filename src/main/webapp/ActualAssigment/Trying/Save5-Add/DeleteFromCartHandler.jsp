
<%@page import="java.sql.*"%>
<%@ page import="java.util.*" %>


<%
Set<Integer> cartBookIDs = (Set<Integer>) session.getAttribute("cartBookIDs");
if (cartBookIDs == null) {
    cartBookIDs = new HashSet<>();
    session.setAttribute("cartBookIDs", cartBookIDs);
}


//HttpSession session = request.getSession();

//Gets input values and stores them in variables
int idNum; // Remove this line if not required for registration
//userid = request.getParameter("userid");
		
int userID = (int) session.getAttribute("userID");	
		
String bookIDString = request.getParameter("bookid");
int bookID = Integer.parseInt(bookIDString);

		
//String password = request.getParameter("password");
		
//String previousPage = request.getHeader("Referer");
//String confirmPassword = request.getParameter("confirmPassword");
//String email = request.getParameter("email"); // Assuming "role" is changed to "email" for registration




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
	String sqlStr = "DELETE FROM cart WHERE user_id = ? AND book_id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	pstmt.setInt(1, userID);
	pstmt.setInt(2, bookID);
	
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
    // Delete successful
    // Add JavaScript code to display a browser popup alert
    
    cartBookIDs.remove(bookID);
	//response.sendRedirect(previousPage+"?cartAddStatus=notsuccess");
	response.sendRedirect("BookSearchDisplayLogged.jsp?cartAddStatus=notsuccess");
	
    System.out.print("Remove from cart successful");
    
} else {
    // Registration failed, redirect to an error page or display an error message
   
    //response.sendRedirect(previousPage+"?cartAddStatus=success");
    response.sendRedirect("BookSearchDisplayLogged.jsp?cartAddStatus=success");
    System.out.print("Remove from cart NOT successful");
    
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