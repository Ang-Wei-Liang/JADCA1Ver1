<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hello World JSP</title>
</head>
</head>
<body>
  <%
  
  //Requests name and student id+validations
  //if validations are passed,details are printed to the screen, otherwise there is a reprompt
  
    String name = "";
    String id = "";
    
    // Get user's name using prompt()
    out.println("<script>");
    out.println("var name = prompt('Please enter your name:', '');");
    out.println("</script>");
    out.println("<br>");
    
    // Get user's ID using prompt()
    out.println("<script>");
    out.println("var id = prompt('Please enter your student ID:', '');");
    out.println("</script>");
    out.println("<br>");
    
    // Check if name and ID are not null or empty
    if (name != null && !name.isEmpty() && id != null && !id.isEmpty()) {
        out.println("Hello, " + name + "! Your student ID is " + id + ".");
    } else {
        out.println("Please enter your name and student ID.");
    }
  %>
</body>
</html>

