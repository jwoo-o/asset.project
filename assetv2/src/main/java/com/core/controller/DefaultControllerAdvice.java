package com.core.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.core.exception.NotAccessException;
import com.core.exception.RequriedLoginException;

@ControllerAdvice
public class DefaultControllerAdvice {
	
	private final Logger logger = LoggerFactory.getLogger(DefaultControllerAdvice.class);

	@ExceptionHandler(RequriedLoginException.class)
	public ModelAndView requiredLogin(RequriedLoginException e,Model model){
	
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", e.getMessage());
		mv.setViewName("error");
		
		return mv;
	}
	@ExceptionHandler(NotAccessException.class)
	public ModelAndView NotAccess(NotAccessException e,Model model){
	
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", e.getMessage());
		mv.setViewName("error");
		
		return mv;
	}
	@ExceptionHandler(Exception.class)
	public ModelAndView allException(Exception e,Model model){
		
		logger.error(e.getMessage(),e);
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", e.getMessage());
		mv.setViewName("error");
		
		return mv;
	}

}