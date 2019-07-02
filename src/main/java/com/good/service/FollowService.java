package com.good.service;

import java.util.List;

import org.springframework.ui.Model;
import com.good.dto.FollowListVO;
import com.good.dto.NoticeBoardVO;
import com.good.dto.Search;

public interface FollowService {

	// 팔로잉
	public List<FollowListVO> followingList(int followAccountId) throws Exception;

	
//	// 팔로워 목록 + 페이징 + 검색
//	public List<FollowListVO> listAll(Search search) throws Exception;
//	
//	// 팔로워 총 갯수
//	public int getFollowListCnt(Search search) throws Exception;

}
