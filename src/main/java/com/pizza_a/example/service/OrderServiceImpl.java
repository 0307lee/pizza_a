package com.pizza_a.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pizza_a.example.domain.OrderVO;
import com.pizza_a.example.mapper.OrderMapper;

@Service("PizzaServicelmpl")
public class OrderServiceImpl implements OrderService{

	@Autowired OrderMapper ordermapper;
	
	@Override
	public OrderVO readLastOrderInfo() {
		//get pizza size/quantity/price in order_items by ordermapper.xml
		//
		return null;
	}



}
