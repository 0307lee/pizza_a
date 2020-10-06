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
		return ordermapper.read_LastOrderItems_byusername();
	}

}