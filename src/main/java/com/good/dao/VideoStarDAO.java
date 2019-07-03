package com.good.dao;

import java.util.List;

import com.good.dto.VideoStarVO;

public interface VideoStarDAO {

	//평점
	public void insert(VideoStarVO vo) throws Exception;
	
	//평점 주는 기능
	public void update1(VideoStarVO vo) throws Exception;
	//평점 주는 기능
	public void update2(VideoStarVO vo) throws Exception;
	//평점 주는 기능
	public void update3(VideoStarVO vo) throws Exception;
	//평점 주는 기능
	public void update4(VideoStarVO vo) throws Exception;
	//평점 주는 기능
	public void update5(VideoStarVO vo) throws Exception;
}
