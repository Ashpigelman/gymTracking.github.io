package com.hit.model;

/**
 * User class represent user properties.
 */
public class Activity {

	private String userName;
	private int activityId;
	private String activityName;
	private String trainingDay;
	private int numberOfSets;
	private int numberOfReps;


	/**
	 * default C'tor
	 */
	public Activity() {
		
	}
	
	/**
	 * C'tor that initialize this class members with given values.
	 * @param userName represent user name.
	 * @param activityName represent activity name.
	 * @param trainingDay represent training day.
	 * @param numbrtOfSets represent number of sets for activity.
	 * @param numberOfReps represent number of repeats for activity.
	 */
	 public Activity(String userName, String activityName, String trainingDay, int numbrtOfSets, int numberOfReps) {
		 setUserName(userName);
		 setActivityName(activityName);
		 setTrainingDay(trainingDay);
		 setNumberOfSets(numbrtOfSets);
		 setNumberOfReps(numberOfReps);
	 }

	/**
	 * Get username.
	 * @return username.
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * Set username.
	 * @param userName to set.
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * Get activity id.
	 * @return activity id.
	 */
	public int getActivityId() {
		return activityId;
	}

	/**
	 * Set activity id.
	 * @param activityId to set.
	 */
	public void setActivityId(int activityId) {
		this.activityId = activityId;
	}

	/**
	 * Get activity name.
	 * @return activity name.
	 */
	public String getActivityName() {
		return activityName;
	}

	/**
	 * Set activity name.
	 * @param activityName to set.
	 */
	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}

	/**
	 * Get Training Day.
	 * @param trainingDay.
	 */
	public String getTrainingDay() {
		return trainingDay;
	}

	/**
	 * Set Training Day.
	 * @param trainingDay to set.
	 */
	public void setTrainingDay(String trainingDay) {
		this.trainingDay = trainingDay;
	}

	/**
	 * Get number of sets.
	 * @return number of activity sets.
	 */
	public int getNumberOfSets() {
		return numberOfSets;
	}

	/**
	 * Set number of sets.
	 * @param numberOfSets to set.
	 */
	public void setNumberOfSets(int numberOfSets) {
		this.numberOfSets = numberOfSets;
	}

	/**
	 * Get number of repeats.
	 * @return number of activity repeats.
	 */
	public int getNumberOfReps() {
		return numberOfReps;
	}

	/**
	 * Set number of repeats.
	 * @param numberOfSets to set.
	 */
	public void setNumberOfReps(int numberOfReps) {
		this.numberOfReps = numberOfReps;
	}
	
	@Override
	public String toString() {
		return "User [UserName="+ userName +" ,activityId=" + activityId + " ,activityName=" + activityName +
				", numberOfSets=" + numberOfSets + ", numberOfReps=" + numberOfReps + "]" ; 
	}
	
}
