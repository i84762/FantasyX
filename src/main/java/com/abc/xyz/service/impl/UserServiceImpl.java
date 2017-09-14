package com.abc.xyz.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abc.beans.common.UserRoleEnum;
import com.abc.beans.dto.UserView;
import com.abc.beans.model.User;
import com.abc.beans.model.UserRole;
import com.abc.beans.model.VerificationToken;
import com.abc.xyz.common.UserSecurity;
import com.abc.xyz.dao.UserDao;
import com.abc.xyz.dao.VerificationTokenDao;
import com.abc.xyz.dto.mapper.UserMapper;
import com.abc.xyz.dto.mapper.UserRoleMapper;
import com.abc.xyz.service.UserRoleService;
import com.abc.xyz.service.UserService;

/**
 * @author amrit
 *
 */
@Service("userDetailsService")
public class UserServiceImpl implements UserService
{
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private UserMapper userMapper;	
	
	@Autowired
	private UserRoleMapper userRoleMapper;
	
	@Autowired
	private UserRoleService userRoleService;
	
	@Autowired
    private VerificationTokenDao verificationTokenDao;
	

	@Override
	public UserDao getDao()
	{
		return userDao;
	}

	@Override
	public UserMapper getMapper() 
	{
		return userMapper;
	}

	@Transactional(readOnly=true)
	@Override
	public UserSecurity loadUserByUsername(final String username) 
		throws UsernameNotFoundException
	{	
			if(username.isEmpty())
				throw new UsernameNotFoundException("Enter Username");
		User user = userDao.findByEmail(username);
			if(user == null)
			{
				throw new UsernameNotFoundException("User not found");
			}
		List<GrantedAuthority> authorities = buildUserAuthority(user.getUserRoles());
		UserSecurity userSecurity = buildUserForAuthentication(user, authorities);	
		userSecurity.setName(user.getUsername());
		return userSecurity;	
	}
	
	private UserSecurity buildUserForAuthentication(User user, 
		List<GrantedAuthority> authorities) 
	{
		return new UserSecurity(user.getEmail(), user.getPassword(), 
			user.isEnabled(), true, true, true, authorities);
	}

	private List<GrantedAuthority> buildUserAuthority(List<UserRole> userRoles) 
	{
		Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();
			for(UserRole userRole : userRoles)
				setAuths.add(new SimpleGrantedAuthority(userRole.getRole().getValue()));
		List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);
		return Result;
	}

	@Override
	public UserView findByUserName(String username)
	{
		com.abc.beans.model.User user = userDao.findByUserName(username);
		return user == null ? null : userMapper.getMappedView(user);
	}

	@Override
	public UserView findByEmail(String email)
	{
		com.abc.beans.model.User user = userDao.findByEmail(email);
		return user == null ? null : userMapper.getMappedView(user);
	}

	@Override
	public long addUser(UserView userView)
	{
		com.abc.beans.model.User user = userMapper.getMappedEntity(userView);
		List<UserRole> userRoles = new ArrayList();
		userRoles.add(userRoleMapper.getMappedEntity
								(userRoleService.getByRole(UserRoleEnum.ROLE_USER)));
		user.setUserRoles(userRoles);
		return userDao.save(user);		
	}

	@Override
	public void createPasswordResetTokenForUser(UserView userView, String token)
	{
		VerificationToken myToken = new VerificationToken(token, userMapper.getMappedEntity(userView));
        verificationTokenDao.save(myToken);		
	}

	@Override
	public UserView findByID(long id) 
	{		
		return userMapper.getMappedView(userDao.findByID(id));
	}

	@Override
	public void updateUser(UserView userView) 
	{		
		userDao.update(userMapper.getMappedEntity(userView));
	}

	@Override
	public void enableUser(long id, boolean enable)
	{
		User user = userDao.findByID(id);
		user.setEnabled(enable);
		user.setVerificationToken(null);
		userDao.update(user);
	}
	
	@Override
	public UserView getCurrentUser()
	{
			try
			{
				UserSecurity userSecurity = (UserSecurity) SecurityContextHolder
													.getContext()
													.getAuthentication()
													.getPrincipal();
				String email = userSecurity.getUsername();
				return findByEmail(email);
			}
			catch(Exception e)
			{
				return null;
			}
	}

	@Override
	public boolean validateUserVerificationToken(Long id, String token)
	{
		User user = userDao.findByID(id);		
		return token.equals(user.getVerificationToken());
	}

	@Override
	public boolean isPasswordValid(String password) 
	{
		return password.length() > 2;
	}

	@Override
	public boolean validateResetPasswordToken(Long id, String token) 
	{
		User user = userDao.findByID(id);
		return token.equals(user.getPasswordResetToken());
	}

	@Override
	public UserView findByCredentials(String loginId, String password)
	{
		return userMapper.getMappedView(userDao.findByCredentials(loginId, password));
	}
}