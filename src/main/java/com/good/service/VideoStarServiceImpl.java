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
	public void update1(VideoStarVO vo) throws Exception {
		videoStarDAO.update1(vo);
	}
	//평점
	@Override
	public void update2(VideoStarVO vo) throws Exception {
		videoStarDAO.update2(vo);
	}
	//평점
	@Override
	public void update3(VideoStarVO vo) throws Exception {
		videoStarDAO.update3(vo);
	}
	//평점
	@Override
	public void update4(VideoStarVO vo) throws Exception {
		videoStarDAO.update4(vo);
	}
	//평점
	@Override
	public void update5(VideoStarVO vo) throws Exception {
		videoStarDAO.update5(vo);
	}
	// 글쓰기
	@Override
	public void insert(VideoStarVO vo) throws Exception {
		videoStarDAO.insert(vo);
	}

}
