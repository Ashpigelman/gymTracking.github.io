package com.hit.model;

import java.util.List;

/**
 * IGymDAO is a interface represent the methods for User and Activity.
 */

public interface IGymDAO {
	/**
	 * User API function
	 */
	
	/**
	 * Add user for DataBase(User table).
	 * @param userToAdd represent user to add to user table.
	 * @return if user was added successfully.
	 * @throws ExceptionGymDAO if adding failed.
	 */
	public boolean addUser(User userToAdd) throws ExceptionGymDAO;
	
	/**
	 * Delete user from the DataBase(User table).
	 * @param UserNameToDelete represent user that we want to delete.
	 * @return if user was deleted successfully.
	 * @throws ExceptionGymDAO if delete failed.
	 */
	public boolean deleteUser(User UserNameToDelete) throws ExceptionGymDAO;
	
	/**
	 * Update user password,weight and height in the DataBase(User table).
	 * @param userToUpdate represent User that we want to update his password,weight and height. 
	 * @param passwordToChange represent String with new password.
	 * @param weightToChange represent int with new weight.
	 * @param heightToChange represent int with new height.
	 * @return if user's data was updated successfully.
	 * @throws ExceptionGymDAO if update failed.
	 */
	public boolean updateUser(User userToUpdate,String passwordToChange,int weightToChange,int heightToChange) throws ExceptionGymDAO;
	
	/**
	 * Update password password in the DataBase(User table).
	 * @param userToUpdate represent User that we want to update his password,weight and height. 
	 * @param passwordToChange represent String with new password.
	 * @return if user's data was updated successfully.
	 * @throws ExceptionGymDAO if update failed.
	 */
	public boolean updatePassword(User userToUpdate,String passwordToChange) throws ExceptionGymDAO;
	
	/**
	 * Update Weight And Height weight and height in the DataBase(User table).
	 * @param userToUpdate represent User that we want to update his password,weight and height. 
	 * @param weightToChange represent int with new weight.
	 * @param heightToChange represent int with new height.
	 * @return if user's data was updated successfully.
	 * @throws ExceptionGymDAO if update failed.
	 */
	public boolean updateWeightAndHeight(User userToUpdate,int weightToChange,int heightToChange) throws ExceptionGymDAO;
	
	/**
	 * Return all users from the DataBase(User table).
	 * @return list of all Users.
	 * @throws ExceptionGymDAO if getting the list from DataBase failed.
	 */
	public List<User> findAllUsers() throws ExceptionGymDAO;
	
	/**
	 * Return true or false if user is exsit.
	 * @param user represent user that we want to look for in the User table.
	 * @return True or False if user exsit.
	 * @throws ExceptionGymDAO if user dont found.
	 */
	public boolean isUserExist(User user) throws ExceptionGymDAO;
	
	/**
	 * Find user from the DataBase(User table).
	 * @param userName represent user that we look for.
	 * @return the User if he exsit.
	 * @throws ExceptionGymDAO if searching failed.
	 */
	public User searchUser(String userName) throws ExceptionGymDAO;
	
	/**
	 * return true or false if user is exsit in the gymActive list user table.
	 * @param userName is a string that represent user name.
	 * @param password is a string that represent password.
	 * @return true or false if user is exsit.
	 * @throws ExceptionGymDAO if searching failed.
	 */
	public boolean searchUserBool(String userName,String password) throws ExceptionGymDAO;
	
	/**
	 * Return true or false if login successful.
	 * @param userName represent user that we want to look for in the User table.
	 * @param password represent a password for user.
	 * @return True or False if login successful.
	 * @throws ExceptionGymDAO if login failed.
	 */
	public boolean login(String userName,String password) throws ExceptionGymDAO;
	
	
	/**
	 * Return activity from DataBase(Activity table) ,with user's activity.
	 * @param userId represent user that we want to get his activity form the DataBase.
	 * @return list of user's activity.
	 * @throws ExceptionGymDAO if getting user's activity from DataBase failed.
	 */
	public List<Activity> findUserActivity(User user) throws ExceptionGymDAO;

	
	
	/**
	 * Activity API function
	 */
	
	/**
	 * Add Activity to the DataBase(Activity table).
	 * @param activityToAdd represent activity that we want to add.
	 * @return if activity was added successfully.
	 * @throws ExceptionGymDAO if adding failed.
	 */
	public boolean addActivity(Activity activityToAdd) throws ExceptionGymDAO;
	
	/**
	 * Delete Activity from the DataBase(Activity table).
	 * @param activityToDelelte represent activity that we want to delete.
	 * @return if activity was deleted successfully.
	 * @throws ExceptionGymDAO if the delete failed.
	 */
	public boolean deleteActivity(Activity activityToDelelte) throws ExceptionGymDAO;
	
	/**
	 * Update activity in the Activity table.
	 * @param activityToUpdate represent activity that we want to update.
	 * @param changeSets is a int that represent the new sets.
	 * @param changeReps is a int that represent the new repeats.
	 * @param changeTrainingDay is a string that represent the new day.
	 * @return if activity's data was updated successfully.
	 * @throws ExceptionGymDAO if update failed.
	 */
	public boolean updateActivity(Activity activityToUpdate,String changeTrainingDay, int changeSets,int changeReps) throws ExceptionGymDAO;
	
	/**
	 * Return true or false if user is activity.
	 * @param activity represent activity that we want to look for in the Activity table.
	 * @return True or False if activity exsit.
	 * @throws ExceptionGymDAO if activity dont found.
	 */
	public boolean isActivityExist(Activity activity) throws ExceptionGymDAO;
	
	/**
	 * Return list from DataBase(Activity table) with all activity.
	 * @return list of all activity.
	 * @throws ExceptionGymDAO if getting all activity from DataBase failed.
	 */
	public List<Activity> findAllActivity() throws ExceptionGymDAO;
	
	/**
	 * Search activity in the DataBase(Activity table).
	 * @param id represent id of activity that we want to look for.
	 * @return activity that we look for by id.
	 * @throws ExceptionGymDAO if searching failed.
	 */
	public Activity searchActivity(int id) throws ExceptionGymDAO;
	
}
