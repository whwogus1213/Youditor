package com.good.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.VideoStarDAO;
import com.good.dto.VideoStarVO;

@Service
public class VideoStarServiceImpl implements VideoStarService {

	// 주입
	@Inject
	VideoStarDAO videoStarDAO;

	//평점
	@Override
	public void update1(int boardId) throws Exception {
		videoStarDAO.update1(boardId);
	}
	//평점
	@Override
	public void update2(int boardId) throws Exception {
		videoStarDAO.update2(boardId);
	}
	//평점
	@Override
	public void update3(int boardId) throws Exception {
		videoStarDAO.update3(boardId);
	}
	//평점
	@Override
	public void update4(int boardId) throws Exception {
		videoStarDAO.update4(boardId);
	}
	//평점
	@Override
	public void update5(int boardId) throws Exception {
		videoStarDAO.update5(boardId);
	}
	// 글쓰기
	@Override
	public void insert(VideoStarVO vo) throws Exception {
		videoStarDAO.insert(vo);
	}

}
