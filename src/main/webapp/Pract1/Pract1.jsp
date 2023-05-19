<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<script>

//unrevamped version of pract 1

	var stdID, stdName, greeting, msg;
	var today = newDate();
	stdID = prompt("Enter your Student ID:");
	stdName = prompt("Enter your Name:");
	alert("Time now is:" + today.getHours());
	if (today.getHours() > 12) {
		greeting = "Good Afternoon!.. ";
	} else {
		greeting = "Good Morning!.. ";
	}

	msg = greeting + stdName + " (" + stdId + ")";

	alert(msg);
</script>
</head>
<body>

	<%
	String myStr = "<script>document.writeln(msg)</script>";
	out.print("Helloworld");
	out.print(myStr);
	out.print("<br>");
	%>


</body>
</html>














