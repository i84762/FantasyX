package com.abc.xyz.service;

import com.abc.beans.common.CoreService;
import com.abc.beans.common.UserRoleEnum;
import com.abc.beans.dto.UserRoleView;
import com.abc.beans.model.UserRole;
import com.abc.xyz.dao.UserRoleDao;
import com.abc.xyz.dto.mapper.UserRoleMapper;

/**
 * 
 * @author amrit
 * 
 */
public interface UserRoleService extends CoreService<UserRoleView, 
													UserRole, 
													UserRoleDao, 
													UserRoleMapper>
{
	UserRoleView getByRole(UserRoleEnum value);
}
