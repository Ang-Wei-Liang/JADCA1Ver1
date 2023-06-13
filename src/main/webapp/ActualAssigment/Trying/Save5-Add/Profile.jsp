<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Profile Page</title>
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
        
        .profile-card {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #f9f9f9;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }
        
        .profile-details {
            flex: 1;
            margin-right: 20px;
        }
        
        .profile-details h3 {
            color: #333;
            margin-bottom: 10px;
        }
        
        .profile-details p {
            color: #777;
            margin-bottom: 10px;
        }
        
        .profile-picture {
            flex: 0 0 auto;
        }
        
        .profile-picture img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
        }
        
        .edit-button {
            margin-top: 20px;
            display: flex;
            justify-content: center;
        }
        
        .edit-button button {
            width: 100px;
            height: 30px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
        .edit-button button:hover {
            background-color: #45a049;
        }
    </style>
</head>


<%
int userID = 1;
//userID = (int) session.getAttribute("userID");

String username = "a";
String password = "b";
String email = "c";
String aboutMe = "d";
String address = "e";

String categoryPicBase64 = "";
String profilePicture = null;


username = (String) session.getAttribute("username");
System.out.print("username is-------------------------------" + username);
password = (String) session.getAttribute("password");
email = (String) session.getAttribute("email");
aboutMe = (String) session.getAttribute("aboutMe");
address = (String) session.getAttribute("address");
System.out.print("address is-------------------------------" + address);


categoryPicBase64 = (String) session.getAttribute("categoryPicBase64");

%>


<body>
    <div class="header">
        <div class="header-links">
            <a href="LogoutHandler.jsp">Logout</a>
            <a href="HomeLogged.jsp">Books</a>
            <a href="ProfileHandler.jsp">Profile</a>
            <a href="CartDisplayHandler.jsp">Cart</a>
        </div>
        <h1>Profile</h1>
    </div>

    <div class="container">
        <h1>User Profile</h1>
        <div class="profile-card">
            <div class="profile-details">
                <%-- Retrieve user details from the database or session attributes --%>
                <div>
                    <h3>Username:</h3>
                    <p><%= username %></p>
                </div>
                <div>
                    <h3>Password:</h3>
                    <p><%= password %></p>
                </div>
                <div>
                    <h3>Email:</h3>
                    <p><%= email %></p>
                </div>
                <div>
                    <h3>Address:</h3>
                    <p><%= address %></p>
                </div>
                
            </div>
            <div class="profile-picture">
                <h3>Profile Picture:</h3>
                <%-- Check if profile picture exists --%>
                <% if (categoryPicBase64 != null && !categoryPicBase64.isEmpty()) { %>
                    <img src="data:image/png;base64,<%= categoryPicBase64 %>" alt="Profile Picture">
                <% } else { %>
                    <p>blank</p>
                <% } %>
                <div>
                    <h3>About Me:</h3>
                    <p><%= aboutMe %></p>
                </div>
            </div>
        </div>
        <div class="edit-button">
            <button>Edit</button>
        </div>
    </div>
</body>
</html>
