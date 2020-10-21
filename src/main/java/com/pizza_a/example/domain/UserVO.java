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
	private String uAddress2;
	private int uZipcode2;
	private int uStoreId2;
	private String uStoreName2;
	private String uAddress3;
	private int uZipcode3;
	private int uStoreId3;
	private String uStoreName3;
	
	//for user_M
	private int MStoreId;
	
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
	public String getuAddress2() {
		return uAddress2;
	}
	public void setuAddress2(String uAddress2) {
		this.uAddress2 = uAddress2;
	}
	public int getuZipcode2() {
		return uZipcode2;
	}
	public void setuZipcode2(int uZipcode2) {
		this.uZipcode2 = uZipcode2;
	}
	public int getuStoreId2() {
		return uStoreId2;
	}
	public void setuStoreId2(int uStoreId2) {
		this.uStoreId2 = uStoreId2;
	}
	public String getuAddress3() {
		return uAddress3;
	}
	public void setuAddress3(String uAddress3) {
		this.uAddress3 = uAddress3;
	}
	public int getuZipcode3() {
		return uZipcode3;
	}
	public void setuZipcode3(int uZipcode3) {
		this.uZipcode3 = uZipcode3;
	}
	public int getuStoreId3() {
		return uStoreId3;
	}
	public void setuStoreId3(int uStoreId3) {
		this.uStoreId3 = uStoreId3;
	}
	public String getuStoreName1() {
		return uStoreName1;
	}
	public void setuStoreName1(String uStoreName1) {
		this.uStoreName1 = uStoreName1;
	}
	public String getuStoreName2() {
		return uStoreName2;
	}
	public void setuStoreName2(String uStoreName2) {
		this.uStoreName2 = uStoreName2;
	}
	public String getuStoreName3() {
		return uStoreName3;
	}
	public void setuStoreName3(String uStoreName3) {
		this.uStoreName3 = uStoreName3;
	}

	//
	public int getMStoreId() {
		return MStoreId;
	}
	public void setMStoreId(int mStoreId) {
		MStoreId = mStoreId;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", uName=" + uName + ", uDateTime=" + uDateTime
				+ ", authorities=" + authorities + ", isAccountNonExpired=" + isAccountNonExpired
				+ ", isAccountNonLocked=" + isAccountNonLocked + ", isCredentialNonExpired=" + isCredentialNonExpired
				+ ", isEnabled=" + isEnabled + "]";
	}

}