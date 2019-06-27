package com.good.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.RecruitBoardDAO;
import com.good.dto.RecruitBoardVO;

@Service
public class RecruitBoardServiceImpl implements RecruitBoardService {

	// 주입
	@Inject
	RecruitBoardDAO recruitBoardDAO;

	// 게시물 목록
	@Override
	public List<RecruitBoardVO> listAll() throws Exception {
		return recruitBoardDAO.listAll();
	}

	// 게시물 읽기
	@Override
	public RecruitBoardVO view(int boardId) throws Exception {
		return recruitBoardDAO.view(boardId);
	}

	//글쓰기
	@Override
	public void insertRecruitBoard(RecruitBoardVO vo) throws Exception {
		recruitBoardDAO.insertRecruitBoard(vo);
	}

	 // 수정
	 @Override
	 public void updateRecruitBoard(RecruitBoardVO vo) throws Exception {
		 recruitBoardDAO.updateRecruitBoard(vo);
	 }

	 // 삭제
	 @Override
	 public void deleteRecruitBoard(int boardId) throws Exception {
		 recruitBoardDAO.deleteRecruitBoard(boardId);
	 }

}
