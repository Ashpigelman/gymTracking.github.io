<%@ page language="java" contentType="text/html; charset=windows-1255" pageEncoding="windows-1255"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/view/jquery/jquery-3.3.1.slim.min.js"></script>
  <script src="js/view/popper/popper.min.js"></script>
  <script src="js/view/bootstrap/bootstrap.min.js"></script>
  <title>Login</title>
</head>

<body>
<%-- Content of the login --%>
<div class="container" align="center">
    <div>
        <h1>Sign In</h1>
    </div>
    <div>
    	<%-- Form of login  --%>
    	<form action="/WebGymTracking/GymTrackingController" method="post">
        <br>
        <img class="mb-4" src="icon/iconLogin.svg" alt="" width="72" height="72">
        <h4 style="color:red; font-weight:bold;"><%if(request.getAttribute("message") != null)
            out.write((String)request.getAttribute("message")); %></h4>
            <input type="hidden" name="command" value="login">
            <%-- Using JSP TAG --%>
            <%@ taglib uri ="/WEB-INF/tag.tld" prefix="test" %>
            <test:helloTag/>
            <br>
            <h2>Please sign in</h2>
            <br>
            
            <%-- UserName input --%>
            <div class="input-group mb-3">
            	<div class="input-group-append">
        		<img class="mb-4" src="icon/userIcon.svg" alt="" width="32" height="32">
            	</div>
                <input type="text" class="form-control" name="userName" placeholder="Username">
			</div>
			
			<%-- Password input --%>
			<div class="input-group mb-2">
				<div class="input-group-append">
        		<img class="mb-4" src="icon/keyIcon.svg" alt="" width="32" height="32">
				</div>
                <input type="password" class="form-control" name="password" placeholder="Password">
			</div>
            <br>
            <input type="submit" name="command" value="login" class="btn btn-success"><br>
            <a href="registration.jsp" class="badge badge-warning" role="button" aria-pressed="true">Creat your GymTracking account</a><br>
        </form>
     </div>
</div>

</body>
</html>
