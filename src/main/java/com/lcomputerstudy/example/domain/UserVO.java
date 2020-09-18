package com.lcomputerstudy.example.domain;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class UserVO implements UserDetails {

	private static final long serialVersionUID=1L;
	/*	  `u_id` varchar(50) NOT NULL,
		  `u_password` varchar(200) DEFAULT NULL,
		  `u_name` varchar(50) DEFAULT NULL,
		  `u_datetime` datetime DEFAULT current_timestamp(),
		  `u_isAccountNonExpired` tinyint(4) DEFAULT NULL,
		  `u_isAccountNonLocked` tinyint(4) DEFAULT NULL,
		  `u_isCredentialNonExpired` tinyint(4) DEFAULT NULL,
		  `u_isEnabled` tinyint(4) DEFAULT NULL,
	 */
	private String username;
	private String password;
	private String uName;
	private String uDateTime;
	
	//security Setting
	private Collection<? extends GrantedAuthority> authorities;
	
	private boolean isAccountNonExpired;
	private boolean isAccountNonLocked;
	private boolean isCredentialNonExpired;
	private boolean isEnabled;

	//
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	//
	public String getDateTime() {
		return uDateTime;
	}
	public void setDateTime(String uDateTime) {
		this.uDateTime = uDateTime;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setAccoutNonExpired(boolean isAccountNonExpired) {
		this.isAccountNonExpired = isAccountNonExpired;
	}

	public void setAccountNonLocked(boolean isAccountNonLocked) {
		this.isAccountNonLocked = isAccountNonLocked;
	}
	public void setCredentialNonExpired(boolean isCredentialNonExpired) {
		this.isCredentialNonExpired = isCredentialNonExpired;
	}
	public void setEnabled(boolean isEnabled) {
		this.isEnabled = isEnabled;
	}
	public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
		this.authorities = authorities;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities(){
		return authorities;
	}
	
	@Override
	public String getPassword() {
		return password;
	}

	@Override
	public String getUsername() {
		return username;
	}

	@Override
	public boolean isAccountNonExpired() {
		return isAccountNonExpired;
	}
	
	@Override
	public boolean isAccountNonLocked() {
		return isAccountNonLocked;
	}
	
	@Override
	public boolean isCredentialsNonExpired() {
		return isCredentialNonExpired;
	}

	@Override
	public boolean isEnabled() {
		return isEnabled;
	}
	
	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", uName=" + uName + ", uDateTime=" + uDateTime
				+ ", authorities=" + authorities + ", isAccountNonExpired=" + isAccountNonExpired
				+ ", isAccountNonLocked=" + isAccountNonLocked + ", isCredentialNonExpired=" + isCredentialNonExpired
				+ ", isEnabled=" + isEnabled + "]";
	}
}