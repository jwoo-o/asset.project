package com.core.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = 
			LoggerFactory.getLogger(AuthenticationInterceptor.class);
	
	@Override
	public void postHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();
		String requestURI = request.getRequestURI();
		
		// 요청 URL
		logger.debug("Request URI={" + requestURI + "}");
		
		
		// 세션이 존재하는 경우 화면에서 사용하도록 보낸다.
		if(session.getAttribute("mgr") != null){
			if(modelAndView != null){
				modelAndView.addObject("mgr", 
						session.getAttribute("mgr"));
			}
		}
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		String requestURI = request.getRequestURI();
		
		boolean isAjax = false;
		if(requestURI.indexOf("/proc") > -1) isAjax = true;
		
		if(session.getAttribute("mgr") == null){
			logger.info("Current user is not logined RequestURI {" + requestURI + "}");
			if(isAjax){
				response.sendError(401); 
			}
			else{
				response.sendRedirect("/login");
			}
			return false;
		}
		return true;
	}
	
	
}
