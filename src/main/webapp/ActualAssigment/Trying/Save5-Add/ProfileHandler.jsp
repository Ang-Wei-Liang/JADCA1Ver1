


<%@page import="java.sql.*"%>

<%

//HttpSession session = request.getSession();

//Gets input values and stores them to variables

int userID = 1;
userID = (int) session.getAttribute("userID");

String username = "";
String password = "";
String email = "";
String aboutMe = "";
String address = "";
String categoryPicBase64 = "";

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
	String sqlStr = "SELECT * FROM users WHERE id=?";
	
	PreparedStatement pstmt = conn.prepareStatement(sqlStr);
	
	//String userIDString = String.valueOf(userID);
	
	pstmt.setInt(1, userID);

	ResultSet rs = pstmt.executeQuery();

	// Step 6: Process Result
	if (rs.next()) { //if there IS a record
		found = true;
		//userID = rs.getInt("id");
		username = rs.getString("username");
		
		password = rs.getString("password");
		System.out.print("password is " + password);
		email = rs.getString("email");
		System.out.print("email is " + email);
		aboutMe = rs.getString("about_me");
		address = rs.getString("address");
		
		//System.out.print("detailsProfile is ///////////////" + username+password+email+aboutMe+address);
		
		
		Blob profilePic = rs.getBlob("profile_picture");
        
        // Convert the categoryPic blob to base64 string for display
        categoryPicBase64 = java.util.Base64.getEncoder().encodeToString(profilePic.getBytes(1, (int) profilePic.length()));
		

	
	} else {
		System.out.print("detailsProfile is ///////////////" + "NOT FOUND");
	}
	
	// Step 7: Close connection
	conn.close();
} catch (Exception e) {
	out.println("Error :" + e);
}

//====================[END Database]=======================




//validations (correct input), printing a table based on the input values
if (found) {
	System.out.print("detailsProfile is ggggggggggggggg" + username+password+email+aboutMe+address);
	//session.setAttribute("loggedIn", true);
    session.setAttribute("username", username);
    session.setAttribute("password", password);
    session.setAttribute("email", email);
    session.setAttribute("aboutMe", aboutMe);
    session.setAttribute("address", address);
    // Assuming you have an active session object named "session"

    session.setAttribute("categoryPicBase64", categoryPicBase64);

    
    System.out.print("profile record found");
    response.sendRedirect("Profile.jsp?userID=" + userID);
	

} else {
	response.sendRedirect("login.jsp?errCode=invalidLogin"); //returns errCode of invalidLogin back to login2.jsp
}
%>