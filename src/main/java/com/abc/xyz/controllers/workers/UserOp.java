
package com.abc.xyz.controllers.workers;

import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.web.servlet.ModelAndView;

import com.abc.beans.dto.UserView;
import com.abc.xyz.config.Resource;
import com.abc.xyz.service.UserService;
import com.abc.xyz.validation.ChangePasswordValidator;
import com.abc.xyz.validation.UserValidator;

/**
 * 
 * @author amrit
 * 
 */
@Component
public class UserOp 
{
	@Autowired
	private UserService userService;
	
    @Autowired
    private JavaMailSender mailSender;    

    @Autowired
    private Resource resource;
    
    @Autowired
    private Environment env;
    
    @Autowired
    private UserValidator userValidator;

	@Autowired
    private PasswordEncoder passwordEncoder;	
    
    
    @Autowired
    private ChangePasswordValidator changePasswordValidator;
    
	public void forgotPassword(ModelAndView modelAndView, HttpServletRequest request, String userEmail)
	{
		String msg = null;
		String error = null;
			if(userEmail.isEmpty())			
				error = resource.getMsg("A0006");			
			else
			{
				UserView user = userService.findByEmail(userEmail);
					if(user == null)					
						error = resource.getMsg("A0007");					
					else if(!user.isEnabled())					
						error = resource.getMsg("A0028");					
					else
					{	
						String token = UUID.randomUUID().toString();
						user.setPasswordResetToken(token);
						user.setPasswordResetTokenDate(new Date());	
						userService.updateUser(user);
						SimpleMailMessage message = constructResetTokenEmail(getAppUrl(request), token, user);
						sendMail(message);						
						msg = resource.getMsg("A0005");
					}
			}
			if(error != null)
				modelAndView.addObject("email", error);
			else
				modelAndView.addObject("msg", msg);
	}
	public ModelAndView registerUserAccount(HttpServletRequest request, 
												BindingResult result, 
												UserView userView, 
												ModelAndView model)
    {
		userValidator.validate(userView, result);
        	if(!result.hasErrors())
        	{
		        String token = UUID.randomUUID().toString();
		    	userView.setVerificationToken(token);
		    	userView.setVerificationTokenDate(new Date());
		    	userView.setPassword(passwordEncoder.encode(userView.getPassword()));
		    	userView.setId(userService.addUser(userView));
		        SimpleMailMessage message = constructVerifyUserEmail(getAppUrl(request), token, userView);
				sendMail(message);
				model.addObject("msg", resource.getMsg("A0015"));
        	}
        	else
        	{
        		model.addAllObjects(result.getModel());
        	}
    	
        return model;
    }	
	public boolean verifyUser(ModelAndView view, long userId, String token)
	{
    	String msg = null;
    	String title = null;
        boolean valid = userService.validateUserVerificationToken(userId, token);
	        if(!valid)
	        {
	        	msg = resource.getMsg("A0004");
	        	title = "Oops!";
	        }
	        else
	        {
	        	userService.enableUser(userId, true);
	        	title = "Congratulations!";
	        	msg = resource.getMsg("A0016");
	        } 
        view.addObject("title", title);
        view.addObject("msg", msg);
        return valid;
	}
	
	public ModelAndView login(String error, String logout, HttpServletRequest request, ModelAndView model)
	{
			if(error != null)
				model.addObject("error", getErrorMessage(request, "SPRING_SECURITY_LAST_EXCEPTION"));
			if(logout != null)
				model.addObject("msg", resource.getMsg("A0017"));		
		model.setViewName("login");
		return model;
	}
	
	public boolean changePasswordPage(long userId, String token, ModelAndView view) 
	{
		String error = null;
		boolean valid = userService.validateResetPasswordToken(userId, token);
	        if(!valid)
        	{
	        	error = resource.getMsg("A0004");	
	        	view.addObject("title", "Oops!");
	        	view.addObject("msg", error);
        	}	
	        else
	        {
	    		UserView userView = userService.findByID(userId);
	    		userView.setPassword(null);
	    		view.addObject("user", userView);
	        }
		return valid;
	}
	
	 public boolean changePassword(HttpServletRequest request, 
			 								BindingResult result, 
			 								UserView userView,
			 								ModelAndView view) 
	{
		changePasswordValidator.validate(userView, result);
			if(!result.hasErrors())
			{
				UserView userViewNew = userService.findByID(userView.getId());
				userViewNew.setPassword(passwordEncoder.encode(userView.getPassword()));
				userViewNew.setPasswordResetToken(null);
				userService.updateUser(userViewNew);
				view.addObject("title", "Congratulations!");
				view.addObject("msg",  resource.getMsg("A0020"));
			}
		userView.setMatchingPassword(null);
		userView.setPassword(null);
		return !result.hasErrors();
	}
	
	private String getErrorMessage(HttpServletRequest request, String key)
	{
		Exception exception = (Exception) request.getSession().getAttribute(key);
		String error = "";
			if(exception instanceof BadCredentialsException)
				error = "Invalid username and password!";
			else
				error = exception.getMessage();			
		return error;
	}

	private SimpleMailMessage constructResetTokenEmail(String contextPath, String token, UserView user) 
	{
	    String url = contextPath + "/changePassword?id=" + user.getId() + "&token=" + token;
	    return constructMail(user.getEmail(), 
					    		env.getProperty("support.email"),
					    		resource.getMsg("A0009"),
					    		resource.getMsg("A0008") + " " + url);
	}	
	
	private SimpleMailMessage constructMail(String setTo, String from, String subject, String text)
	{
		SimpleMailMessage email = new SimpleMailMessage();
	    email.setTo(setTo);
	    email.setSubject(subject);
	    email.setText(text);
	    email.setFrom(from);
	    return email;
	}

	private SimpleMailMessage constructVerifyUserEmail(String contextPath, String token, UserView user) 
	{
		String url = contextPath + "/verifyUser?id=" + user.getId() + "&token=" + token;
		return constructMail(user.getEmail(), 
	    		env.getProperty("support.email"),
	    		resource.getMsg("A0012"),
	    		resource.getMsg("A0011") + " " + url);
	}	
    private String getAppUrl(HttpServletRequest request)
    {
        return "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    }
    
    private void sendMail(SimpleMailMessage mailMessage)
    {
    	new Thread(() -> mailSender.send(mailMessage)).start();
    }
}