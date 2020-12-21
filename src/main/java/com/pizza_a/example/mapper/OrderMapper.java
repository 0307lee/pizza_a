package com.pizza_a.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pizza_a.example.domain.OrderVO;

@Mapper
public interface OrderMapper {
	List<OrderVO> read_LastOrderItems_byusername(String username);

	void makeOrder(String username);
	
	int StartOrder(String username);

	void Stg2_1_setPizza_basic(OrderVO post);

	List<OrderVO> read_LastOrderInfo_byusername();

	void erasePreparingOrder(String username);

	List<OrderVO> read_PresentOrderItems_byusername(String name);

	void Stg3_1_1_SetBasicAddress_deliver1_LastAddress(OrderVO post);

	void Stg3_1_1_SetBasicAddress_deliver1_AnotherAddress(OrderVO post);

	List<OrderVO> read_BasicOrderItems_byusername(String username);

}
