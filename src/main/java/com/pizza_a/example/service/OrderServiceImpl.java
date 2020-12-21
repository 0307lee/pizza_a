package com.pizza_a.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pizza_a.example.domain.OrderVO;
import com.pizza_a.example.mapper.OrderMapper;

@Service("OrderServicelmpl")
public class OrderServiceImpl implements OrderService{

	@Autowired OrderMapper ordermapper;

	@Override
	public List<OrderVO> read_LastOrderItems_byusername(String username) {
		return ordermapper.read_LastOrderItems_byusername(username);
	}
	
	@Override
	public List<OrderVO> read_BasicOrderItems_byusername(String username) {
		return ordermapper.read_BasicOrderItems_byusername(username);
	}
	
	@Override
	public void makeOrder(String username) {
		ordermapper.makeOrder(username);
	};
	@Override
	public int StartOrder(String username) {
		return ordermapper.StartOrder(username);
	};
	
	@Override
	public void Stg2_1_setPizza_basic(OrderVO post) {
		ordermapper.Stg2_1_setPizza_basic(post);
	};
	@Override	
	public void erasePreparingOrder(String username) {
		ordermapper.erasePreparingOrder(username);
	};

	@Override
	public List<OrderVO> read_PresentOrderItems_byusername(String name){
		return ordermapper.read_PresentOrderItems_byusername(name);
	};

	@Override	
	public void Stg3_1_1_SetBasicAddress_deliver1_LastAddress(OrderVO post) {
		ordermapper.Stg3_1_1_SetBasicAddress_deliver1_LastAddress(post);
	};
	@Override	
	public void Stg3_1_1_SetBasicAddress_deliver1_AnotherAddress(OrderVO post) {
		ordermapper.Stg3_1_1_SetBasicAddress_deliver1_AnotherAddress(post);
	};
	
}
