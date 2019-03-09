<%@ page language="java" import="com.hit.model.*,com.hit.controller.*,java.util.*" contentType="text/html; charset=windows-1255"
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
  <title>Training Table By Day</title>
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


<div class="jumbotron" align="center">
    <h2 class="display-4">Training Table</h2>
    <img class="mb-4" src="icon/iconUserActivities.svg" alt="" width="72" height="72">
    <p class="lead">Here you can see all your activities, <b><% out.println(user.getUserName()); %></b>.
    <br>You can update or delete your activities.
    <br>Number of sessions are: <b><% out.println(ServletListenerCounter.getSessionCounter()); %></b></p>
    <hr class="my-4">
    <h5 style="color:green; font-weight:bold;"><%if(request.getAttribute("message") != null)
            out.write((String)request.getAttribute("message")); %></h5>
     <a class="btn btn-primary btn-lg" href="addActive.jsp" role="button">Add Activity</a>     
     <a class="btn btn-info btn-lg" href="userMain.jsp" role="button">Back to Main</a>  
     <br>  
     <a class="btn btn-outline-warning btn-lg" href="userActivities.jsp" role="button">Show my training table</a> 
</div>

<%-- Table contents --%>
<div class="container">
	<table class="table">
		<thead class="thead-dark">
        <tr>
        	<th scope="col">Days</th>
            <th scope="col">Quantity</th>
        </tr>
        </thead>
        <%
        List<Activity> userActivity = (List<Activity>)session.getAttribute("userActivity");//Gets activity list of user
        request.setAttribute("activityList", userActivity);
        if(userActivity.isEmpty()) {
        	out.println("<tbody><tr><th scope='row'></th><td colspan='2'><b>You have no activities, start adding.</b></td></tr></tbody>");
        }
        else {
        	String nameOfDays[] = {"Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"};
        	int days[] = new int[7];//An array of days
        	for(Activity activity : userActivity)//Count of days
        	{
        		String day = activity.getTrainingDay();
        		if(day.equals("Sunday"))
        			days[0]++;
        		else if(day.equals("Monday"))
        			days[1]++;
        		else if(day.equals("Tuesday"))
        			days[2]++;
        		else if(day.equals("Wednesday"))
        			days[3]++;
        		else if(day.equals("Thursday"))
        			days[4]++;
        		else if(day.equals("Friday"))
        			days[5]++;
        		else if(day.equals("Saturday"))
        			days[6]++;
            }
        	
        	for(int j=0 ; j < 7 ; j++)//Prints the amount of training on any given day
        	{
        		out.println(
                "<tbody><tr><th scope='row'>"+nameOfDays[j]+"</th>"+
                "<td>"+ days[j] +
                "</td></tr><tbody>");
        	}

        }
        %>
    </table>
     
    <br>
    <div align="center">
        <a class="btn btn-warning btn-lg" href="graphActivity.jsp" role="button">To show graph activity order by days</a> 
    </div>
    <br>
</div>
    
</body>
</html>
