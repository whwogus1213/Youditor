package com.good.dao;

import java.util.List;

import com.good.dto.RecruitBoardVO;

public interface RecruitBoardDAO {

	// 게시물 목록
	public List<RecruitBoardVO> listAll() throws Exception;

	// 게시물 보기
	public RecruitBoardVO view(int boardId) throws Exception;

	// 글 쓰기
	public void insertRecruitBoard(RecruitBoardVO vo) throws Exception;

	// 수정
	public void updateRecruitBoard(RecruitBoardVO vo) throws Exception;

	// 삭제
	public void deleteRecruitBoard(int boardId) throws Exception;

}
