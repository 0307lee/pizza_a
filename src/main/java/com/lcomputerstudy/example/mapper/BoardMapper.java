package com.lcomputerstudy.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lcomputerstudy.example.domain.BoardVO;

@Mapper
public interface BoardMapper {
	public List<BoardVO> selectBoardList();
	
	public int getBoardListCount();
	
	public void writePostProcess(BoardVO post);

	public List<BoardVO> selectPost(int bId);

	public List<BoardVO> updatePost(int bId);

	public void deletePostProcess(BoardVO post);

	public void addBoardViews(int bId);

}
