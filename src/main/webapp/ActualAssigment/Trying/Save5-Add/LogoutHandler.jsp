

<%@page import="java.sql.*"%>

<%
    //HttpSession session = request.getSession(false); // Retrieves the existing session or returns null if no session exists

    // Check if a session exists
    if (session != null) {
        session.invalidate(); // Invalidates the session, removing all session attributes and tokens
    }

    // Redirect to the "home.jsp" page
    response.sendRedirect("login.jsp");
%>