<%@ page language="java" import="com.hit.model.*" contentType="text/html; charset=windows-1255" pageEncoding="windows-1255"%>
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
  <title>BMI Calculator</title>
  
  <style>
  #checkbox-container {
  margin-top: 10px;
  width: 400px;
  }
  b {
  font-weight: bold;
  color : blue;
  }
  </style>
  
  <%-- Calculation and presentation of a BMI graph --%>
  <script type="text/javascript">
  <%User user = (User)session.getAttribute("loginUser");%>
  var w = <%=user.getWeight()%>;
  var h = <%=user.getHeight()%>;
  var bmiValue = Math.round(w / Math.pow(h, 2) * 10000);
  
  FusionCharts.ready(function() {
	  var showCheckBox = document.getElementById('showCB'),
	  posCheckBox = document.getElementById('positionCB'),
	  cpuGauge = new FusionCharts({
		  type: 'hlineargauge',
		  renderAt: 'chart-container',
		  width: '270',
		  height: '150',
		  dataFormat: 'json',
		  dataSource: {
			  "chart": {
		      "theme": "fusion",
		      "caption": "Your BMI",
		      "subcaptionFontBold": "0",
		      "lowerLimit": "0",
		      "upperLimit": "100",
		      "chartBottomMargin": "20",
		      "captionPadding": "10",
		      "valueAbovePointer": "0",
		      "valueFontSize": "13",
		      "valueFontBold": "0",
		      "gaugeFillMix": "{light-10},{light-70},{dark-10}",
		      "gaugeFillRatio": "40,20,40"
		      },
		      "colorRange": {
		    	  "color": [{
		    		  "minValue": "0",
		              "maxValue": "18.5",
		            	  "code": "#66e6f0"
		            },
		            {
		              "minValue": "18.9",
		              "maxValue": "24.9",
		            	  "code": "#62B58F"
		            },
		            {
		              "minValue": "25",
		              "maxValue": "29.9",
		            	  "code": "#FFC533"
		            },
		            {
					"minValue": "30",
			        "maxValue": "100",
			        "code": "#F2726F"
		            }
		          ]
		        },
		        "pointers": {
		        	"pointer": [{
		            "value": bmiValue
		            }]
		        }
		        }
	  })
	  .render();

	  //Set event listener for check boxes
	  showCheckBox.addEventListener && showCheckBox.addEventListener("click", showValue);
	  posCheckBox.addEventListener && posCheckBox.addEventListener("click", setPosition);

	  //Function to show hide value
	  function showValue(evt, obj) {
		  //Using showValue attribute to show hide pointer value
		  if (showCB.checked) {
		      cpuGauge.setChartAttribute('showValue', 1);
		      posCheckBox.disabled = false;
		    } 
		  else {
		      cpuGauge.setChartAttribute('showValue', 0);
		      posCheckBox.disabled = true;
		    }
		  }
	  //Function to change value pointer
	  function setPosition(evt, obj) {
		  //Using valueAbovePointer attribute to toggle position of pointer value 
		  (posCheckBox.checked) ? cpuGauge.setChartAttribute('valueAbovePointer', 1):
			  cpuGauge.setChartAttribute('valueAbovePointer', 0);
		  }
	  });
</script>
	
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
          		<%out.println(user.getUserName()); %>
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

<%-- User profile and graph content --%>
<div align="center">
<h1>BMI Coalculator</h1>
<img class="mb-4" src="icon/iconBMI.svg" alt="" width="72" height="72">
<div>
	<h2><b style="color:black">Your profile is: </b></h2>
	<br>
	<%//out.println(bmiValue);%>
	
	<h4>UserName: <b><% out.println(user.getUserName()); %></b></h4>
	<h4>Weight: <b><% out.println(user.getWeight());  %>Kg</b></h4>
	<h4>Height: <b><% out.println(user.getHeight());  %>Cm</b></h4>
	<br>
	<%-- Graph using with FusionCharts --%>
	<div id="chart-container">FusionCharts will render here</div>
	<div id="checkbox-container">
		<span style="color:#66e6f0">Low </span><span style="color:#62B58F">Normal </span>
		<span style="color:#FFC533">Overweight </span><span style="color:#F2726F">Obese</span><br>
		<input type="checkbox" id="showCB" name="padding" value="1" checked>Show Value<br>
		<input type="checkbox" id="positionCB" name="padding" value="2">Place Value Above Pointer
	</div>
	<br>
	<a href="userMain.jsp" class="badge badge-info">Back To Main</a>
</div>
</div>

</body>
</html>
