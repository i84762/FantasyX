package com.abc.xyz.config;

import java.util.List;
import java.util.Properties;

import javax.xml.transform.Source;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.http.converter.ByteArrayHttpMessageConverter;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.ResourceHttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.http.converter.support.AllEncompassingFormHttpMessageConverter;
import org.springframework.http.converter.xml.SourceHttpMessageConverter;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

/**
 * @author amrit
 *
 */
@EnableWebMvc
@Configuration
@ComponentScan({ "com.abc.xyz" })
@PropertySource("classpath:/config/config.properties")
@EnableTransactionManagement
@Import({ SecurityConfig.class })
public class AppConfig extends WebMvcConfigurerAdapter
{
	private static final Logger logger = Logger.getLogger(AppConfig.class);
	
	@Autowired
    private Environment env;

	private Properties getHibernateProperties()
	{
		Properties prop = new Properties();
		prop.put("hibernate.format_sql", env.getProperty("hibernate.formatSql"));
		prop.put("hibernate.show_sql", env.getProperty("hibernate.showUrl"));
		prop.put("hibernate.dialect", env.getProperty("hibernate.dialect"));
		prop.put("hibernate.id.new_generator_mappings", env.getProperty("hibernate.id.new_generator_mappings"));
		prop.put("hibernate.enable_lazy_load_no_trans", "true");
		return prop;
	}
	
	@Bean
	public SessionFactory sessionFactory()
	{
		System.out.println("sessions\n\n\n\n");
		LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource());
		builder.scanPackages("com.abc.beans.model").addProperties(getHibernateProperties());
		return builder.buildSessionFactory();
	}
	@Bean(name = "dataSource")
	public BasicDataSource dataSource()
	{
		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName(env.getProperty("db.driverClassName"));
		ds.setUrl(env.getProperty("db.url"));
		ds.setUsername(env.getProperty("db.username"));
		ds.setPassword(env.getProperty("db.password"));
		return ds;
	}
    @Bean
    public JavaMailSenderImpl javaMailSenderImpl()
    {
        final JavaMailSenderImpl mailSenderImpl = new JavaMailSenderImpl();
	        try 
	        {
	            mailSenderImpl.setHost(env.getRequiredProperty("smtp.host"));
	            mailSenderImpl.setPort(env.getRequiredProperty("smtp.port", Integer.class));
	            mailSenderImpl.setProtocol(env.getRequiredProperty("smtp.protocol"));
	            mailSenderImpl.setUsername(env.getRequiredProperty("smtp.username"));
	            mailSenderImpl.setPassword(env.getRequiredProperty("smtp.password"));
	        } 
	        catch (IllegalStateException ise) 
	        {
	//            LOGGER.error("Could not resolve email.properties.  See email.properties.sample");
	//            throw ise;
	        	ise.printStackTrace();
	        }
        final Properties javaMailProps = new Properties();
        javaMailProps.put("mail.smtp.auth", true);
        javaMailProps.put("mail.smtp.starttls.enable", true);
        mailSenderImpl.setJavaMailProperties(javaMailProps);
        return mailSenderImpl;
    }
	@Bean
	public HibernateTransactionManager txManager() 
	{
		return new HibernateTransactionManager(sessionFactory());
	}	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry)
	{
        registry.addResourceHandler("/resources/**")
        		.addResourceLocations("/resources/");
        registry.addResourceHandler("/images/**")
				.addResourceLocations("/resources/images/");
        registry.addResourceHandler("/pages/**")
        .addResourceLocations("/pages/");
	}
	@Bean
	public InternalResourceViewResolver viewResolver()
	{
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/pages/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
    @Bean(name = "multipartResolver")
    public CommonsMultipartResolver resolver() 
    {    	
        return new CommonsMultipartResolver();
    }	
	@Bean(name = "messageSource")
	public ResourceBundleMessageSource messageSourceResourceBundle()
	{
		ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
		messageSource.setBasenames(
								"config/message",
								"config/label",
								"config/app"
								);
		return messageSource;
	}	
	@Override
    public void configureMessageConverters(List<HttpMessageConverter<?>> converters)
	{
        StringHttpMessageConverter stringConverter = new StringHttpMessageConverter();
        stringConverter.setWriteAcceptCharset(false);
        converters.add(new ByteArrayHttpMessageConverter());
        converters.add(stringConverter);
        converters.add(new ResourceHttpMessageConverter());
        converters.add(new SourceHttpMessageConverter<Source>());
        converters.add(new AllEncompassingFormHttpMessageConverter());
        converters.add(jackson2Converter());
    }
    @Bean
    public MappingJackson2HttpMessageConverter jackson2Converter() {
        MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();
        converter.setObjectMapper(objectMapper());
        return converter;
    }
    @Bean
    public ObjectMapper objectMapper() {
    	ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.enable(SerializationFeature.INDENT_OUTPUT);
        return objectMapper;
    }
}