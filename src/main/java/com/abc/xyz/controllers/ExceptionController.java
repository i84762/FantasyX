package com.abc.xyz.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

import com.abc.xyz.config.Resource;

/**
 * 
 * @author amrit
 * 
 */
@ControllerAdvice
public class ExceptionController 
{
	@Autowired
	private Resource resource;

    @ExceptionHandler(NoHandlerFoundException.class)
    public ModelAndView handleError404(HttpServletRequest request, Exception e)   
    {
    	ModelAndView view = new ModelAndView("failPage");
		view.addObject("title", "Oops!");
		view.addObject("msg", resource.get("A0027"));	
        return view;
    }
}