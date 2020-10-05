package com.pizza_a.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pizza_a.example.domain.OrderVO;

@Mapper
public interface OrderMapper {
	List<OrderVO> read_LastOrderItems_byusername();

}
