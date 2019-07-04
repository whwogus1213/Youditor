package com.good.service;

import java.util.List;

import com.good.dto.FollowListVO;

public interface FollowService {

	// 팔로잉 (로그인유저가 팔로우하는 사람 리스트)
	public List<FollowListVO> followingList(int followAccountId) throws Exception;

	// 팔로워(로그인유저를 팔로우하는 사람 리스트)
	public List<FollowListVO> followerList(int followAccountId) throws Exception;

	// 팔로잉 추가
	public void insert(FollowListVO vo) throws Exception;
	
//	// 팔로워 목록 + 페이징 + 검색
//	public List<FollowListVO> listAll(Search search) throws Exception;
//	
//	// 팔로워 총 갯수
//	public int getFollowListCnt(Search search) throws Exception;

}
