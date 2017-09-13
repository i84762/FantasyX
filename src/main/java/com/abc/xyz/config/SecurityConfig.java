package com.abc.xyz.config;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.authentication.rememberme.TokenBasedRememberMeServices;

//import com.abc.xyz.common.UserRoleEnum;

/**
 * @author amrit
 *
 */
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter
{

	@Autowired
	@Qualifier("userDetailsService")
	private UserDetailsService userDetailsService;
	
	@Autowired
	@Qualifier("dataSource")
	private BasicDataSource dataSource;

	@Bean(name="myAuthenticationManager")
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception 
	{
       return super.authenticationManagerBean();
	}
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception
	{
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception 
	{
	    http.authorizeRequests()
//	    .antMatchers("/1/**").access("hasRole('"+UserRoleEnum.ROLE_USER.getValue()+"')")
	    .and().formLogin()
	    .loginPage("/login").failureUrl("/login?error")
		.usernameParameter("email")
		.passwordParameter("password")
		.and().logout().logoutSuccessUrl("/login?logout")
		.and().csrf()
		.and().formLogin().defaultSuccessUrl("/")
		.and().exceptionHandling().accessDeniedPage("/403")
		.and().rememberMe()
		.tokenRepository(persistentTokenRepository())
		.key("rem-me-key")
		.rememberMeParameter("rememberMe")
		.rememberMeCookieName("my-remember-me")
		.tokenValiditySeconds(86400 * 4); // 4 days
//		.and().headers().frameOptions().sameOrigin().disable();
	}
	
	@Bean(name = "rememberMeServices")
	public TokenBasedRememberMeServices rememberMeServices()
	{
		TokenBasedRememberMeServices services = new TokenBasedRememberMeServices("rememberMe", userDetailsService);
		return services;
	}
	
	@Bean
	public PersistentTokenRepository persistentTokenRepository() 
	{
		JdbcTokenRepositoryImpl tokenRepository = new JdbcTokenRepositoryImpl();
		tokenRepository.setDataSource(dataSource);
		return tokenRepository;
	}
	
	@Bean
	public PasswordEncoder passwordEncoder()
	{
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
	}	
}