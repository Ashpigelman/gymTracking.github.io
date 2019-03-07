<%@ page language="java" contentType="text/html; charset=windows-1255" pageEncoding="windows-1255"%>
<!DOCTYPE html>
<html lang="en">
<head>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/view/jquery/jquery-3.3.1.slim.min.js"></script>
  <script src="js/view/popper/popper.min.js"></script>
  <script src="js/view/bootstrap/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/sliderUser.js"></script>
  <title>Registration</title>
</head>

<body>
<%-- Registration content --%>
<div class="container" align="center">
	<div>
		<h2>Registration</h2>
		<img class="mb-4" src="icon/regIcon.svg" alt="" width="72" height="72">
	</div>
	
	<div>
		<h3>Enter your details:</h3>
	</div>
	<div>
		<%-- Form of registration --%>
  		<form action="http://localhost:8080/WebGymTracking/GymTrackingController" method="post">
  		<h4 style="color:red; font-weight:bold;"><%if(request.getAttribute("message") != null)
            out.write((String)request.getAttribute("message")); %></h4>
	  	<input type="hidden" name="command" value="registration">
	  	
	  	<%-- Input to UserName --%>
	  	<div class="form-group">
	  		<label for="userName">Username:</label>
            <input type="text" class="form-control" name="userName" placeholder="Enter username">
        </div>

	  	<%-- Input to Password --%>
		<div class="form-group">
			<label for="password">Password:</label>
            <input type="password" class="form-control" name="password" placeholder="Enter password">
        </div>
            
         <%-- Input to Re-Password --%>
         <div class="form-group">
         	<label for="rePassword">Re-Password:</label>
         	<input type="password" class="form-control" name="rePassword" placeholder="Enter password">
         </div>
          
         <%-- Input to Weight --%>
         <div class="form-group">
         	<label for="weight">Weight:</label>
			<div align="center">
             	<input type="number" size="3" step="1" min="30" max="150" placeholder="90" id="inputWeight" >
            </div>
			<input type="range" id="sliderWeight" class="custom-range" name="weight" value="90" min="30" max="150" />
         </div>
            
         <%-- Input to Height --%>
         <div class="form-group">
        	<label for="height">Height:</label>
          	<div align="center">
             	<input type="number" size="3" step="1" min="100" max="250" placeholder="150" id="inputHeight" >
            </div>
            <input type="range" id="sliderHeight" class="custom-range" name="height" value="150" min="100" max="250" />
          </div>
         	          
          <input type="submit" class="btn btn-outline-warning" name="command" value="registration" ><br>
          <a href="login.jsp" class="badge badge-light" role="button" aria-pressed="true">Back to login</a><br>
    </form>
  	</div>
</div>

</body>
</html>