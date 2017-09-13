package com.abc.xyz.dto.mapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.abc.beans.common.DTOMapper;
import com.abc.beans.dto.UserView;
import com.abc.beans.model.User;

/**
 * @author amrit
 *
 */
@Component
public class UserMapper implements DTOMapper<User, UserView>
{
	@Autowired
	private UserRoleMapper userRoleMapper;
	
	public User getMappedEntity(UserView userView)
	{
		return mapEntity(new User(), userView);
	}
	
	public User mapEntity(User user, UserView userView)
	{
			if(userView == null)
				return null;
		user.setId(userView.getId());
		user.setEmail(userView.getEmail());
		user.setEnabled(userView.isEnabled());
		user.setFirstName(userView.getFirstName());
		user.setLastName(userView.getLastName());
		user.setPassword(userView.getPassword());
		user.setUsername(userView.getUsername());
		user.setVerificationToken(userView.getVerificationToken());
		user.setVerificationTokenDate(userView.getVerificationTokenDate());
		user.setPasswordResetToken(userView.getPasswordResetToken());
		user.setPasswordResetTokenDate(userView.getPasswordResetTokenDate());
		user.setUserRoles(userRoleMapper.getMappedUserRoles(userView.getUserRoleViews()));
		return user;
	}
	
	public UserView getMappedView(User user)
	{
		return mapView(new UserView(), user);
	}
	
	public UserView mapView(UserView userView, User user)
	{
			if(user == null)
				return null;
		userView.setEmail(user.getEmail());
		userView.setEnabled(user.isEnabled());
		userView.setFirstName(user.getFirstName());
		userView.setId(user.getId());
		userView.setLastName(user.getLastName());
		userView.setPassword(user.getPassword());
		userView.setUsername(user.getUsername());
		userView.setVerificationToken(user.getVerificationToken());
		userView.setVerificationTokenDate(user.getVerificationTokenDate());
		userView.setPasswordResetToken(user.getPasswordResetToken());
		userView.setPasswordResetTokenDate(user.getPasswordResetTokenDate());
		userView.setUserRoleViews(userRoleMapper.getMappedUserRoleViews(user.getUserRoles())); 
		return userView;
	}
}