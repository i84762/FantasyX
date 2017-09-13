package com.abc.xyz.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abc.beans.common.UserRoleEnum;
import com.abc.beans.dto.UserRoleView;
import com.abc.xyz.dao.UserRoleDao;
import com.abc.xyz.dto.mapper.UserRoleMapper;
import com.abc.xyz.service.UserRoleService;

/**
 * 
 * @author amrit
 * 
 */
@Service
public class UserRoleServiceImpl implements UserRoleService 
{
	@Autowired
	private UserRoleDao userRoleDao;
	
	@Autowired
	private UserRoleMapper userRoleMapper;

	@Override
	public UserRoleDao getDao()
	{
		return userRoleDao;
	}

	@Override
	public UserRoleMapper getMapper()
	{
		return userRoleMapper;
	}

	@Override
	public UserRoleView getByRole(UserRoleEnum value)
	{
		return userRoleMapper.getMappedView(userRoleDao.getByRole(value));
	}
}