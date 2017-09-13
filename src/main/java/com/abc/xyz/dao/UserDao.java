package com.abc.xyz.dao;

import com.abc.beans.common.CoreDao;
import com.abc.beans.dto.UserView;
import com.abc.beans.model.User;


public interface UserDao extends CoreDao<User>
{
	User findByUserName(String username);
	User findByEmail(String email);	
	void enableUser(UserView userView, boolean value);
}