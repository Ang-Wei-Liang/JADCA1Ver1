<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<html>
<head>
    <title>Profile Picture Upload</title>
</head>
<body>
    <h1>Update Profile Picture</h1>

    <form action="<%=request.getContextPath()%>/profilePictureUpload" method="post" enctype="multipart/form-data">
        <input type="file" name="profilePic" accept="image/*" required>
        <input type="submit" value="Upload">
    </form>
    
    

    
</body>
</html>