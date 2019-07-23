package com.good.service;

import java.util.List;
import java.util.Map;

import com.good.dto.RecruitBoardVO;
import com.good.dto.RecruitCategoryVO;
import com.good.dto.SearchBoard;
import com.good.dto.VideoCategoryVO;

public interface RecruitBoardService {

	// 게시물 목록
	public List<RecruitBoardVO> listAll(SearchBoard search) throws Exception;
	
	// 카테고리 정보 취득
	public RecruitCategoryVO getCatInfo(int categoryId) throws Exception;

	// 게시물 갯수
	public int getBoardListCnt(SearchBoard search) throws Exception;
	
	// 게시물 보기
	public RecruitBoardVO view(int boardId) throws Exception;

	// 글 쓰기
	public void insertRecruitBoard(RecruitBoardVO vo) throws Exception;

	// 수정
	public void updateRecruitBoard(RecruitBoardVO vo) throws Exception;

	// 삭제
	public void deleteRecruitBoard(int boardId) throws Exception;
	
}
