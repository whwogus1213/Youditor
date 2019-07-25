package com.good.service;

import java.util.List;

import com.good.dto.FollowListVO;
import com.good.dto.FollowingListVO;

public interface FollowService {

	// 팔로잉 (로그인유저가 팔로우하는 사람 리스트)
	public List<FollowingListVO> followingList(int accountId) throws Exception;

	// 팔로워(로그인유저를 팔로우하는 사람 리스트)
	public List<FollowListVO> followerList(int accountId) throws Exception;
	
	// 맛팔 체크
	public boolean followEachOtherCheck(FollowListVO vo) throws Exception;

	// 팔로우 추가
	public void insert(FollowListVO vo) throws Exception;

	// 팔로우 삭제
	public void delete(FollowListVO vo) throws Exception;
	
}
