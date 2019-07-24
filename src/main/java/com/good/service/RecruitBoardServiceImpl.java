package com.good.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.RecruitBoardDAO;
import com.good.dto.RecruitBoardVO;
import com.good.dto.RecruitCategoryVO;
import com.good.dto.SearchBoard;
import com.good.dto.VideoCategoryVO;

@Service
public class RecruitBoardServiceImpl implements RecruitBoardService {

	// 주입
	@Inject
	RecruitBoardDAO recruitBoardDAO;

	// 게시물 목록
	@Override
	public List<RecruitBoardVO> listAll(SearchBoard search) throws Exception {
		return recruitBoardDAO.listAll(search);
	}
	
	// 카테고리 정보 취득
	@Override
	public RecruitCategoryVO getCatInfo(int categoryId) throws Exception {
		return recruitBoardDAO.getCatInfo(categoryId);
	}
	
	// 게시물 갯수
	@Override
	public int getBoardListCnt(SearchBoard search) throws Exception {
		return recruitBoardDAO.getBoardListCnt(search);
	}

	// 게시물 읽기
	@Override
	public RecruitBoardVO view(int boardId) throws Exception {
		recruitBoardDAO.viewCount(boardId);
		return recruitBoardDAO.view(boardId);
	}

	// 글쓰기
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
	@Override
	public List<RecruitBoardVO> rankList1() throws Exception {
		return recruitBoardDAO.rankList1();
	}
	@Override
	public List<RecruitBoardVO> rankList2() throws Exception {
		return recruitBoardDAO.rankList2();
	}
	
}
