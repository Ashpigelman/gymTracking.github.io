package com.hit.tag;


import javax.servlet.jsp.tagext.*;
import javax.servlet.jsp.*;
import java.io.*;

public class HelloUserTag extends SimpleTagSupport {
	
	private String nameOfUser;
	
	/**
	 * Get name of user
	 * @return name of user
	 */
	public String getNameOfUser() {
		return nameOfUser;
	}

	/**
	 * Set name of user
	 * @param nameOfUser of set
	 */
	public void setNameOfUser(String nameOfUser) {
		this.nameOfUser = nameOfUser;
	}

	/**
	 * prints the name of the user if he connected
	 */
	public void doTag() throws JspException, IOException {
		JspWriter out = getJspContext().getOut();
		if(nameOfUser != null)
		{
			out.println("Hello and welcome!"+ nameOfUser);
		}
		else
		{
			out.println("Hello,you are not logged yet");
		}
	}	
}