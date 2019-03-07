<%@ page language="java" import="com.hit.model.*" contentType="text/html; charset=windows-1255"
    pageEncoding="windows-1255"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/view/jquery/jquery-3.3.1.slim.min.js"></script>
  <script src="js/view/popper/popper.min.js"></script>
  <script src="js/view/bootstrap/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/sliderUser.js"></script>
  <title>Update Weight And Height</title>
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
        		<form action="http://localhost:8080/WebGymTracking/GymTrackingController" method="get">
            	<input type="hidden" name="command" value="logout" >
            	<input class="btn btn-danger" type="submit" value="logout">
        		</form>
      		</li>
    	</ul>
  	</div>
</nav>

<div class="container">
	<h3>Please update your Weight and Height:</h3>
	<%-- Form of update the weight and height of the user --%>
	<form action="http://localhost:8080/WebGymTracking/GymTrackingController" method="post">
  	<%
  	int valueWeight = user.getWeight();//The weight of the user
  	int valueHeight = user.getHeight();//The height of the user
  	%>
  		<%-- Input to change weight --%>
  		<div class="form-group">
			<label for="weight">Weight:</label>
			<div align="center">
            	<input type="number" size="2" step="1" min="30" max="150" placeholder="<%= valueWeight %>" id="inputWeight" >
            </div>
			<input type="range" id="sliderWeight" class="custom-range" name="newWeight" value="<%= valueWeight %>" min="30" max="150" />
        </div>
            
        <%-- Input to change height --%>
        <div class="form-group">
        	<label for="height">Height:</label>
        	<div align="center">
            	<input type="number" size="2" step="1" min="100" max="250" placeholder="<%= valueHeight %>" id="inputHeight" >
            </div>
            <input type="range" id="sliderHeight" class="custom-range" name="newHeight" value="<%= valueHeight %>" min="100" max="250" />
        </div>
         
         <div align="center">
         <input type="submit" class="btn btn-light" name="command" value="updateWeightAndHeight" ><br> 
         <a href="userMain.jsp" class="badge badge-info" role="button" aria-pressed="true">Back to Main</a>        
         </div>
    </form>
</div>

</body>
</html>