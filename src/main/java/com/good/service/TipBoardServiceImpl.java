package com.good.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.TipBoardDAO;
import com.good.dto.TipBoardVO;

@Service
public class TipBoardServiceImpl implements TipBoardService {

	// 주입
	@Inject
	TipBoardDAO tipBoardDAO;

	// 게시물 목록
	@Override
	public List<TipBoardVO> listAll() throws Exception {
		return tipBoardDAO.listAll();
	}

	// 게시물 읽기
	@Override
	public TipBoardVO view(int boardId) throws Exception {
		return tipBoardDAO.view(boardId);
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
	public void deleteTipBoard(int boardId) throws Exception {
		tipBoardDAO.deleteTipBoard(boardId);
	}

}
