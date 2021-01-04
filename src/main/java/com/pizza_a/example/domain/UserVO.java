package com.pizza_a.example.domain;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class UserVO implements UserDetails {
//	vo need small letter
	
	private OrderVO orderVO; // join vo
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
	private int uAddPoint;


	private int uDisabled;// diffrent with isEnabled, isEnabled for Security  
		
	//for user_M
	private int MStoreId;

	//for user_address
	private int uAddressId;
	private int uBasicAddressId;
	
	//user payment
	private String uReceiptPhoneNumber;
	private int uPayMethodNumber;
	
	/////////////
	
	public OrderVO getOrderVO() {
		return orderVO;
	}
	public void setOrderVO(OrderVO orderVO) {
		this.orderVO = orderVO;
	}
	///
	
	
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
	public int getuAddPoint() {
		return uAddPoint;
	}
	public void setuAddPoint(int uAddPoint) {
		this.uAddPoint = uAddPoint;
	}

	//
	public int getuDisabled() {
		return uDisabled;
	}
	public void setuDisabled(int uDisabled) {
		this.uDisabled = uDisabled;
	}
	//


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

	//

	public String getuReceiptPhoneNumber() {
		return uReceiptPhoneNumber;
	}
	public void setuReceiptPhoneNumber(String uReceiptPhoneNumber) {
		this.uReceiptPhoneNumber = uReceiptPhoneNumber;
	}
	public int getuPayMethodNumber() {
		return uPayMethodNumber;
	}
	public void setuPayMethodNumber(int uPayMethodNumber) {
		this.uPayMethodNumber = uPayMethodNumber;
	}
	
	
	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", uName=" + uName + ", uDateTime=" + uDateTime
				+ ", authorities=" + authorities + ", isAccountNonExpired=" + isAccountNonExpired
				+ ", isAccountNonLocked=" + isAccountNonLocked + ", isCredentialNonExpired=" + isCredentialNonExpired
				+ ", isEnabled=" + isEnabled + "]";
	}
	

}