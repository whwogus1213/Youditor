package com.good.service;

import java.util.List;
import java.util.Map;

import com.good.dto.TipBoardVO;

public interface TipBoardService {

	// 게시물 목록
	public List<TipBoardVO> listAll() throws Exception;

	public TipBoardVO view(int boardId) throws Exception;

	//글 쓰기
	public void insertTipBoard(TipBoardVO vo) throws Exception;

	//수정
	public void updateTipBoard(TipBoardVO vo) throws Exception;

	//삭제
	public void deleteTipBoard(int boardId) throws Exception;
}
