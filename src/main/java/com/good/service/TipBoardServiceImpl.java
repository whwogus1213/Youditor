package com.good.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.TipBoardDAO;
import com.good.dto.Search;
import com.good.dto.TipBoardVO;

@Service
public class TipBoardServiceImpl implements TipBoardService {

	// 주입
	@Inject
	TipBoardDAO tipBoardDAO;

	// 게시물 목록 + 페이징 + 검색
	@Override
	public List<TipBoardVO> listAll(Search search) throws Exception {
		return tipBoardDAO.listAll(search);
	}

	// 게시물 상세보기
	@Override
	public TipBoardVO view(int boardId) throws Exception {
		tipBoardDAO.viewCount(boardId);
		return tipBoardDAO.view(boardId);
	}

	// 게시물 총 개수
	@Override
	public int getBoardListCnt(Search search) throws Exception {
		return tipBoardDAO.getBoardListCnt(search);
	}

	// 글쓰기
	@Override
	public void insertTipBoard(TipBoardVO vo) throws Exception {
		tipBoardDAO.insertTipBoard(vo);
	}

	// 수정
	@Override
	public void updateTipBoard(TipBoardVO vo) throws Exception {
		tipBoardDAO.updateTipBoard(vo);
	}

	// 삭제
	@Override
	public void deleteTipBoard(TipBoardVO vo) throws Exception {
		tipBoardDAO.deleteTipBoard(vo);
	}

	// 조회수
	@Override
	public void viewCount(int boardId) throws Exception {
		tipBoardDAO.viewCount(boardId);
	}

	@Override
	public List<TipBoardVO> newList() throws Exception {
		return tipBoardDAO.newList();
	}

}
