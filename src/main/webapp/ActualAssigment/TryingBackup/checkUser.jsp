
<% 
String dm_userID=(String)session.getAttribute("sessUserID");
String dm_userRole=(String)session.getAttribute("sessUserRole");
String dm_loginStatus=(String)session.getAttribute("loginStatus");

if(dm_userID==null || !dm_loginStatus.equals("success")){
	response.sendRedirect("login2.jsp?errCode=invalidLogin");
}

%>