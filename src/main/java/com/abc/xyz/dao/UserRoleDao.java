package com.abc.xyz.dao;

import com.abc.beans.common.CoreDao;
import com.abc.beans.common.UserRoleEnum;
import com.abc.beans.model.UserRole;

/**
 * 
 * @author amrit
 * 
 */
public interface UserRoleDao extends CoreDao<UserRole>
{
	UserRole getByRole(UserRoleEnum value);
}
