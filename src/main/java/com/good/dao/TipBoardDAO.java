package com.good.dao;

import java.util.List;

import com.good.dto.SearchBoard;
import com.good.dto.TipBoardVO;
import com.good.dto.TipCategoryVO;

public interface TipBoardDAO {

	// 게시물 목록 + 페이징 + 검색
	public List<TipBoardVO> listAll(SearchBoard search) throws Exception;
	
	// 카테고리 정보 취득
	public TipCategoryVO getCatInfo(int categoryId) throws Exception;

	// 게시물 상세보기
	public TipBoardVO view(int boardId) throws Exception;

	// 게시물 총 갯수
	public int getBoardListCnt(SearchBoard search) throws Exception;

	// 글 쓰기
	public void insertTipBoard(TipBoardVO vo) throws Exception;

	// 수정
	public void updateTipBoard(TipBoardVO vo) throws Exception;

	// 삭제
	public void deleteTipBoard(TipBoardVO vo) throws Exception;

	// 조회수
	public void viewCount(int boardId) throws Exception;

	// 최신 게시물
	public List<TipBoardVO> newList() throws Exception;

}
