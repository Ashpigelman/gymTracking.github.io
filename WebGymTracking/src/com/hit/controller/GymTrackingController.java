package com.hit.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hit.model.Activity;
import com.hit.model.ExceptionGymDAO;
import com.hit.model.HibernateGymDAO;
import com.hit.model.IGymDAO;
import com.hit.model.User;

/**
 * Servlet implementation class GymTrackingController
 */
@WebServlet("/GymTrackingController/*")
public class GymTrackingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IGymDAO gymTracking = HibernateGymDAO.getInstance();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GymTrackingController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getPathInfo();
		String theCommand = request.getParameter("command");
		List<Activity> userActivity = null;
		//RequestDispatcher dispatcher = null;
		User newUser = null;
		HttpSession session = request.getSession();
		String activityID,newTrainingDay;
		int intActivityID,newNumberOfSets,newNumberOfReps;

		
		switch(theCommand)
		{
		//delete activity
		case "delete":
			activityID = request.getParameter("activityId");
			intActivityID = Integer.parseInt(activityID);
			try {
				Activity activityToDelete =  gymTracking.searchActivity(intActivityID);
				gymTracking.deleteActivity(activityToDelete);
				newUser = (User)session.getAttribute("loginUser");
				userActivity = gymTracking.findUserActivity(newUser);
				session.setAttribute("userActivity" , userActivity);
				request.setAttribute("message", "YOUR ACTIVITY HAS BEEN SUCCSEFULLY DELETED!");
				request.getRequestDispatcher("/userActivities.jsp").forward(request,response);
			}
			catch (ExceptionGymDAO e) {	
				e.printStackTrace();
				request.getRequestDispatcher("/error.jsp").forward(request, response);
				}
			
			break;
			
		//send activity id to update	
		case "sendToUpdate":
			activityID = request.getParameter("activityId");
			session.setAttribute("activityId", activityID);
			request.getRequestDispatcher("/updateActivity.jsp").forward(request, response);
			
			break;
			
		//update activity	
		case "updateActivity":
			newTrainingDay = request.getParameter("myRadio");
			newNumberOfSets = Integer.parseInt(request.getParameter("newNumberOfSets"));
			newNumberOfReps = Integer.parseInt(request.getParameter("newNumberOfReps"));
			intActivityID = Integer.parseInt((String)session.getAttribute("activityId"));
			
			try {
				newUser = (User) session.getAttribute("loginUser");
				Activity activityToUpdate = gymTracking.searchActivity(intActivityID);
				gymTracking.updateActivity(activityToUpdate,newTrainingDay,newNumberOfSets, newNumberOfReps);
				userActivity = gymTracking.findUserActivity(newUser);
				session.setAttribute("userActivity", userActivity);
				request.setAttribute("message", "YOUR ACTIVITY HAS BEEN SUCCSEFULLY UPDATED!");
				request.getRequestDispatcher("/userActivities.jsp").forward(request, response);	
				}	
			catch (ExceptionGymDAO e) {
					e.printStackTrace();
					request.getRequestDispatcher("/error.jsp").forward(request, response);
					}
			
			break;
			
        //logout
		case "logout":
			session.invalidate();
			request.setAttribute("message", "LOGOUT SUCCESSFUL!");
			request.getRequestDispatcher("/logout.jsp").forward(request, response);
		break;
		
		}
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName,password,rePassword;
		String oldPassword,newPassword,repPassword;
		String activityName,trainingDay;
		int weight,height;
		int numberOfSets,numberOfReps;
		int newWeight,newHeight;
		List<Activity> userActivity = null;
		User newUser = null;
		String theCommand = request.getParameter("command");
		HttpSession session = request.getSession();

		switch(theCommand)
		{
		//login
		case "login":
			 userName = request.getParameter("userName");
			 password = request.getParameter("password");
			 
			try {
				if(userName.equals("") || password.equals("")) {
					request.setAttribute("message","You forgot to fill password/username");
					request.getRequestDispatcher("/login.jsp").forward(request, response);
					}
				else if(password.length() < 6) {
					request.setAttribute("message","The Password less than 6 characters");
					request.getRequestDispatcher("/login.jsp").forward(request, response);
					}
				boolean userExist = gymTracking.searchUserBool(userName,password);
				if(userExist) {
					User user = gymTracking.searchUser(userName);
					userActivity = gymTracking.findUserActivity(user);
					session.setAttribute("userActivity", userActivity);
					session.setAttribute("loginUser", user);
					request.getRequestDispatcher("/userMain.jsp").forward(request, response);
					}
				else {
					request.setAttribute("message","User/Password incorrect");
					request.getRequestDispatcher("/login.jsp").forward(request, response);
					}
				}
			catch (ExceptionGymDAO e) {	
				e.printStackTrace();
				request.getRequestDispatcher("/error.jsp").forward(request, response);
				}
			
			break;
			
		//registration
		case "registration":
			Iterator<User> iterator = null;
			userName = request.getParameter("userName");
			password = request.getParameter("password");
			rePassword = request.getParameter("rePassword");
			weight = Integer.parseInt(request.getParameter("weight"));
			height = Integer.parseInt(request.getParameter("height"));
			
			if(password.length() < 6) {
				request.setAttribute("message","The Password less than 6 characters");
				request.getRequestDispatcher("/registration.jsp").forward(request, response);
				}
			else if(!(password.equals(rePassword))) {
				request.setAttribute("message", "Passwords are not the same, please try agian");
				request.getRequestDispatcher("/registration.jsp").forward(request, response);
				}
			else if (password.equals("") || userName.equals("")) {
				request.setAttribute("message", "You need to fill both User name and Password");
				request.getRequestDispatcher("/registration.jsp").forward(request, response);
				} 
			else {
				try {
					User user = gymTracking.searchUser(userName);
					if(user != null) {
						request.setAttribute("message","The username is already exist");
						request.getRequestDispatcher("/registration.jsp").forward(request, response);	
						}
					else {
						user = new User(userName,password,weight,height);
						gymTracking.addUser(user);
						session.setAttribute("loginUser", user); 
						request.setAttribute("message", "WELCOME TO OUR GymTracking WEB! PLEASE ENTER YOUR DETAILS");
						request.getRequestDispatcher("/login.jsp").forward(request, response);
						}
				}
				catch (ExceptionGymDAO e) {
					e.printStackTrace();
					request.getRequestDispatcher("/error.jsp").forward(request, response);
					}		
				}
		
			break;
				
		//update user when he change password, weight and height.	
		case "updateUser" :
			newUser = (User)session.getAttribute("loginUser");
			oldPassword = request.getParameter("oldPassword");
			newPassword = request.getParameter("newPassword");
			repPassword = request.getParameter("rePassword");
			newWeight = Integer.parseInt(request.getParameter("newWeight"));
			newHeight = Integer.parseInt(request.getParameter("newHeight"));
			
			if((oldPassword == "") || (newPassword == "") || (repPassword == "")) {
				request.setAttribute("message", "Your need to fill all the fields");
				request.getRequestDispatcher("/updateUser.jsp").forward(request, response);
				}
			if((oldPassword == "") || (newPassword == "") || (repPassword == "")) {
				request.setAttribute("message", "Your need to fill all the fields");
				request.getRequestDispatcher("/updateUser.jsp").forward(request, response);
				}
			else if(oldPassword.length()<6 || newPassword.length() <6) {
				request.setAttribute("message","The Passwords less than 6 characters");
				request.getRequestDispatcher("/updateUser.jsp").forward(request, response);
				}
			else if (!(oldPassword.equals(newUser.getPassword()))) {
				request.setAttribute("message", "Your old password is incorrect");
				request.getRequestDispatcher("/updateUser.jsp").forward(request, response);	
				}
			else if(!(newPassword.equals(repPassword))) {
				request.setAttribute("message", "Your password repeat dosent match to your new password");
				request.getRequestDispatcher("/updateUser.jsp").forward(request, response);
				}
			else if(newPassword.equals(newUser.getPassword())) {
				request.setAttribute("message", "You entered your current password, please enter a different one");
				request.getRequestDispatcher("/updateUser.jsp").forward(request, response);
				}
			else { 
				try {
					gymTracking.updateUser(newUser,newPassword,newWeight,newHeight);
					request.setAttribute("message", "YOUR PASSWORD & WEIGHT & HEIGHT SUCCSEFULLY CHANGED!");
					request.getRequestDispatcher("/userMain.jsp").forward(request, response);
					}
				catch (ExceptionGymDAO e) {
					e.printStackTrace();
					request.getRequestDispatcher("/error.jsp").forward(request, response);
					}
				}
			
			break;
			
		//add new activity 
		case "addActive" :
			newUser = (User)session.getAttribute("loginUser");
			activityName = request.getParameter("mySelect");
			trainingDay = request.getParameter("myRadio");
			numberOfSets = Integer.parseInt(request.getParameter("numberOfSets"));
			numberOfReps = Integer.parseInt(request.getParameter("numberOfReps"));
			try {
				List<Activity> userActivityCheck= gymTracking.findUserActivity(newUser);
		        boolean flag = true;
				for(Activity activity : userActivityCheck) {
					String nameActivityTOCheck = activity.getActivityName();
					String dayCheck = activity.getTrainingDay();
					if(nameActivityTOCheck.equals(activityName))
					{
						if(dayCheck.equals(trainingDay))
						{
							flag = false;
						}
					}
				}
				if(flag) {
				Activity newActivity = new Activity(newUser.getUserName(),activityName,trainingDay,numberOfSets,numberOfReps);
				gymTracking.addActivity(newActivity);
				userActivity = gymTracking.findUserActivity(newUser);
				session.setAttribute("userActivity", userActivity);
				request.setAttribute("message", "ACTIVITY SUCCSEFULLY ADDED!");
				request.getRequestDispatcher("/userActivities.jsp").forward(request, response);	
				}
				else {
					request.setAttribute("message", "You have this activity in your Training Table!");
					request.getRequestDispatcher("/addActive.jsp").forward(request, response);	
				}
				}
			catch (ExceptionGymDAO e) {
				e.printStackTrace();
				request.getRequestDispatcher("/error.jsp").forward(request, response);
				}
			
			break;
			
		//when user change password
		case "updatePassword" :
			newUser = (User)session.getAttribute("loginUser");
			oldPassword = request.getParameter("oldPassword");
			newPassword = request.getParameter("newPassword");
			repPassword = request.getParameter("rePassword");
			
			if((oldPassword == "") || (newPassword == "") || (repPassword == "")) {
				request.setAttribute("message", "Your need to fill all the fields");
				request.getRequestDispatcher("/updatePassword.jsp").forward(request, response);
				}
			else if(oldPassword.length()<6 || newPassword.length() <6) {
				request.setAttribute("message","The Passwords less than 6 characters");
				request.getRequestDispatcher("/updatePassword.jsp").forward(request, response);
				}
			else if (!(oldPassword.equals(newUser.getPassword()))) {
				request.setAttribute("message", "Your old password is incorrect");
				request.getRequestDispatcher("/updatePassword.jsp").forward(request, response);	
				}
			else if(!(newPassword.equals(repPassword))) {
				request.setAttribute("message", "Your password repeat dosent match to your new password");
				request.getRequestDispatcher("/updatePassword.jsp").forward(request, response);
				}
			else if(newPassword.equals(newUser.getPassword())) {
				request.setAttribute("message", "You entered your current password, please enter a different one");
				request.getRequestDispatcher("/updatePassword.jsp").forward(request, response);
				}
			else { 
				try {
					gymTracking.updatePassword(newUser, newPassword);
					request.setAttribute("message", "YOUR PASSWORD SUCCSEFULLY CHANGEDED!");
					request.getRequestDispatcher("/userMain.jsp").forward(request, response);
					}
				catch (ExceptionGymDAO e) {
					e.printStackTrace();
					request.getRequestDispatcher("/error.jsp").forward(request, response);
					}
				}
					
			break;
		
		//user change weight and height
		case "updateWeightAndHeight" :
			newUser = (User)session.getAttribute("loginUser");
			newWeight = Integer.parseInt(request.getParameter("newWeight"));
			newHeight = Integer.parseInt(request.getParameter("newHeight"));
			
			try {
				gymTracking.updateWeightAndHeight(newUser, newWeight, newHeight);
				request.setAttribute("message", "YOUR WEIGHT & HEIGHT SUCCSEFULLY CHANGED!");
				request.getRequestDispatcher("/userMain.jsp").forward(request, response);
			}
			catch (ExceptionGymDAO e) {
				e.printStackTrace();
				request.getRequestDispatcher("/error.jsp").forward(request, response);
			}
			
			break;
			
			
		}		
		//doGet(request, response);
	}
}
