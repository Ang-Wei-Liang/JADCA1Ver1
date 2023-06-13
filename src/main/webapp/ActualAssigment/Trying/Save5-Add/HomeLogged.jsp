<!-- 
**********************************************
* Author: Ang Wei Liang (P2227791)
* Class: DIT/FT/2A/02
* Date: 25/5/23
* Description: Practical 4 Part 4 Extra
* Objective: Add CSS styling, and cookie storage (remember me function) 
Remember me function: remembers your login and prefills form fields
**********************************************
 -->
<%@page import="java.sql.*"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Page</title>
<style>
        body {
            text-align: center;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
        }
        
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            
        }
        
        .header {
            background-color: #333;
            padding: 5px;
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }
        
        .header-links {
            display: flex;
            align-items: center;
            gap: 10px;
            
            /*display: flex;
            align-items: center;
            gap: 10px;
            flex-grow: 1;
            justify-content: flex-end;*/
        }
        
        .header a {
            color: #fff;
            text-decoration: none;
            margin: 0 8px;
            font-size: 18px;
        }
        
        .header h1 {
            color: #fff;
            margin: auto;
            margin-right: 50px;
        }
        
        .header a:hover {
            text-decoration: underline;
        }
        
        h1 {
            color: #333;
            margin-top: 20px;
        }
        
        h2 {
            color: #333;
            margin-top: 20px;
        }
        
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
        }
        
        .search-inputs {
            display: flex;
            gap: 10px;
            margin-bottom: 10px;
        }
        
        input[type="text"],
        input[type="password"] {
            width: 250px;
            height: 30px;
            margin: 5px 0;
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        
        input[type="submit"],
        input[type="reset"] {
            width: 100px;
            height: 30px;
            margin-top: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #45a049;
        }
        
        .box-container {
            width: calc(30% - 40px);
            padding: 20px;
            margin: 10px;
            margin-bottom: 40px;
            border: 1px solid #000;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .box-container p {
            margin-top: 0;
        }

        .box-container img {
            max-width: 150%;
            max-height: 200px;
            object-fit: contain;
            margin-bottom: 10px;
        }
        
        /*.container2 {
           display: flex;
           flex-wrap: wrap;
           justify-content: space-between;
           
        }*/
        
    </style>
</head>


<%
//String username = "Wei Liang";
String username = (String) session.getAttribute("username");
//int userID = 1;
int userID = (int) session.getAttribute("userID");

//String userIDString = request.getParameter("userID");
//int userIDs = Integer.parseInt(userIDString);


%>



<body>
<div class="header">
    <div class="header-links">
        <a href="LogoutHandler.jsp">Logout</a>
        <a href="HomeLogged.jsp">Books</a>
        <a href="ProfileHandler.jsp">Profile</a>
        <a href="CartDisplayHandler.jsp">Cart</a>
    </div>
    <h1>Search</h1>
    <div class="header-search">
        <form action="BookSearchHandler.jsp" method="post">
            <div class="search-inputs">
                <input type="text" name="title" placeholder="Search By Title" />
                <input type="text" name="author" placeholder="Search By Author" />
                <input type="submit" name="btnSubmit" value="Search" /> 
            </div>
            
        </form>
    </div>
</div>




<div class="container">

    <h1>Welcome, <%= username %></h1>
    <h2>Categories</h2>
    
    
    <% 
    
 // Step 1: Load JDBC Driver
 	Class.forName("com.mysql.cj.jdbc.Driver");
 	// Step 2: Define Connection URL
 	String connURL = "jdbc:mysql://localhost/jadassignment1?user=root&password=SQLPass123&serverTimezone=UTC";
 	// Step 3: Establish connection to URL
 	Connection conn = DriverManager.getConnection(connURL);
 	// Step 4: Create Statement object
 	Statement stmt = conn.createStatement();
 	// Step 5: Execute SQL Command,// Execute a SELECT query to retrieve the rows from the categoriesinfo table
 	String sqlStr = "SELECT * FROM categoriesinfo";;
 	ResultSet rs = stmt.executeQuery(sqlStr);
    
        
        // Iterate over the result set and display each row in a box container
        while (rs.next()) {
            String category = rs.getString("category");
            String categoryDescription = rs.getString("categorydescription");
            Blob categoryPic = rs.getBlob("categoryPic");
            
            // Convert the categoryPic blob to base64 string for display
            String categoryPicBase64 = java.util.Base64.getEncoder().encodeToString(categoryPic.getBytes(1, (int) categoryPic.length()));
            
            // Display the row in a box container
    %>
            <!--  <div class="container"> -->
            <div class="box-container">
            
         
                <h2><%= category %></h2>
                <p><%= categoryDescription %></p>
                <img src="data:image/png;base64,<%= categoryPicBase64 %>" alt="Category Image" />
                <form action="CategorySearchHandler.jsp" method="get">
                   <input type="hidden" name="category" value="<%= category %>" />
                   <input type="submit" value="Explore" />
                </form>
            </div>
            <!--  </div> --->
    <% 
        }
        
        // Close the result set and database connection
        rs.close();
        // close the database connection
        // connection.close();
    %>
</div>

</body>

</html>
