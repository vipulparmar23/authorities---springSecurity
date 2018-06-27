package com.springSecurtiy.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	
	// Add reference to security datasource
	
	@Autowired
	private DataSource securityDataSource;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		// jdbc authentication
		
		auth.jdbcAuthentication().dataSource(securityDataSource);
		
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.authorizeRequests()
			.antMatchers("/resources/**").permitAll() // adding resources path 
			.antMatchers("/").hasRole("EMPLOYEE") // Setting up access control depending user roles 
			.antMatchers("/leaders/**").hasRole("MANAGER") 
			.antMatchers("/systems/**").hasRole("ADMIN")
		//	.anyRequest().authenticated()
			.and()				
				.formLogin()	// Redirect for login
				.loginPage("/myLoginPage")	// Redirecting to custom login page
				.loginProcessingUrl("/authenticateTheUser") // URL that sends user to authentication process
				.permitAll() 
			.and()
			.logout().permitAll() 	
			.and()
			.exceptionHandling() // Exception if user is not authorized to access content
			.accessDeniedPage("/access-denied");
		
	}
}
