package com.abc.xyz.service.impl;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abc.beans.model.User;
import com.abc.beans.model.VerificationToken;
import com.abc.xyz.dao.VerificationTokenDao;
import com.abc.xyz.service.UserSecurityService;

/**
 * 
 * @author amrit
 * 
 */
@Service
public class UserSecurityServiceImpl implements UserSecurityService
{
	
	@Autowired
	private VerificationTokenDao passwordTokenRepository;
	
	@Autowired
	private UserDetailsService userDetailsService;

	@Override
	public String validatePasswordResetToken(long id, String token) 
	{
	    final VerificationToken passToken = passwordTokenRepository.findByToken(token);
		    if ((passToken == null) || (passToken.getUser().getId() != id))
		        return "invalidToken";		  
	    final Calendar cal = Calendar.getInstance();
		    if ((passToken.getExpiryDate().getTime() - cal.getTime().getTime()) <= 0)
		        return "expired";	    
	    final User user = passToken.getUser();
	    final Authentication auth = 
	    		new UsernamePasswordAuthenticationToken(
	    				user, 
	    				null, 
	    				userDetailsService.loadUserByUsername(user.getUsername()).getAuthorities()
	    				);
	    SecurityContextHolder.getContext().setAuthentication(auth);
	    return null;
	}
}
