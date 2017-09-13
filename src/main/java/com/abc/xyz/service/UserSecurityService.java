package com.abc.xyz.service;

/**
 * 
 * @author amrit
 * 
 */
public interface UserSecurityService
{
    String validatePasswordResetToken(long id, String token);
}