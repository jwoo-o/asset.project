package com.core.controller;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Handles requests for the application home page.
 */

public class CoreController {
	
	protected final Logger logger = LoggerFactory.getLogger(getClass());
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	protected void setSessionAttribute(HttpServletRequest request,String key, Object obj) {
		HttpSession session = request.getSession();
		session.setAttribute(key, obj);
	}
	protected Object getSessionAttribute(HttpServletRequest request,String key) {
		HttpSession session = request.getSession();
		return session.getAttribute(key);
	}
	protected void removeSessionAttribute(HttpServletRequest request,String key) {
		HttpSession session = request.getSession();
		if(session.getAttribute(key)!= null) {
			session.removeAttribute(key);
		}
	}
	
	
	
}
