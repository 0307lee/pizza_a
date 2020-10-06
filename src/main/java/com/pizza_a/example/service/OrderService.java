package com.pizza_a.example.service;

import java.util.List;

import com.pizza_a.example.domain.OrderVO;

public interface OrderService {

	List<OrderVO> read_LastOrderItems_byusername(String username);
}
