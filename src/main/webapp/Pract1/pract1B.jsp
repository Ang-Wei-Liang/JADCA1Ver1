<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<script>
		/* ---------------------------------------------
		 Author: Ang Wei Liang (P2227791)
		 Date: 20 / 04 / 2023
		 Description: ST0510/JAD Week 1 Submission
		 */
		 
		//revamped version of pract 1

		var myID, myName, greeting, myMsg;
		var today = new Date();
		myID = prompt("Enter your Student ID:");
		myName = prompt("Enter your Name:");

		if (today.getHours() > 12) {
			greeting = "Good Afternoon!.. ";
		} else {
			greeting = "Good Morning!.. ";
		}

		myMsg = greeting + myName + " (" + myID + ")";
		alert(myMsg);
	</script>

	<%
	String myStr = "<script>document.write(myMsg)</script>"; // changed document.writeln to document.write
	out.print("Hello world<br>");
	out.print(myStr);
	%>

</body>
</html>

