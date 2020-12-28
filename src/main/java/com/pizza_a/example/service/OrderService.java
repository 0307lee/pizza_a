package com.pizza_a.example.service;

import java.util.List;

import com.pizza_a.example.domain.OrderVO;

public interface OrderService {

	public OrderVO read_LastOrderItems_byusername(String username);

	public void makeOrder(OrderVO orderVO);
	
	public int StartOrder(String username);
	
	public void Stg2_1_setPizza_basic(OrderVO post);

	public void erasePreparingOrder(String username);


	public OrderVO read_BasicOrderItems_byusername(String username);

//	public OrderVO Stg3_1_1_deliver1_LastAddress(OrderVO post);

	public OrderVO read_PresentOrderItems_byusername(String name);

	public void Stg3_1_1_SetBasicAddress_deliver1_LastAddress(OrderVO post);

	public void Stg3_1_1_SetBasicAddress_deliver1_AnotherAddress(OrderVO post);




}
