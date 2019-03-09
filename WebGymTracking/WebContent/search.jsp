<%@ page language="java" import="com.hit.model.*" contentType="text/html; charset=windows-1255" pageEncoding="windows-1255"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/view/jquery/jquery-3.3.1.slim.min.js"></script>
  <script src="js/view/popper/popper.min.js"></script>
  <script src="js/view/bootstrap/bootstrap.min.js"></script>
  <title>Search</title>
  <style>
  h4{
  color:red
  }
  em {
  font-style: normal;         /* Removes italics */
  text-decoration: underline; /* Makes underline */
  }
  </style>
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


<div align="center">
	<img class="mb-4" src="icon/iconSearch.svg" alt="" width="72" height="72"><br>
	<%-- Button trigger modal --%>
	<h4><em>Back</em></h4>
	<button type="button" class="btn btn-outline-light text-dark" data-toggle="modal" data-target="#DeadliftWithRod">Deadlift with rod</button><br><br>
	<button type="button" class="btn btn-outline-light text-dark" data-toggle="modal" data-target="#NarrowRowingInTheMachine">Narrow rowing in the machine</button><br><br>
	<button type="button" class="btn btn-outline-light text-dark" data-toggle="modal" data-target="#HorizontalBar">Horizontal bar</button><br><br>
	<h4><em>Shoulders</em></h4><br>
	<button type="button" class="btn btn-outline-light text-dark" data-toggle="modal" data-target="#AStandingShoulderPressWithARod">A standing shoulder press with a rod</button><br><br>
	<button type="button" class="btn btn-outline-light text-dark" data-toggle="modal" data-target="#AShrugOfTheShouldersWithWeights">A shrug of the shoulders with weights</button><br><br>
	<h4><em>Chest</em></h4><br>
	<button type="button" class="btn btn-outline-light text-dark" data-toggle="modal" data-target="#BenchPress">Bench press</button><br><br>
	<button type="button" class="btn btn-outline-light text-dark" data-toggle="modal" data-target="#BreastButterfly with weights">Breast butterfly with weights</button><br><br>
	<button type="button" class="btn btn-outline-light text-dark" data-toggle="modal" data-target="#Pushups">Pushups</button><br><br>
	<h4><em>Hands</em></h4><br>
	<button type="button" class="btn btn-outline-light text-dark" data-toggle="modal" data-target="#BendingTheElbowsWithStandingRod">Bending the elbows with standing rod</button><br><br>
	<button type="button" class="btn btn-outline-light text-dark" data-toggle="modal" data-target="#One-ArmDumbbellRow">One-Arm Dumbbell Row</button><br><br>
	<button type="button" class="btn btn-outline-light text-dark" data-toggle="modal" data-target="#KickBack">Kick Back</button><br><br>
	<button type="button" class="btn btn-outline-light text-dark" data-toggle="modal" data-target="#PullingElbowsInSittingWithWeights">Pulling elbows in sitting with weights</button><br><br>
	<h4><em>Stomach</em></h4><br>
	<button type="button" class="btn btn-outline-light text-dark" data-toggle="modal" data-target="#StaticStomachPlank">Static stomach/Plank</button><br><br>
	<button type="button" class="btn btn-outline-light text-dark" data-toggle="modal" data-target="#Crunches">Crunches</button><br><br>
	<h4><em>Legs</em></h4><br>
	<button type="button" class="btn btn-outline-light text-dark" data-toggle="modal" data-target="#Deadlift">Deadlift</button><br><br>
	<button type="button" class="btn btn-outline-light text-dark" data-toggle="modal" data-target="#Squat">Squat</button><br><br>
	<button type="button" class="btn btn-outline-light text-dark" data-toggle="modal" data-target="#Foot-pressingExerciseAgainstAMachine">Foot-pressing exercise against a machine</button><br><br>
	<a href="userMain.jsp" class="badge badge-info" role="button" aria-pressed="true">Back to Main</a>     
</div>

