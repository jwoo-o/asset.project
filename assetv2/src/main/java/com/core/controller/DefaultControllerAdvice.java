package com.core.controller;


import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.core.exception.RequriedLoginException;

@ControllerAdvice
public class DefaultControllerAdvice {

	@ExceptionHandler(RequriedLoginException.class)
	public ModelAndView requiredLogin(RequriedLoginException e,Model model){
	
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", e.getMessage());
		mv.setViewName("error");
		
		return mv;
	}

}