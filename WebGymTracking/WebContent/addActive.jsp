<%@ page language="java" import="com.hit.model.*,com.hit.controller.*,java.util.*" contentType="text/html; charset=windows-1255"
    pageEncoding="windows-1255"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/view/jquery/jquery-3.3.1.slim.min.js"></script>
  <script src="js/view/popper/popper.min.js"></script>
  <script src="js/view/bootstrap/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/sliderActive.js"></script>  
  <title>Add Active</title>
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

<%-- The content of the Add Active page --%>
<div class="container">
<br>
<div align="center">
	<img class="mb-4" src="icon/iconAddActives.svg" alt="" width="72" height="72">
</div>
<p>Here you can add your activity, you must choose several sets and reps.</p>
<h5 style="color:red; font-weight:bold;"><%if(request.getAttribute("message") != null)
	out.write((String)request.getAttribute("message")); %></h5>
<h4>add new Active:</h4>
		<%-- Form of adding --%>
        <form action="http://localhost:8080/WebGymTracking/GymTrackingController" method="post">     
        	<div>
        	<%-- Select type --%>
            <label for="mySelect">Select a new active from the list:</label>
            <select class="selectpicker" data-style="btn-primary" id="mySelect" name="mySelect">
              <optgroup label="Back">
              <option value="Deadlift with rod">Deadlift with rod</option>
              <option value="Narrow rowing in the machine">Narrow rowing in the machine</option>
              <option value="Horizontal bar">Horizontal bar</option>
              </optgroup>
              <optgroup label="Shoulders">
              <option value="A standing shoulder press with a rod">A standing shoulder press with a rod</option>
              <option value="A shrug of the shoulders with weights">A shrug of the shoulders with weights</option>
              </optgroup>
              <optgroup label="Chest">
              <option value="Bench press">Bench press</option>
              <option value="Breast butterfly with weights">Breast butterfly with weights</option>
              <option value="Pushups">Pushups</option>
              </optgroup>
              <optgroup label="Hands">
              <option value="Bends and elbow">Bending the elbows with standing rod</option>  
              <option value="One-Arm Dumbbell Row">One-Arm Dumbbell Row</option>
              <option value="Kick Back">Kick Back</option>
              <option value="Pulling elbows in sitting with weights">Pulling elbows in sitting with weights</option>  
              </optgroup>
              <optgroup label="Stomach">
              <option value="Static stomach/Plank">Static stomach/Plank</option>
              <option value="Crunches">Crunches</option>
              </optgroup>
              <optgroup label="Legs">
              <option value="Deadlift">Deadlift</option>
              <option value="Squat">Squat</option>
              <option value="Foot-pressing exercise against a machine">Foot-pressing exercise against a machine</option>
              </optgroup>
            </select>
            </div>
            
            <br>
            <%-- Choose a day --%>
            <div class="radio">
                <label for="myRadio">Choose the day you want to practice:</label><br>
                <input type="radio" name="myRadio" id="myRadio" value="Sunday" checked><label>Sunday</label><br>
				<input type="radio" name="myRadio" id="myRadio" value="Monday"><label>Monday</label><br>
				<input type="radio" name="myRadio" id="myRadio" value="Tuesday"><label>Tuesday</label><br>
				<input type="radio" name="myRadio" id="myRadio" value="Wednesday"><label>Wednesday</label><br>
				<input type="radio" name="myRadio" id="myRadio" value="Thursday"><label>Thursday</label><br>
				<input type="radio" name="myRadio" id="myRadio" value="Friday"><label>Friday</label><br>
				<input type="radio" name="myRadio" id="myRadio" value="Saturday"><label>Saturday</label><br>
            </div>
            <br>
                   
            <%-- Quantity Sets --%> 
            <div class="form-group">
             	<label for="numberOfSets">Sets:</label>
             	<div align="center">
             	<input type="number" size="2" step="1" min="1" max="50" placeholder="5" id="inputSets" >
             	</div>
             	<input type="range" id="sliderSets" class="custom-range" name="numberOfSets" value="5" min="1" max="50"/>
            </div>

			<%-- Quantity Reps --%>
            <div class="form-group">
             	<label for="numberOfReps">Reps:</label>
             	<div align="center">
             	<input type="number" size="2" step="1" min="5" max="100" placeholder="20" id="inputRets" >
             	</div>
             	<input type="range" id="sliderReps" class="custom-range" name="numberOfReps" value="20" min="5" max="100" />
            </div>
            
            <div align="center">
            <input type="submit" class="btn btn-primary" name="command" value="addActive"><br>
            <a href="userMain.jsp" class="badge badge-info" role="button" aria-pressed="true">Back to Main</a>  
            </div>

      </form>
      
</div>
</body>
</html>