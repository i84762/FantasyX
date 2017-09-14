package com.abc.xyz.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.abc.xyz.config.Resource;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author amrit
 *
 */
@Controller
@RestController
public class MainController
{
	@Autowired
	private Resource resource;
	
	
	@RequestMapping(value = "*")
    public ModelAndView handleResourceNotFoundException()
	{
		ModelAndView view = new ModelAndView("failPage");
		view.addObject("title", "Oops!");
		view.addObject("msg", resource.get("A0027"));	
        return view;
    }
	
	
	@RequestMapping(value = { "/h"}, method = RequestMethod.GET)
	public @ResponseBody String defaultPage()
	{
		System.out.println("\n\n\n\n\n-----------------\n\n\n\n\n");
		return "Chak de!!";
	}	
	
	
	@RequestMapping(value = { "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView defaultPagep()
	{
		ModelAndView model = new ModelAndView();
		model.addObject("title", "ValueFirst BotU");
		model.addObject("message", "Hi, Welcome to ValueFirst Bots Directory.");
		model.setViewName("hello");
		return model;
	}	
	

	@ExceptionHandler(Exception.class)
	public ModelAndView error(Exception ex)
	{
		System.out.println("\n\n\n\nerror\n\n\n\n");
		ex.printStackTrace();
		ModelAndView model = new ModelAndView("error");
		model.addObject("errCode", ex.getMessage());
//		model.addObject("errMsg", ex.getErrMsg());
		return model;
	}
	
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied()
	{
		ModelAndView model = new ModelAndView();
		// check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(!(auth instanceof AnonymousAuthenticationToken)) 
		{
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);
			model.addObject("username", userDetail.getUsername());
		}
		model.setViewName("403");
		return model;
	}
	
	private String getJSON(List list)
	{
	    final ObjectMapper mapper = new ObjectMapper();

	    String str="";
		    try 
		    {
		    	 str = mapper.writeValueAsString(list);
			} 
		    catch (Exception e) 
		    {
				e.printStackTrace();
			}
	    return str;
	}
}