<%@ page language="java" import="com.hit.model.*,com.hit.controller.*,java.util.*" contentType="text/html; charset=windows-1255"
    pageEncoding="windows-1255"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/view/jquery/jquery-3.3.1.slim.min.js"></script>
  <script src="js/view/popper/popper.min.js"></script>
  <script src="js/view/bootstrap/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/fusioncharts/fusioncharts.js"></script>
  <script type="text/javascript" src="js/fusioncharts/fusioncharts.theme.fusion.js"></script>
  <title>Graph Activity</title>
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


<script type="text/javascript">
<%List<Activity> userActivity = (List<Activity>)session.getAttribute("userActivity");//Gets activity list of user
request.setAttribute("activityList", userActivity);
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
%>
var sunday = <%=days[0] %>,
monday = <%=days[1] %>,
tuesday = <%=days[2] %>,
wednesday = <%=days[3] %>,
thursday = <%=days[4] %>,
friday = <%=days[5] %>
saturday = <%=days[6] %>;
FusionCharts.ready(function(){//function of the graph
	var fusioncharts = new FusionCharts({
		type: 'column2d',
		renderAt: 'chart-container',
		width: '100%',
		height: '100%',
		dataFormat: 'json',
		dataSource: {
			// Chart Configuration
			"chart": {
				"caption": "Activity Graph",
            	"subCaption": "Order by days",
            	"xAxisName": "Days",
            	"yAxisName": "Quantity Activity",
            	"numberSuffix":"",
            	"theme": "fusion",
            	},
            	// Chart Data
            	"data": [{
            	"label": "Sun",
            	"value": sunday
            	}, {
            	"label": "Mon",
            	"value": monday
        		}, {
            	"label": "Tue",
            	"value": tuesday
        		}, {
            	"label": "Wed",
            	"value": wednesday
        		}, {
            	"label": "Thu",
            	"value": thursday
        		}, {
            	"label": "Fri",
            	"value": friday
        		}, {
            	"label": "Sat",
           		"value": saturday
        	}]
    	}
	});
	fusioncharts.render();
	});
</script>

<%-- Displays the graph by days --%>
<div align="center">
	<h3>Your graph :</h3>
	<img class="mb-4" src="icon/iconGraph.svg" alt="" width="72" height="72">
	<br>
	<p> Here you can see your graph activity order by days:</p>
	<%-- Graph using with FusionCharts --%>
	<div id="chart-container">FusionCharts XT will load here!</div>
	<br>
	<a href="userActivities.jsp" class="badge badge-secondary">Back To User Activities</a>
</div>

</body>
</html>
