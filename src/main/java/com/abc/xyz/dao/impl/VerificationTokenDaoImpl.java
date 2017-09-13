package com.abc.xyz.dao.impl;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.abc.beans.common.DaoSupport;
import com.abc.beans.model.User;
import com.abc.beans.model.VerificationToken;
import com.abc.xyz.dao.VerificationTokenDao;

/**
 * 
 * @author amrit
 * 
 */
@Repository
@Transactional
public class VerificationTokenDaoImpl extends DaoSupport<VerificationToken> implements VerificationTokenDao
{	
	@Override
	public Class<VerificationToken> getEntity()
	{
		return VerificationToken.class;
	}
	
	@Override
	public VerificationToken findByToken(String token)
	{
		return findByParam("TOKEN", token);
	}

	@Override
	public VerificationToken findByUser(User user) 
	{		
		return findByParam("USER", user);
	}

	@Override
	public List<VerificationToken> findAllByExpiryDateLessThan(Date now) 
	{		
		return null;
	}

	@Override
	public void deleteByExpiryDateLessThan(Date now)
	{		
		
	}

	@Override
	public void deleteAllExpiredSince(Date now)
	{				
	}
}