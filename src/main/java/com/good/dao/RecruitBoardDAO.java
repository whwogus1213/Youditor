package com.good.dao;

import java.util.List;

import com.good.dto.RecruitBoardVO;
import com.good.dto.RecruitCategoryVO;

public interface RecruitBoardDAO {

	// 게시물 목록
	public List<RecruitBoardVO> listAll(RecruitCategoryVO rcvo) throws Exception;

	// 게시물 보기
	public RecruitBoardVO view(int boardId) throws Exception;

	// 글 쓰기
	public void insertRecruitBoard(RecruitBoardVO vo) throws Exception;

	// 수정
	public void updateRecruitBoard(RecruitBoardVO vo) throws Exception;

	// 삭제
	public void deleteRecruitBoard(int boardId) throws Exception;
	
	//조회수 증가
	public void viewCount(int boardId) throws Exception;

	// 게시물 갯수
	public int getBoardListCnt(RecruitCategoryVO rcvo) throws Exception;
}
