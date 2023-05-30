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


<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
        body {
            text-align: center;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
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
    </style>
 <script>
 
 window.addEventListener("load", function() {
	    // Hide error message after 2 seconds
	    var errorMessage = document.getElementById("errorMessage");
	    if (errorMessage) {
	        setTimeout(function() {
	            errorMessage.style.display = "none";
	        }, 2000);
	    }

	    // Check if cookies were cleared after the page has finished reloading
	    setTimeout(function() {
	        checkCookiesCleared();
	    }, 1000); // Adjust the delay as needed
	});
 </script> 
    
    
</head>

<div class="container">
    <h2>Search Page</h2>


	<%
	// Display error message if applicable
			boolean reset = (request.getParameter("btnSubmit") != null && request.getParameter("btnSubmit").equals("Reset"));
			String message = request.getParameter("errCode");

			// Validations (valid input)
			if (message != null && message.equals("invalidLogin") && !reset) {
				out.print("<br><h5 id=\"errorMessage\">Sorry, There is no such book found inside <br>Please try again!</h5>");
			} else if (message == null) {
				out.print("<br>");
			}
	%>
    
	<form action="browse3.jsp" method="post">
		
		Search By Title: <input id="titleID" type="text" name="title" /><br />
		Search By Author: <input id="authorID" type="text" name="author" /><br />

		<input type="submit" name="btnSubmit" value="Search" /> 
		<input type="reset"
name="btnSubmit" value="Reset"/>

	</form>
	
</div>
</body>

</html>