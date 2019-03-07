<%@ page language="java" import="com.hit.model.*" contentType="text/html; charset=windows-1255" pageEncoding="windows-1255"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/view/jquery/jquery-3.3.1.slim.min.js"></script>
  <script src="js/view/popper/popper.min.js"></script>
  <script src="js/view/bootstrap/bootstrap.min.js"></script>
  <jsp:useBean id="bg" class="com.hit.wp.model.BGBean" scope="session"/>
  <jsp:setProperty property="*" name="bg" />
  <title>About</title>
</head>

<%-- Using jsp:useBean and jsp:getProperty --%>
<body style="background: rgb(<jsp:getProperty name="bg" property="r"/>,
							<jsp:getProperty name="bg" property="g"/>,
							<jsp:getProperty name="bg" property="p"/>)">
<%-- toolbar of user --%>
<nav class="navbar navbar-dark bg-dark">
	<img src="icon/navbarIcon.svg" width="30" height="30" class="d-inline-block align-top" alt=""><h3 style="color:white;">GymTracking</h3>
  	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="true" aria-label="Toggle navigation">
    	<span class="navbar-toggler-icon"></span>
  	</button>
  	<div class="collapse navbar-collapse" id="navbarNav">
   		<ul class="navbar-nav">
      		<li class="nav-item active">
        		<a class="nav-link" href="userMain.jsp">Home<span class="sr-only">(current)</span></a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="userActivities.jsp">MyActivity</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="search.jsp">Search</a>
      		</li>
      		<li class="nav-item">
       			<a class="nav-link" href="about.jsp">About</a>
      		</li>
      		<li class="nav-item dropdown">
        		<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          		<%User user = (User)session.getAttribute("loginUser");
          		out.println(user.getUserName()); %>
        		</a>
        		<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          		<a class="dropdown-item" href="updateUser.jsp">Update User</a>
          		<a class="dropdown-item" href="updateWeightAndHeight.jsp">Update Weight And Height</a>
          		<a class="dropdown-item" href="updatePassword.jsp">Update Password</a>
        		</div>
      		</li>
      		<li class="nav-item">
        		<form action="http://localhost:8080/WebGymTracking/GymTrackingController" method="get">
            	<input type="hidden" name="command" value="logout" >
            	<input class="btn btn-danger" type="submit" value="logout">
        		</form>
      		</li>
    	</ul>
  	</div>
</nav>

<%-- Information about developers --%>
<div align="center">
	<img class="mb-4" src="icon/iconAbout.svg" alt="" width="72" height="72"><br>
	<h3>This page created and desinged by : </h3>
	<br><h5>&#169;<a class="btn btn-link" href="https://www.linkedin.com/in/sapir-abuksis/" role="button">Sapir Abukasis</a> &#38; 
	<a class="btn btn-link" href="https://www.linkedin.com/in/alexey-shpigelman/" role="button">Alexey Shpigelman</a></h5>
	<br>
	<a href="userMain.jsp" class="badge badge-info">Back To Main</a>
</div>

</body>
</html>