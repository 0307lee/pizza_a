package com.pizza_a.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pizza_a.example.domain.BoardVO;
import com.pizza_a.example.mapper.BoardMapper;

@Service("BoardServicelmpl")
public class BoardServiceImpl implements BoardService{

	@Autowired BoardMapper boardmapper;
	
	@Override
	public List<BoardVO> selectBoardList() {
		return boardmapper.selectBoardList();
	}
	
	@Override
	public int getBoardListCount() {
		return boardmapper.getBoardListCount();
		//TODO pagination
		//pagination Need Another CLASS
	}

	@Override
	public void writePostProcess(BoardVO post) {
		boardmapper.writePostProcess(post);
	}

	@Override
	public List<BoardVO> selectPost(int bId) {
		boardmapper.addBoardViews(bId);
		return boardmapper.selectPost(bId);
	}

	@Override
	public void deletePostProcess(BoardVO post) {
		boardmapper.deletePostProcess(post);
	}

}
