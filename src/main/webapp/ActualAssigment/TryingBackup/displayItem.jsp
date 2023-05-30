

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

    .welcome {
        font-size: 20px;
        margin-top: 30px;
    }

    .role {
        margin-top: 10px;
    }

    .home-btn {
        padding: 10px 20px;
        background-color: #blue;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 20px;
    }

    .home-btn:hover {
        background-color: #000223;
    }
</style>


<script>
    function clearSessionStorageAndRedirect(pageUrl) {
        sessionStorage.clear();
        window.location.href = pageUrl;
    }
</script>

<body>
    <div class="container">
        <h2>pract5-part4-displayMember.jsp</h2>
        

        <!-- Clears Session Storage -->
        <button class="home-btn" onclick="clearSessionStorageAndRedirect('bookDetailsTrialTrial2.jsp')">Home</button>

        <%-- Display book attribute values --%>
        <h3>Book Details:</h3>
        <p>Book ID: <%= session.getAttribute("bookId") %></p>
        <p>Title: <%= session.getAttribute("title") %></p>
        <p>Author: <%= session.getAttribute("author") %></p>
        <p>Price: <%= session.getAttribute("price") %></p>
        <p>Quantity: <%= session.getAttribute("quantity") %></p>
        <p>Publisher: <%= session.getAttribute("publisher") %></p>
        <p>Publication Date: <%= session.getAttribute("publicationDate") %></p>
        <p>ISBN: <%= session.getAttribute("isbn") %></p>
        <p>Genre: <%= session.getAttribute("genre") %></p>
        <p>Rating: <%= session.getAttribute("rating") %></p>
        <p>Description: <%= session.getAttribute("description") %></p>
    </div>
</body>
