package com.pizza_a.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pizza_a.example.domain.OrderVO;

@Mapper
public interface OrderMapper {
	OrderVO read_LastOrderItems_byusername(String username);

	void makeOrder(OrderVO username);
	
	int StartOrder(String username);

	void Stg2_1_setPizza_basic(OrderVO post);

	OrderVO read_LastOrderInfo_byusername();

	void erasePreparingOrder(String username);

	OrderVO read_PresentOrderItems_byusername(String name);

	void Stg3_1_1_SetBasicAddress_deliver1_LastAddress(OrderVO post);

	void Stg3_1_1_SetBasicAddress_deliver1_AnotherAddress(OrderVO post);

	OrderVO read_BasicOrderItems_byusername(String username);

	public OrderVO read_Address_byusername(String username);
}
