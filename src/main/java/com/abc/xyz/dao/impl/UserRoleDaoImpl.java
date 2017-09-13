package com.abc.xyz.dao.impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.abc.beans.common.DaoSupport;
import com.abc.beans.common.UserRoleEnum;
import com.abc.beans.model.UserRole;
import com.abc.xyz.dao.UserRoleDao;

/**
 * 
 * @author amrit
 * 
 */
@Repository
@Transactional
public class UserRoleDaoImpl extends DaoSupport<UserRole> implements UserRoleDao
{
	@Override
	public Class<UserRole> getEntity()
	{
		return UserRole.class;
	}
	
	@Override
	public UserRole getByRole(UserRoleEnum value) 
	{
		return findByParam("role", value);
	}
}
