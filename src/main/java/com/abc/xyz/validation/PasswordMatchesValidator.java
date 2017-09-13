package com.abc.xyz.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import com.abc.beans.dto.UserView;

public class PasswordMatchesValidator implements ConstraintValidator<PasswordMatches, Object> {

    @Override
    public void initialize(final PasswordMatches constraintAnnotation)
    {
        //
    }

    @Override
    public boolean isValid(final Object obj, final ConstraintValidatorContext context) {
    	System.out.println("\n\n\n\n==============\n\n\nPasswordMatchesValidator\n\n\n" + obj+"\n\n\n");
        final UserView user = (UserView) obj;
        return user.getPassword().equals(user.getMatchingPassword());
    }

}
