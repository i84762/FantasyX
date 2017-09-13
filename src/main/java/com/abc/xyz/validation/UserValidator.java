package com.abc.xyz.validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.abc.beans.dto.UserView;
import com.abc.xyz.config.Resource;
import com.abc.xyz.service.UserService;

@Component
public class UserValidator implements Validator
{
	private static final String PASSWORD_PATTERN = "[A-Za-z0-9!@&*()_]{2,20}$";
	private static final String USERNAME_PATTERN = "[a-zA-Z ]{2,12}+$";
	private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$";
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private Resource resource;
	
	private UserView view;
	
	private Errors errors;
	
	private Pattern pattern;
    private Matcher matcher;

    @Override
    public boolean supports(final Class<?> clazz)
    {
        return UserView.class.equals(clazz);
    }

    @Override
    public void validate(final Object obj, final Errors errors) 
    {
    	this.view = (UserView) obj;
    	this.errors = errors;    	
    	
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "message.password", "Password is required.");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "message.username", "UserName is required.");        
        	if(!emailAlreadyExists())
        	{
        		checkIfPasswordIsStrong();
        		checkIfEmailIsValid();
        		checkIfPasswordIsValid();
        		checkIfUsernameIsValid();
        	}
    }
    private void checkIfUsernameIsValid()
    {
    	pattern = Pattern.compile(USERNAME_PATTERN);
        matcher = pattern.matcher(view.getUsername());
        	if(!matcher.matches())
        		errors.reject("username", resource.getMsg("A0024"));
	}

	private void checkIfPasswordIsValid() 
    {
    	pattern = Pattern.compile(PASSWORD_PATTERN);
        matcher = pattern.matcher(view.getPassword());
        	if(!matcher.matches())
        		errors.reject("password", resource.getMsg("A0023"));
	}

	private void checkIfEmailIsValid()
    {
		pattern = Pattern.compile(EMAIL_PATTERN);
        matcher = pattern.matcher(view.getEmail());
        	if(!matcher.matches())
				errors.reject("email", resource.getMsg("A0022"));
	}

	private void checkIfPasswordIsStrong() 
    {
    		if(!userService.isPasswordValid(view.getPassword()))
    			errors.reject("password", resource.getMsg("A0019"));
	}

	private boolean emailAlreadyExists()
	{
			if(userService.findByEmail(view.getEmail()) != null)
			{
				errors.reject("email", resource.getMsg("A0002"));
				return true;
			}
		return false;
	}
}