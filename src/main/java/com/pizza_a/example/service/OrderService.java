package com.pizza_a.example.service;

import java.util.List;

import com.pizza_a.example.domain.OrderVO;

public interface OrderService {

	public List<OrderVO> read_LastOrderItems_byusername(String username);

	public void makeOrder(String username);
	
	public int StartOrder(String username);
	
	public void Stg2_1_setPizza_basic(OrderVO post);

	public void erasePreparingOrder(String username);


//	public OrderVO Stg3_1_1_deliver1_LastAddress(OrderVO post);

	public List<OrderVO> read_PresentOrderItems_byusername(String name);

	public void Stg3_1_1_SetAddress_deliver1_LastAddress(OrderVO post);

	public void Stg3_1_1_SetAddress_deliver1_AnotherAddress(OrderVO post);

	



}
