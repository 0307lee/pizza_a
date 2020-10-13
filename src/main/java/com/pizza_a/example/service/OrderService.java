package com.pizza_a.example.service;

import java.util.List;

import com.pizza_a.example.domain.OrderVO;

public interface OrderService {

	public List<OrderVO> read_LastOrderItems_byusername(String username);

	public void makeOrder(String username);
	
	public int StartOrder(String username);
	
	public void Stg2_1_setPizza_basic(OrderVO post);



}
