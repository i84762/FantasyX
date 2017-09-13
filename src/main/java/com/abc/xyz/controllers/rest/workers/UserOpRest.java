package com.abc.xyz.controllers.rest.workers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.RememberMeServices;
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
//	@Autowired 
//	private AuthenticationSuccessHandler successHandler;
	
	@Autowired 
	private AuthenticationManager authenticationManager;  
	
	@Autowired
	private RememberMeServices rememberMeServices;
	
//	@Autowired 
//	private AuthenticationFailureHandler failureHandler;
	
	public void login(UserView userView, HttpServletRequest request, HttpServletResponse response, boolean rememberMe) 
	{
	    UsernamePasswordAuthenticationToken token = 
	    		new UsernamePasswordAuthenticationToken(userView.getEmail(), userView.getPassword());
//	    token.setDetails(new WebAuthenticationDetails(request));//if request is needed during authentication
	    Authentication auth;
		    try 
		    {
		        auth = authenticationManager.authenticate(token);
		        SecurityContextHolder.getContext().setAuthentication(auth);
		        	if(rememberMe)
		        	{
		        		HttpServletRequestWrapper wrapper = new HttpServletRequestWrapper(request) {
		        		    @Override public String getParameter(String name) { return "true"; }            
		        		};
		        		rememberMeServices.loginSuccess(wrapper, response, auth);
		        	}
		    } 
		    catch (AuthenticationException e) 
		    {
		        //if failureHandler exists  
//			        try 
//			        {
//			            failureHandler.onAuthenticationFailure(request, response, e);
//			        } 
//			        catch (IOException | ServletException se)
//			        {
//			            //ignore
//			        }
		        throw e;
		    }
	    SecurityContextHolder.getContext().setAuthentication(auth);
//		    try 
//		    {
//				successHandler.onAuthenticationSuccess(request, response, auth);
//			} 
//		    catch (IOException | ServletException e) 
//		    {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//	    //if successHandler exists  
//	    //if user has a http session you need to save context in session for subsequent requests
	    HttpSession session = request.getSession(true);
	    session.setAttribute("SPRING_SECURITY_CONTEXT", SecurityContextHolder.getContext());
//	    	if(rememberMe)
//	    	{
//	    		
//	    
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
