package com.hit.controller;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class ServletListenerCounter
 *
 */
@WebListener
public class ServletListenerCounter implements HttpSessionListener {

	private static int sessionCounter = 0;
	
    public static int getSessionCounter() {
    	return sessionCounter;
    	}

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
	@Override
    public void sessionCreated(HttpSessionEvent se)  { 
    	sessionCounter++;    
    	}

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
	@Override
    public void sessionDestroyed(HttpSessionEvent se)  { 
    	sessionCounter--;
    	}
}
