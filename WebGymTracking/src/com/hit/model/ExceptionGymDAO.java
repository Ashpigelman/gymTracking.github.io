package com.hit.model;

/**
 * Class that represent exception that belong to this project.
 */

public class ExceptionGymDAO extends Exception {

	/**
	 * Default serial version id.
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Method that send a message that describe the exception to the user.
	 * @param message is a string that represent the exception that occurred.
	 */
	public ExceptionGymDAO(String message) {
		super("GymDAO Exception: " + message);
	}
	
	/**
	 * An exception wrapper for the Hibernate framework.
	 * @param message is a string that represent the exception that has just occured.
	 * @param cause is a Throwable that represent error stack.
	 */
	public ExceptionGymDAO(String message,Throwable cause) {
		super("GymDAO Exception: " + message, cause);
	}

}
