package com.abc.xyz.dto.mapper;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.abc.beans.common.DTOMapper;
import com.abc.beans.dto.UserRoleView;
import com.abc.beans.model.UserRole;

/**
 * @author amrit
 *
 */
@Component
public class UserRoleMapper implements DTOMapper<UserRole, UserRoleView>
{
	
	public UserRole getMappedEntity(UserRoleView userRoleView)
	{
		return mapEntity(new UserRole(), userRoleView);
	}
	 
	public UserRole mapEntity(UserRole userRole, UserRoleView userRoleView)
	{
		userRole.setDescription(userRoleView.getDescription());
		userRole.setId(userRoleView.getId());
		userRole.setRole(userRoleView.getRole());
		return userRole;
	}
	
	public UserRoleView getMappedView(UserRole userRole)
	{
		return mapView(new UserRoleView(), userRole);
	}
	
	public UserRoleView mapView(UserRoleView userRoleView, UserRole userRole)
	{
		userRoleView.setDescription(userRole.getDescription());
		userRoleView.setId(userRole.getId());
		userRoleView.setRole(userRole.getRole());
		return userRoleView;
	}
	
	public List<UserRoleView> getMappedUserRoleViews(List<UserRole> userRoles)
	{
		List<UserRoleView> views = new ArrayList();
			for(UserRole userRole : userRoles)
				views.add(getMappedView(userRole));
		return views;
	}
	
	public List<UserRole> getMappedUserRoles(List<UserRoleView> userRoleViews)
	{
		List<UserRole> roles = new ArrayList();
			for(UserRoleView roleView : userRoleViews)
				roles.add(getMappedEntity(roleView));
		return roles;
	}
}
