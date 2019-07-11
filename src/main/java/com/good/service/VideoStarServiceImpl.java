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

	// 게시물 목록
	@Override
	public List<VideoStarVO> listAll() throws Exception {

		System.out.println("serviceimpl test");
		return videoStarDAO.listAll();
	}
	
	//평점
	@Override
	public void update(VideoStarVO vo) throws Exception {
		videoStarDAO.update(vo);
	}
	
	// 글쓰기
	@Override
	public void insert(VideoStarVO vo) throws Exception {
		videoStarDAO.insert(vo);
	}

	@Override
	public int starload(VideoStarVO vo) throws Exception {
		return videoStarDAO.starload(vo);
	}
	
	@Override
	public int starSum(VideoStarVO vo) throws Exception {
		return videoStarDAO.starSum(vo);
	}

	@Override
	public int starCheck(int accountId, int boardId) throws Exception {
		return videoStarDAO.starCheck(accountId, boardId);
		
	}

}
