package com.good.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.RecruitBoardDAO;
import com.good.dto.RecruitBoardVO;

@Service
public class RecruitBoardServiceImpl implements RecruitBoardService {

	@Inject
	RecruitBoardDAO recruitBoardDAO;
	// 게시물 목록
	@Override
	public List<RecruitBoardVO> listAll() throws Exception {
		return recruitBoardDAO.listAll();
	}
	@Override
	public RecruitBoardVO view(int boardId) throws Exception {
		return recruitBoardDAO.view(boardId);
	}

}
