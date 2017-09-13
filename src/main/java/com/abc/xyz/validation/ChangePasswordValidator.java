package com.abc.xyz.validation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.abc.beans.dto.UserView;
import com.abc.xyz.config.Resource;
import com.abc.xyz.service.UserService;

/**
 * 
 * @author amrit
 *
 */
@Component
public class ChangePasswordValidator implements Validator
{
	@Autowired
	private UserService userService;
	
	@Autowired
	private Resource resource;
	
	private UserView view;
	
	private Errors errors;

    @Override
    public boolean supports(Class<?> clazz)
    {
        return UserView.class.equals(clazz);
    }

    @Override
    public void validate(Object obj, Errors errors) 
    {
    	this.view = (UserView) obj;
    	this.errors = errors;
    	
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "message.password", "Password is required.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "matchingPassword", "message.username", "Enter confirm password");
        
        	if(!errors.hasErrors())        	
	        		if(passwordIsValid())
	        			checkIfPasswordsAreSame();
        		
    }

	private void checkIfTokenIsValid() 
	{
			if(userService.validateResetPasswordToken(view.getId(), view.getPasswordResetToken()))
				errors.reject("matchingPassword", resource.getMsg("A0004"));
	}

	private boolean passwordIsValid() 
	{
		boolean value = userService.isPasswordValid(view.getPassword());
			if(!value)
				errors.reject("password", resource.getMsg("A0019"));
		return value;
	}

	private void checkIfPasswordsAreSame() 
	{
			if(!view.getPassword().equals(view.getMatchingPassword()))
				errors.reject("matchingPassword", resource.getMsg("A0018"));
	}
}
