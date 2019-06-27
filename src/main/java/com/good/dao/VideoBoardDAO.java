package com.good.dao;

import java.util.List;

import com.good.dto.VideoBoardVO;

public interface VideoBoardDAO {

	// 게시물 목록
	public List<VideoBoardVO> listAll() throws Exception;

	// 게시물 보기
	public VideoBoardVO view(int boardId) throws Exception;

	//글 쓰기
	public void insertVideoBoard(VideoBoardVO vo) throws Exception;

	//수정
	public void updateVideoBoard(VideoBoardVO vo) throws Exception;

	//삭제
	public void deleteVideoBoard(int boardId) throws Exception;

}
