

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Register Page</title>
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
        
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
        }
        
        .register-inputs {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
        }
        
        input[type="text"],
        input[type="password"],input[type="email"] {
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
    </style>
</head>

<body>
    <div class="header">
        <div class="header-links">
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
            <a href="Home.jsp">Books</a>
        </div>
        <h1>Register</h1>
    </div>

    <div class="container">
        <h1>Create an Account</h1>
        <form action="RegisterHandler.jsp" method="post">
            <div class="register-inputs">
                <input type="text" name="username" placeholder="Username" required/>
                <input type="password" name="password" placeholder="Password" required/>
                <input type="password" name="confirmPassword" placeholder="Confirm Password" required/>
                <input type="email" name="email" placeholder="Email" required/>
                <input type="submit" name="btnSubmit" value="Register" />
            <c:if test="${param.errCode eq 'passwordMismatch'}">
                <span style="color: red;">Passwords do not match. Please try again.</span>
            </c:if>
            </div>
        </form>
    </div>
</body>
</html>
