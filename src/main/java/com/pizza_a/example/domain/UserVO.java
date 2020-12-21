package com.pizza_a.example.domain;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class UserVO implements UserDetails {
//	vo need small letter
	//user Basic Info
	private static final long serialVersionUID=1L;
	private String username;
	private String password;
	private String uName;
	private String uPhone;
	private String uDateTime;
	
	//security Setting
	private Collection<? extends GrantedAuthority> authorities;
	private boolean isAccountNonExpired;
	private boolean isAccountNonLocked;
	private boolean isCredentialNonExpired;
	private boolean isEnabled;

	//user Addition Info
	private int uLevel;
	

	private int uDisabled;// diffrent with isEnabled, isEnabled for Security  
	
	
	//user Ordering Info
	private String uAddress1;
	private int uZipcode1;
	private int uStoreId1;
	private String uStoreName1;
	
	//for user_M
	private int MStoreId;

	//for user_address
	private int uAddressId;
	private int uBasicAddressId;
	
	
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
	public String getuPhone() {
		return uPhone;
	}
	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
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
	public String getuDateTime() {
		return uDateTime;
	}
	public void setuDateTime(String uDateTime) {
		this.uDateTime = uDateTime;
	}
	public int getuLevel() {
		return uLevel;
	}
	public void setuLevel(int uLevel) {
		this.uLevel = uLevel;
	}
	public int getuDisabled() {
		return uDisabled;
	}
	public void setuDisabled(int uDisabled) {
		this.uDisabled = uDisabled;
	}
	//
	public String getuAddress1() {
		return uAddress1;
	}
	public void setuAddress1(String uAddress1) {
		this.uAddress1 = uAddress1;
	}
	public int getuZipcode1() {
		return uZipcode1;
	}
	public void setuZipcode1(int uZipcode1) {
		this.uZipcode1 = uZipcode1;
	}
	public int getuStoreId1() {
		return uStoreId1;
	}
	public void setuStoreId1(int uStoreId1) {
		this.uStoreId1 = uStoreId1;
	}

	public String getuStoreName1() {
		return uStoreName1;
	}
	public void setuStoreName1(String uStoreName1) {
		this.uStoreName1 = uStoreName1;
	}


	//
	public int getMStoreId() {
		return MStoreId;
	}
	public void setMStoreId(int mStoreId) {
		MStoreId = mStoreId;
	}

	//
	public int getuAddressId() {
		return uAddressId;
	}
	public void setuAddressId(int uAddressId) {
		this.uAddressId = uAddressId;
	}
	public int getuBasicAddressId() {
		return uBasicAddressId;
	}
	public void setuBasicAddressId(int uBasicAddressId) {
		this.uBasicAddressId = uBasicAddressId;
	}

	
	
	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", uName=" + uName + ", uDateTime=" + uDateTime
				+ ", authorities=" + authorities + ", isAccountNonExpired=" + isAccountNonExpired
				+ ", isAccountNonLocked=" + isAccountNonLocked + ", isCredentialNonExpired=" + isCredentialNonExpired
				+ ", isEnabled=" + isEnabled + "]";
	}

}