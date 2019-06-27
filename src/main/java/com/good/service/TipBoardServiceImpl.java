package com.good.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.TipBoardDAO;
import com.good.dto.TipBoardVO;

@Service
public class TipBoardServiceImpl implements TipBoardService {

	@Inject
	TipBoardDAO tipBoardDAO;
	// 게시물 목록
	@Override
	public List<TipBoardVO> listAll() throws Exception {
		return tipBoardDAO.listAll();
	}
	@Override
	public TipBoardVO view(int boardId) throws Exception {
		return tipBoardDAO.view(boardId);
	}

}
