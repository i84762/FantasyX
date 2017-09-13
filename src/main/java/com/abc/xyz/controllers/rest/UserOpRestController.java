package com.abc.xyz.controllers.rest;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.abc.beans.dto.UserView;
import com.abc.xyz.config.Resource;
import com.abc.xyz.controllers.rest.workers.UserOpRest;
import com.abc.xyz.service.UserService;

/**
 * 
 * @author amrit
 * 
 */
@RestController
@RequestMapping(value = "/3")
public class UserOpRestController 
{
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
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ResponseEntity<?> loginPost(@RequestBody UserView userView,
										@RequestParam(name = "rememberMe") boolean rememberMe,
											HttpServletRequest request,
											HttpServletResponse response)
	{	
		System.out.println("\n\n\n\n\n\n"+userView);
		Map<String,String> responseMap = new HashMap();
			try 
			{			
				userOp.login(userView, request, response, rememberMe);
				return new ResponseEntity<>(userService.getCurrentUser().getUsername(), HttpStatus.OK);
			} 
			catch (Exception e) 
			{
				responseMap.put("email", e.getMessage());
				return new ResponseEntity<>(responseMap, HttpStatus.BAD_REQUEST);
			}
	}
	
	private Map<String, String> getMapFromBindingResult(BindingResult result)
	{
		Map<String, String> map = new HashMap();
		result.getAllErrors().forEach(error -> map.put(error.getCode(), error.getDefaultMessage()));
		return map;		
	}	
}