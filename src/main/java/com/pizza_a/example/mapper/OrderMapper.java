package com.pizza_a.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.pizza_a.example.domain.BoardVO;
import com.pizza_a.example.domain.OrderVO;

@Mapper
public interface OrderMapper {
	public List<BoardVO> selectBoardList();
	
	public int getBoardListCount();
	
	public void writePostProcess(BoardVO post);

	public List<BoardVO> selectPost(int bId);

	public List<BoardVO> updatePost(int bId);

	public void deletePostProcess(BoardVO post);

	public void addBoardViews(int bId);
	
	public List<BoardVO> pizzainfo();
}
