<%@page import="javax.servlet.http.HttpSession"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>DS: Home Page</title>
<%@ include file="All_js_css.jsp"%>
     </head>
  <body>

    <div class="container">
   <%@ include file="NavBar.jsp"%>
    <br>
    <div class="card">
     <img alt="not available" class="img-fluid mx-auto" style="max-width:400px;" src="DataIcon/github.png">


       <form action="Data.jsp">
        <div class="container text-center mt-5">
        <button type="submit" class="btn btn-outline-primary text-center"><b>Start here</b></button>
        </div>
    </form>
   </div>

   </div>
 </body>
</html>