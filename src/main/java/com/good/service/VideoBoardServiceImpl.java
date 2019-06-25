package com.good.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.VideoBoardDAO;
import com.good.dto.VideoBoardVO;

@Service
public class VideoBoardServiceImpl implements VideoBoardService {

	@Inject
	VideoBoardDAO videoBoardDAO;
	// 게시물 목록
	@Override
	public List<VideoBoardVO> listAll() throws Exception {
		return videoBoardDAO.listAll();
	}
	@Override
	public VideoBoardVO view(int boardId) throws Exception {
		return videoBoardDAO.view(boardId);
	}

}
