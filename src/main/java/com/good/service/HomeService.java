package com.good.service;

import java.util.List;

import com.good.dto.FollowListVO;
import com.good.dto.NoticeCategoryVO;
import com.good.dto.RecruitCategoryVO;
import com.good.dto.TipCategoryVO;
import com.good.dto.VideoCategoryVO;

public interface HomeService {
	
	// 새로운 메세지 수 감지
	public int newMessageCnt(int accountId) throws Exception;
	
	// 새로운 팔로워 수 감지
	public int newFollowerCnt(int accountId) throws Exception;

	// 공지 카테고리 가져오기
	public List<NoticeCategoryVO> bringNoticeCategory() throws Exception;
	
	// 비디오 카테고리 가져오기
	public List<VideoCategoryVO> bringVideoCategory() throws Exception;
	
	// 팁 카테고리 가져오기
	public List<TipCategoryVO> bringTipCategory() throws Exception;
	
	// 구인구직 카테고리 가져오기
	public List<RecruitCategoryVO> bringRecruitCategory() throws Exception;
	
}
