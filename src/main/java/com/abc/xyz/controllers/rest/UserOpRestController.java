package com.abc.xyz.controllers.rest;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BeanPropertyBindingResult;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.abc.beans.common.RestMessage;
import com.abc.beans.dto.UserView;
import com.abc.xyz.config.Resource;
import com.abc.xyz.controllers.rest.workers.UserOpRest;
import com.abc.xyz.service.UserService;
import com.google.common.base.Strings;

/**
 * 
 * @author amrit
 * 
 */
@RestController
public class UserOpRestController 
{
	private static final Logger logger = Logger.getLogger(UserOpRestController.class);
	
	@Autowired
	private UserOpRest userOp;
	
	@Autowired
	private Resource resource;

	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public ResponseEntity<?> register(@RequestBody UserView userView,
											HttpServletRequest request)
	{	
		BindingResult result = new BeanPropertyBindingResult(userView, "user");
		ModelAndView modelAndView = userOp.register(request, result, userView, new ModelAndView());		
			if(!result.hasErrors())
				return new ResponseEntity<>(modelAndView.getModel(), HttpStatus.OK);
		return new ResponseEntity<>(getMapFromBindingResult(result), HttpStatus.BAD_REQUEST);
	}
	@RequestMapping(value = "/forgotPassword", method = RequestMethod.POST)
	public ResponseEntity<?>  forgotPassword(@RequestBody UserView userView, HttpServletRequest request)
	{	
		ModelAndView modelAndView = userOp.forgotPassword(request, userView.getEmail());
			if(modelAndView.getModel().containsKey("msg"))
				return new ResponseEntity<>(modelAndView.getModel(), HttpStatus.OK);
		return new ResponseEntity<>(modelAndView.getModel(), HttpStatus.BAD_REQUEST);		
	}
	@RequestMapping(value = "/login")
	public ResponseEntity<RestMessage<UserView>> login(@RequestParam String loginId, @RequestParam String password)
	{	
		UserView userView = null;
		String message;
		HttpStatus status;
		
			if(Strings.isNullOrEmpty(loginId) || Strings.isNullOrEmpty(password))
			{
				message = "Login id and password required";
				status = HttpStatus.BAD_REQUEST;
			}
		userView = userOp.login(loginId, password);
			if(userView == null)
			{
				message = "Login failed";
				status = HttpStatus.NOT_FOUND;
			}
			else
			{
				message = "Login success";
				status = HttpStatus.OK;
			}
		RestMessage<UserView> restMessage = RestMessage.create(userView)
														.setData(userView)
														.setMessage(message)
														.setStatus(status);
		logger.debug(restMessage);
		return new ResponseEntity<RestMessage<UserView>>(restMessage, status);
	}
	
	private Map<String, String> getMapFromBindingResult(BindingResult result)
	{
		Map<String, String> map = new HashMap();
		result.getAllErrors().forEach(error -> map.put(error.getCode(), error.getDefaultMessage()));
		return map;		
	}	
}