

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
<meta charset="ISO-8859-1">
<title>Result:</title>
<%@ include file="All_js_css.jsp"%>
</head>
<body>

<%
  HttpSession session1 = request.getSession(false);
  String username = (String) session1.getAttribute("username");
  String profileUrl = (String) session1.getAttribute("profileUrl");
  String name = (String) session1.getAttribute("name");
  int followers = (int) session1.getAttribute("followers");
  int following = (int) session1.getAttribute("following");
  int repositories = (int) session1.getAttribute("repositories");
%>
<div class="container">
  <h2>User Details:</h2>
  </div>
<div class="container mt-5">
  <table class="table">
    <tr>
      <th>Username:</th>
      <td><%= username %></td>
    </tr>
    <tr>
      <th>Profile URL:</th>
      <td><%= profileUrl %></td>
    </tr>
    <tr>
      <th>Name:</th>
      <td><%= name %></td>
    </tr>
    <tr>
      <th>Followers:</th>
      <td><%= followers %></td>
    </tr>
    <tr>
      <th>Following:</th>
      <td><%= following %></td>
    </tr>
    <tr>
      <th>Repositories:</th>
      <td><%= repositories %></td>
    </tr>
  </table>
</div>
<form action="index.jsp">
 <div class="container text-center mt-5">
                    <button type="submit" class="btn btn-success text-center"><b>Go back to Home</b></button>
                </div>
</form>
</body>
</html>

