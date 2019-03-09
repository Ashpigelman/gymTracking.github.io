<%@ page language="java" import="com.hit.model.*,com.hit.controller.*" contentType="text/html; charset=windows-1255" pageEncoding="windows-1255"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/view/jquery/jquery-3.3.1.slim.min.js"></script>
  <script src="js/view/popper/popper.min.js"></script>
  <script src="js/view/bootstrap/bootstrap.min.js"></script>
  <title>User Main</title>
</head>

<body>
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
        		<form action="/WebGymTracking/GymTrackingController" method="get">
            	<input type="hidden" name="command" value="logout" >
            	<input class="btn btn-danger" type="submit" value="logout">
        		</form>
      		</li>
    	</ul>
  	</div>
</nav>

<%-- MAIN content --%>
<div align="center">
<br>
<h4 style="color:green; font-weight:bold;"><%if(request.getAttribute("message") != null)
            out.write((String)request.getAttribute("message")); %></h4>
	<br>
	<%-- Select options --%>
	<a href="addActive.jsp" class="btn btn-outline-primary btn-lg btn-block" role="button" aria-pressed="true">Add New Activity</a><br>
	<a href="userActivities.jsp" class="btn btn-outline-info btn-lg btn-block" role="button" aria-pressed="true">My Activities Table</a><br>
	<a href="BMICalculator.jsp" class="btn btn-outline-warning btn-lg btn-block" role="button" aria-pressed="true">BMI Calculator</a><br>
	<form action="/WebGymTracking/GymTrackingController" method="get">
		<input type="hidden" name="command" value="logout" >
        <input class="btn btn-outline-danger btn-lg btn-block" type="submit" value="logout">
    </form>
    <br>
    <%-- Share a site to that user Facebook page --%>
    <iframe src="https://www.facebook.com/plugins/share_button.php?href=http://www.WebGymTracking.com/&layout=button&size=small&mobile_iframe=true&width=60&height=20&appId" width="60" height="20" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"></iframe>
</div>
</body>

</html>
