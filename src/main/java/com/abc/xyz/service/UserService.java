package com.abc.xyz.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.abc.beans.common.CoreService;
import com.abc.beans.dto.UserView;
import com.abc.beans.model.User;
import com.abc.xyz.dao.UserDao;
import com.abc.xyz.dto.mapper.UserMapper;

/**
 * 
 * @author amrit
 * 
 */
public interface UserService extends UserDetailsService, CoreService<UserView, 
																	User, 
																	UserDao, 
																	UserMapper>
{
	UserView findByUserName(String username);
	UserView findByEmail(String email);
	UserView findByCredentials(String loginId, String password);
	
	long addUser(UserView userView);
	void createPasswordResetTokenForUser(UserView userView, String token);
	UserView findByID(long id);
	void updateUser(UserView userView);
	void enableUser(long id, boolean enable);
	UserView getCurrentUser();
	boolean validateUserVerificationToken(Long id, String token);
	boolean validateResetPasswordToken(Long id, String token);
	boolean isPasswordValid(String password);
}
