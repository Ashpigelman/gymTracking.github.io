package com.hit.model;

/**
 * User class represent user properties.
 */

public class User {
	
	private String userName;
	private String password;
	private int weight;
	private int height;
	
	/**
	 * default C'tor
	 */
	public User() {
	}
	
	/**
	 * C'tor that initialize this class members with given values.
	 * @param userName represent user name.
	 * @param password represent password for user.
	 * @param weight represent weight for user.
	 * @param height represent height for user.
	 */
	public User(String userName, String password, int weight, int height){
		setUserName(userName);
		setPassword(password);
		setWeight(weight);
		setHeight(height);
	}

	/**
	 * Get user name.
	 * @return user name.
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * set user name.
	 * @param userName to set.
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * Get password.
	 * @return password of user.
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * Set password.
	 * @param password to set.
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * Get weight.
	 * @return weight of user.
	 */
	public int getWeight() {
		return weight;
	}

	/**
	 * Set weight.
	 * @param weight to set.
	 */
	public void setWeight(int weight) {
		this.weight = weight;
	}

	/**
	 * Get height.
	 * @return height of user.
	 */
	public int getHeight() {
		return height;
	}

	/**
	 * Set height.
	 * @param height of set.
	 */
	public void setHeight(int height) {
		this.height = height;
	}
	
	@Override
	public String toString() {
		return "User [userName=" + userName + ", password=" + password +
				", weight=" + weight + ", height=" + height + "]" ; 
	}

}
