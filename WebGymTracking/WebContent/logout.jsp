<%@ page language="java" contentType="text/html; charset=windows-1255" pageEncoding="windows-1255"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/view/jquery/jquery-3.3.1.slim.min.js"></script>
  <script src="js/view/popper/popper.min.js"></script>
  <script src="js/view/bootstrap/bootstrap.min.js"></script>
  <title>Add Active</title>
</head>

<body>
<%-- A body of logout --%>
<div align="center">
	<img class="mb-4" src="icon/iconLogout.svg" alt="" width="72" height="72">
	<h1 style="color:green; font-weight:bold;"><%if(request.getAttribute("message") != null)
         out.write((String)request.getAttribute("message")); %></h1>
    <h3>We hope you've had a good workout, and look forward to seeing you here in the next workout.</h3>
    <br>
    <a class="btn btn-outline-success" href="login.jsp" role="button">Login again</a> 
</div>

</body>
</html>