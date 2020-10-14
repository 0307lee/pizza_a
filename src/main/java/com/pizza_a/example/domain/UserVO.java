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
	private String u_address1;
	private int u_zipcode1;
	private int storeId1;
	private String u_address2;
	private int u_zipcode2;
	private int storeId2;
	private String u_address3;
	private int u_zipcode3;
	private int storeId3;
	
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
	public String getU_address1() {
		return u_address1;
	}
	public void setU_address1(String u_address1) {
		this.u_address1 = u_address1;
	}
	public int getU_zipcode1() {
		return u_zipcode1;
	}
	public void setU_zipcode1(int u_zipcode1) {
		this.u_zipcode1 = u_zipcode1;
	}
	public int getStoreId1() {
		return storeId1;
	}
	public void setStoreId1(int storeId1) {
		this.storeId1 = storeId1;
	}
	public String getU_address2() {
		return u_address2;
	}
	public void setU_address2(String u_address2) {
		this.u_address2 = u_address2;
	}
	public int getU_zipcode2() {
		return u_zipcode2;
	}
	public void setU_zipcode2(int u_zipcode2) {
		this.u_zipcode2 = u_zipcode2;
	}
	public int getStoreId2() {
		return storeId2;
	}
	public void setStoreId2(int storeId2) {
		this.storeId2 = storeId2;
	}
	public String getU_address3() {
		return u_address3;
	}
	public void setU_address3(String u_address3) {
		this.u_address3 = u_address3;
	}
	public int getU_zipcode3() {
		return u_zipcode3;
	}
	public void setU_zipcode3(int u_zipcode3) {
		this.u_zipcode3 = u_zipcode3;
	}
	public int getStoreId3() {
		return storeId3;
	}
	public void setStoreId3(int storeId3) {
		this.storeId3 = storeId3;
	}
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