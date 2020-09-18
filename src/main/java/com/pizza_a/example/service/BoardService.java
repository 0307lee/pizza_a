package com.pizza_a.example.service;

import java.util.List;

import com.pizza_a.example.domain.BoardVO;
import com.pizza_a.example.domain.UserVO;

public interface BoardService {
	public List<BoardVO> selectBoardList();
	
	public int getBoardListCount();
	
	public void writePostProcess(BoardVO post);

	public List<BoardVO> selectPost(int bId);

	public void deletePostProcess(BoardVO post);

}
