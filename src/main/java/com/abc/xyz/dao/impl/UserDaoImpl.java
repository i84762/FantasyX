package com.abc.xyz.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.abc.beans.common.DaoSupport;
import com.abc.beans.dto.UserView;
import com.abc.beans.model.User;
import com.abc.xyz.dao.UserDao;

/**
 * 
 * @author amrit
 *
 */
@Repository
@Transactional
public class UserDaoImpl extends DaoSupport<User> implements UserDao
{
	@Override
	public Class<User> getEntity()
	{
		return User.class;
	}
	public User findByUserName(String username)
	{
		return findByParam("username", username);
	}
	@Override
	public User findByEmail(String email)
	{
		return findByParam("email", email); 
	}
	@Override
	public void enableUser(UserView userView, boolean value) 
	{		
	}
	@Override
	public User findByCredentials(String loginId, String password)
	{
		Criteria c = getSession().createCriteria(getEntity(), "u");
		c.add(Restrictions.eq("u.userName", loginId));
		c.add(Restrictions.eq("u.password", password));
		c.isReadOnly();		
		List<User> list = c.list();
		return list.isEmpty() ? null : list.get(0);
	}
}