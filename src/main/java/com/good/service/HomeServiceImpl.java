package com.good.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.HomeDAO;
import com.good.dto.NoticeCategoryVO;
import com.good.dto.RecruitCategoryVO;
import com.good.dto.TipCategoryVO;
import com.good.dto.VideoCategoryVO;

@Service
public class HomeServiceImpl implements HomeService {
	
	@Inject
	HomeDAO dao;
	
	// 새로운 메세지 수 감지
	@Override
	public int newMessageCnt(int accountId) throws Exception {
		return dao.newMessageCnt(accountId);
	}
	
	// 새로운 팔로워 수 감지
	@Override
	public int newFollowerCnt(int accountId) throws Exception {
		return dao.newFollowerCnt(accountId);
	}

	// 공지 카테고리 가져오기
	@Override
	public List<NoticeCategoryVO> bringNoticeCategory() throws Exception {
		return dao.bringNoticeCategory();
	}
	
	// 비디오 카테고리 가져오기
	@Override
	public List<VideoCategoryVO> bringVideoCategory() throws Exception {
		return dao.bringVideoCategory();
	}
	
	// 팁 카테고리 가져오기
	@Override
	public List<TipCategoryVO> bringTipCategory() throws Exception {
		return dao.bringTipCategory();
	}
	
	// 구인구직 카테고리 가져오기
	@Override
	public List<RecruitCategoryVO> bringRecruitCategory() throws Exception {
		return dao.bringRecruitCategory();
	}
	
}
