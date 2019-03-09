<%@ page language="java" import="com.hit.model.*"  contentType="text/html; charset=windows-1255"
    pageEncoding="windows-1255"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/view/jquery/jquery-3.3.1.slim.min.js"></script>
  <script src="js/view/popper/popper.min.js"></script>
  <script src="js/view/bootstrap/bootstrap.min.js"></script>
  <title>Update Activity</title>
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
	<%-- Active update form   --%>
	<form action="http://localhost:8080/WebGymTracking/GymTrackingController" method="get">
		<h4>Updating the training</h4>		
		 <br>
		 <%-- Choose a day to change --%>
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
		
		<%-- Change the quantity of sets --%>
		<div class="form-group">
             <label for="numberOfSets">Sets:</label>
             <div align="center">
             <input type="number" size="2" step="1" min="1" max="50" placeholder="5" id="inputSets" >
             </div>
             <input type="range" id="sliderSets" class="custom-range" name="newNumberOfSets" value="5" min="1" max="50"/>
        </div>

		<%-- Change the quantity of reps --%>
        <div class="form-group">
             <label for="numberOfReps">Reps:</label>
             <div align="center">
             <input type="number" size="2" step="1" min="5" max="100" placeholder="20" id="inputRets" >
             </div>
             <input type="range" id="sliderReps" class="custom-range" name="newNumberOfReps" value="20" min="5" max="100" />
        </div>
        
		<input class="btn btn-primary" type="submit" name="command" value="updateActivity"><br>
		<a href="userActivities.jsp" class="badge badge-light" role="button" aria-pressed="true">Return to table</a><br>
	</form>
	<script>
	var sliderSets = document.getElementById("sliderSets");
	var sliderReps = document.getElementById("sliderReps");
	var inputSets = document.getElementById("inputSets");
	var inputReps = document.getElementById("inputRets");

	///value updation from input to slider
	//function input update to slider
	function sliderSetsInput(){//input udate slider Sets
		sliderSets.value = inputSets.value;
	}
	function sliderRepsInput(){//input update slider Reps
		sliderReps.value = (inputReps.value);
	}

	//calling function on change of inputs to update in slider
	inputSets.addEventListener("change",sliderSetsInput);
	inputReps.addEventListener("change",sliderRepsInput);

	///value updation from slider to input
	//functions to update from slider to inputs 
	function inputSetsSliderSets(){//slider update inputs
	   inputSets.value = sliderSets.value;
	}
	function inputRepsSliderReps(){//slider update inputs
	   inputReps.value = sliderReps.value;
	}
	sliderSets.addEventListener("change",inputSetsSliderSets);
	sliderReps.addEventListener("change",inputRepsSliderReps);
	</script>
</div>

</body>
</html>
