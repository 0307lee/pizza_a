package com.pizza_a.example.domain;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;

public class PizzaVO {
	private int		P_Id;
	private int		P_cheese;
	private String	U_Id;
	private String	P_DateTime;
	private	int		P_Cnt_TOTAL_Pizza;

//	private String	bTitle;
//	private String	bContent;
//	private String 	uId;
//	private int		bDisabled;
//	private int		bViews;
	
	public int getP_Id() {
		return P_Id;
	}
	public void setP_Id(int p_Id) {
		P_Id = p_Id;
	}
	public int getP_cheese() {
		return P_cheese;
	}
	public void setP_cheese(int p_cheese) {
		P_cheese = p_cheese;
	}
	public String getU_Id() {
		return U_Id;
	}
	public void setU_Id(String u_Id) {
		U_Id = u_Id;
	}
	public String getP_DateTime() {
		return P_DateTime;
	}
	public void setP_DateTime(String p_DateTime) {
		P_DateTime = p_DateTime;
	}
	public int getP_Cnt_TOTAL_Pizza() {
		return P_Cnt_TOTAL_Pizza;
	}
	public void setP_Cnt_TOTAL_Pizza(int p_Cnt_TOTAL_Pizza) {
		P_Cnt_TOTAL_Pizza = p_Cnt_TOTAL_Pizza;
	}

	

	
	
}
