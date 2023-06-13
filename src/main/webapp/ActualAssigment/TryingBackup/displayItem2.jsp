

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

<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            text-align: center;
            font-family: 'Helvetica', sans-serif;
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
            font-family: 'Impact', sans-serif;
            font-size: 32px;
        }

        .welcome {
            font-size: 20px;
            margin-top: 30px;
        }

        .role {
            margin-top: 10px;
        }

        .home-btn {
            padding: 10px 20px;
            background-color: blue;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .home-btn:hover {
            background-color: #000223;
        }

        .book-details {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            grid-gap: 10px;
            text-align: center;
            margin-top: 30px;
            border: 2px solid #333;
            padding: 20px;
            border-radius: 10px;
        }

        .book-details p {
            margin: 0;
        }

        .book-title {
            font-size: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            grid-column: 1 / span 2;
            margin-top: -2px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>pract5-part4-displayMember.jsp</h2>
<!--  
        <p class="welcome">Welcome! <%= request.getParameter("loginid") %></p>
        <p class="role">Your user role is: <%= request.getParameter("userRole") %></p>
-->

        <%-- Display book attribute values --%>
        <div class="book-details">
            <h3 class="book-title"><%= request.getParameter("title") %></h3>
            <p><strong>Book ID:</strong> <%= request.getParameter("bookId") %></p>
            <p><strong>Author:</strong> <%= request.getParameter("author") %></p>
            <p><strong>Price:</strong> <%= request.getParameter("price") %></p>
            <p><strong>Quantity:</strong> <%= request.getParameter("quantity") %></p>
            <p><strong>Publisher:</strong> <%= request.getParameter("publisher") %></p>
            <p><strong>Publication Date:</strong> <%= request.getParameter("publicationDate") %></p>
            <p><strong>ISBN:</strong> <%= request.getParameter("isbn") %></p>
            <p><strong>Genre:</strong> <%= request.getParameter("genre") %></p>
            <p><strong>Rating:</strong> <%= request.getParameter("rating") %></p>
            <p><strong>Description:</strong> <%= request.getParameter("description") %></p>
        </div>

        <!-- Clears Session Storage -->
        <button class="home-btn" onclick="clearSessionStorageAndRedirect('bookDetailsTrialTrial2.jsp')">Home</button>
    </div>

    <script>
        function clearSessionStorageAndRedirect(pageUrl) {
            sessionStorage.clear();
            window.location.href = pageUrl;
        }
    </script>
</body>
</html>
