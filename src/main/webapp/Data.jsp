<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Name:</title>
    <%@ include file="All_js_css.jsp" %>

</head>
<body>
    <div class="container mt-5">
        <h3>Enter to continue...</h3>
        <br>
        <form action="ResultServlet" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">USER NAME</label>
                <input name="username" type="text" class="form-control" id="username" aria-describedby="usernameHelp">
                <div id="usernameHelp" class="form-text">Enter username to get the information about.</div>

                <div class="container text-center mt-5">
                    <button type="submit" class="btn btn-success text-center"><b>Submit</b></button>
                </div>

                <% String errorMessage = (String) request.getAttribute("errorMessage");
                   if (errorMessage != null) { %>
                   <p id="errorMessage" class="error-message"><%= errorMessage %></p>
                <% } %>
            </div>
        </form>
    </div>
</body>
</html>