package com.abc.xyz.controllers.rest.workers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.ModelAndView;

import com.abc.beans.dto.UserView;
import com.abc.xyz.controllers.workers.UserOp;
import com.abc.xyz.service.UserService;

/**
 * 
 * @author amrit
 * 
 */
@Component
public class UserOpRest 
{
	@Autowired
	private UserOp userOp;
	
	@Autowired
	private UserService userService;
	
	public UserView login(String loginId, String password)
	{
		return userService.findByCredentials(loginId, password);
	}
	public void logout() 
	{
		SecurityContextHolder.getContext().setAuthentication(null);
	}	
	public ModelAndView forgotPassword(HttpServletRequest request, String userEmail)
	{
		ModelAndView modelAndView = new ModelAndView();
		userOp.forgotPassword(modelAndView, request, userEmail);		
		return modelAndView;
	}	
	public ModelAndView register(HttpServletRequest request, BindingResult result, UserView userView, ModelAndView model)
	{
		return userOp.registerUserAccount(request, result, userView, model);
	}
}
