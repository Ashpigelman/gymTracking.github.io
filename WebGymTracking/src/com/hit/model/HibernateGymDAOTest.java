package com.hit.model;

import java.util.List;

/**
 * Testing done to IGymDAO & HibernateGymDAO
 * @param args
 * @throws ExceptionGymDAO
 */
public class HibernateGymDAOTest {
	
	  public static void main(String[] args) throws ExceptionGymDAO {
		  User user1 = new User("AlexeySh","a12345",72,177);
	      System.out.println(user1.getUserName());
		  Activity activ1 = new Activity("AlexeySh", "benst","Monday", 3, 8);
		  Activity activ2 = new Activity("AlexeySh", "legs","Sunday", 4, 7);
		  HibernateGymDAO hibernate = HibernateGymDAO.getInstance();
	      hibernate.addUser(user1);
	      hibernate.addActivity(activ1);
	      hibernate.addActivity(activ2);
	      
	      List<Activity> usersActivity = hibernate.findUserActivity(user1);
	      System.out.println(user1);
	      for(Activity activity : usersActivity)
	      {
	    	  System.out.println(activity.toString());
	      }
	      
	      System.out.println(123);
	  }

}
