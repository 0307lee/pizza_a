package com.lcomputerstudy.example.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.lcomputerstudy.example.service.UserService;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled=true)
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	@Autowired
	private UserService userService;
	
	@Autowired
	private DataSource dataSource;
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception{

//All things consist of Class and Method
	//Right and Chk.Authorize
	 http
	 .authorizeRequests()
	 	.antMatchers("/user/**").authenticated()
	 	.antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
	 	.anyRequest().permitAll()
	 	.and()
	 	
//login
	 .formLogin()
	 	.loginPage("/login")
	 	.loginProcessingUrl("/loginPro")
	 	.defaultSuccessUrl("/",true)
	 	.permitAll()
	 	.and()
//logout
	 .logout()
	 	.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
	 	.logoutSuccessUrl("/")
	 	.invalidateHttpSession(true)
	 	.deleteCookies("JSESSIONID","remember-me")
	 	.and()
//remember or not
	 .rememberMe()
	 	.key("myWeb")
	 	.rememberMeParameter("remeber-me")
	 	.tokenValiditySeconds(86400)//1day
	 	.and()
//exceptionhanding
	 .exceptionHandling()
	 	.accessDeniedPage("/denied")
	 	.and()
//sesion
	 .sessionManagement()	
	 	.sessionCreationPolicy(SessionCreationPolicy.NEVER)
	 	.invalidSessionUrl("/login")
	 	.and()
//csrf
 	 .csrf().disable() //for test 
//	 .csrf()
	 ;
	 
	}
	
	@Bean
	public PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl db = new JdbcTokenRepositoryImpl(); 
		db.setDataSource(dataSource);
		return db;
	}
	
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userService).passwordEncoder(passwordEncoder());
	}
	
}
