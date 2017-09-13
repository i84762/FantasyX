package com.abc.xyz.config;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;

/**
 * 
 * @author amrit
 * 
 */
@Component
public class Resource 
{
	@Autowired
	private MessageSource messages;
	
	private Map<String, Object> resourceMap = new HashMap()
	{{
		put("Locale", Locale.ENGLISH);
		
	}};
	
	public <T> T get(String key)
	{
			if(key == null || key.isEmpty() || !resourceMap.containsKey(key))
				return null;
		return  (T) resourceMap.get(key);
	}
	
	public String getMsg(String key)
	{
		return getMsg(key, null);
	}
	
	public String getMsg(String key, Object []args)
	{
		return getMsg(key, args, get("Locale"));
	}
	
	public String getMsg(String key, Object []args, Locale locale)
	{
		return messages.getMessage(key, args, locale);
	}
	
}