<%-- Explanations of the Modals --%>
<div class="modal fade" id="DeadliftWithRod" tabindex="-1" role="dialog" aria-labelledby="DeadliftWithRod" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="DeadliftWithRod">Deadlift with rod</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        Deadlift is a weight training exercise in which an Olympic pole is lifted from 
        the floor in a position where the legs are bent and the back straight. 
        Deadlift is a complex exercise that improves the grip of the hands, and works mainly on the muscles of the 
        back of the back,the large buttock muscle, the large mitochondrial muscle, the muscles of the hamstring,
        the quadriceps and the soles of the sole.
        <br> <br> <b> Tip: </b>  1 set of 5 reps once a week.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="addActive.jsp" role="button">Add Active</a> 
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="NarrowRowingInTheMachine" tabindex="-1" role="dialog" aria-labelledby="NarrowRowingInTheMachine" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="NarrowRowingInTheMachine">Narrow rowing in the machine</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      One of the base exercises whose primary purpose is to work on the broad top (Latissimus Dorsi).
      The rowing begins and ends on the floor at each repetition [like deadlift]
      and does not end when the weight is suspended in the air with the hands straight.
      <br> <br> <b> Tip:</b> Perform 6-1 high intensity repetitions, with 3-5 minutes rest between the sets.
      <br> <b> Note: </b>Stretching is recommended at the end of the exercise.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="addActive.jsp" role="button">Add Active</a> 
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="HorizontalBar" tabindex="-1" role="dialog" aria-labelledby="HorizontalBar" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="HorizontalBar">Horizontal bar</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      Stress is a fitness facility consisting of a horizontal bar that is far from the ground.
      The purpose of the facility is to allow the user to hang on it and lift it with his help,
      while activating the muscles of the hands, back and abdomen.
      The accepted style of tension is to hang on to it while holding on to 
      the hands and without touching the ground,and making ups and downs without the legs' help, so that 
      the chin's lift passes the rod, and the descent is up to the alignment of the hands.
      <br> <br> <b> Tip:</b> 3 sets of 6 reps with a minute to 2 minutes rest with maximum weight.
      <br> <b>Perform 6 repetitions of tension and feel easy for you? </b> 
      <br>Add weight in the form of a handweight between your legs.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="addActive.jsp" role="button">Add Active</a> 
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="AStandingShoulderPressWithARod" tabindex="-1" role="dialog" aria-labelledby="AStandingShoulderPressWithARod" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="AStandingShoulderPressWithARod">A standing shoulder press with a rod</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      A shoulder press is designed for deep work on the front and middle heads of the delta muscle.
      Through it you increase the mass and strength of all the muscles around the shoulder joint.
      <br> <br> <b> Tip:</b> Perform 2-4 sets of 7-12 repetitions.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="addActive.jsp" role="button">Add Active</a> 
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="AShrugOfTheShouldersWithWeights" tabindex="-1" role="dialog" aria-labelledby="AShrugOfTheShouldersWithWeights" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="AShrugOfTheShouldersWithWeights">A shrug of the shoulders with weights</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      A shoulder press is designed for deep work on the front and middle heads of the delta muscle.
      Through it you increase the mass and strength of all the muscles around the shoulder joint.
      <br> <br> <b> Tip:</b> Perform 2-4 sets of 7-12 repetitions.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="addActive.jsp" role="button">Add Active</a> 
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="BenchPress" tabindex="-1" role="dialog" aria-labelledby="BenchPress" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="BenchPress">Bench press</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      The bench press is a great exercise for anyone looking to gain muscle size and strength in the upper body.
      This exercise is known as a compound exercise, meaning it involves multiple joints, and therefore 
      multiple major muscle groups to execute.
      <br> <br> <b> Tip:</b> Perform 3-5 sets of 7-12 repetitions.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="addActive.jsp" role="button">Add Active</a> 
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="BreastButterflyWithWeights" tabindex="-1" role="dialog" aria-labelledby="BreastButterflyWithWeights" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="BreastButterflyWithWeights">Breast butterfly with weights</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      A breast butterfly in the machine is an effective exercise to sharpen the chest muscles.
      Exercise contributes to the chest appearance "rough".
      <br> <br> <b> Tip:</b> Perform 3-4 sets of 8-15 repetitions. 
      <br>Before that, regular breast training should be performed. 
      <br>The exercise is suitable for trainees at all levels.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="addActive.jsp" role="button">Add Active</a> 
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="Pushups" tabindex="-1" role="dialog" aria-labelledby="Pushups" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="Pushups">Pushups</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      Push-ups is a physical exercise exercise, based on applying the entire body's strength to the elbows and legs.
      The gymnast straightens his elbows while pushing the body upwards.Push-ups are designed to strengthen 
      the muscles of the hands (triceps), back, shoulder (delta muscle) and chest (large chest muscle).
      <br> <br> <b> Tip:</b> Perform 3 sets of 15 repetitions. rest of 30-60 seconds between each set.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="addActive.jsp" role="button">Add Active</a> 
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="BendingTheElbowsWithStandingRod" tabindex="-1" role="dialog" aria-labelledby="BendingTheElbowsWithStandingRod" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="BendingTheElbowsWithStandingRod">Bending the elbows with standing rod</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      his exercise works on the biceps of the hand. The muscle participates in all 
      movements that combine hand-pulling towards the body. 
      In addition, this is the most effective exercise toincrease the strength and volume of the hand.
      <br> <br> <b> Tip: </b>  2-3 set of 8-12 reps.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="addActive.jsp" role="button">Add Active</a> 
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="One-ArmDumbbellRow" tabindex="-1" role="dialog" aria-labelledby="One-ArmDumbbellRow" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="One-ArmDumbbellRow">One-Arm Dumbbell Row</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      his exercise targets the upper and lower back, shoulders, biceps, and hips while improving core stability.
      Five different joint actions take place in this compound exercise.Beginners can use light weights as they build strength.
      This is also a good exercise to do as part of a circuit training routine.
      <br> <br> <b> Tip: </b>  2-3 set of 8-12 reps.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="addActive.jsp" role="button">Add Active</a> 
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="KickBack" tabindex="-1" role="dialog" aria-labelledby="KickBack" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="KickBack">Kick Back</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      Purpose of the exercise: Strengthening The triceps muscle (the back of the arm). 
      The rear hand muscle is a very large muscle in the hand and it assembles most of the hand mass.
      It is located at the back of the hand and is responsible for the movement of the elbow alignment.
      <br> <br> <b> Tip: </b>  3 set of 20 reps once a week.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="addActive.jsp" role="button">Add Active</a> 
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="PullingElbowsInSittingWithWeights" tabindex="-1" role="dialog" aria-labelledby="PullingElbowsInSittingWithWeights" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="PullingElbowsInSittingWithWeights">Pulling elbows in sitting with weights</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      The best aim of the exercise is tosharpen it and  increase the strength of the biceps muscle.
      Full shoulder flexion should beallowed to allow full hand pulling. It should be noted that the brace 
      (if any) will not be too high and will prevent the weight of the hand from being fully lowered.
      <br> <br> <b> Tip: </b>  3-4 set of 8-12 reps once a week.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="addActive.jsp" role="button">Add Active</a> 
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="StaticStomachPlank" tabindex="-1" role="dialog" aria-labelledby="StaticStomachPlank" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="StaticStomachPlank">Static stomach/Plank</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      A static stomach is a power exercise that involves staying in a static position. 
      The most common plank is a front plank, which stays in a push-up position when the body weight is carried on the arms, elbows and toes.
      The plank strengthens the abdominal muscles, back and shoulders.
      <br> <br> <b> Tip:</b> Perform 4 sets. 60 seconds in the first set, 50 seconds in the second, 40 seconds in the third, 
      30 seconds in the fourth. rest of 45 seconds between each set.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="addActive.jsp" role="button">Add Active</a> 
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="Crunches" tabindex="-1" role="dialog" aria-labelledby="Crunches" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="Crunches">Crunches</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      Crunches is a physical exercise exercise, based on activating the mass of the upper body on the abdominal muscle.
      Crunches are designed to strengthenthe abdominal muscles. Exercise is one of the popular 
      exercises because it can be done anywhere and without special equipment.
      <br> <br> <b> Tip:</b> Perform 55 sets of 40 repetitions. rest of 30-60 seconds between each set.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="addActive.jsp" role="button">Add Active</a> 
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="Deadlift" tabindex="-1" role="dialog" aria-labelledby="Deadlift" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="Deadlift">Deadlift</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      Deadlift is a weight training exercise in which an Olympic pole is lifted from the floor in a position where the legs 
      are bent and the back straight.Deadlift is a complex exercise that improves the grip of the hands, and 
      works mainly on the muscles of the back of the back, the large buttock muscle, the large mitochondrial muscle, 
      the muscles of the hamstring, the quadriceps and the soles of the sole.
      <br> <br> <b> Tip: </b>  1 set of 5 reps once a week.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="addActive.jsp" role="button">Add Active</a> 
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="Squat" tabindex="-1" role="dialog" aria-labelledby="Squat" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="Squat">Squat</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      A squat is a complex multi-joint exercise that, when performed, activates the ankle joint, knee, and thigh.
      As a result of this activity, the body mobilizes a large number of muscles, in fact, almost all 
      the muscles in the body . The exercise shapes the muscles of the legs and buttocks.
      <br> <br> <b> Tip: </b>  4 set of 6 reps.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="addActive.jsp" role="button">Add Active</a> 
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="Foot-pressingExerciseAgainstAMachine" tabindex="-1" role="dialog" aria-labelledby="Foot-pressingExerciseAgainstAMachine" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="Foot-pressingExerciseAgainstAMachine">Foot-pressing exercise against a machine</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      The exercise is performed using power machines. In this exercise there are three agonists, the buttocks, the quadriceps and 
      the sinus muscles, and three joints  involved in the exercise,the hip joint, the knee joint, and the ankle joint.
      <br> <br> <b> Tip: </b>  4 set of 15 reps.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a class="btn btn-primary" href="addActive.jsp" role="button">Add Active</a> 
      </div>
    </div>
  </div>
</div>

</body>
</html>
