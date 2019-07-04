package com.good.dao;

import java.util.List;

import com.good.dto.FollowListVO;

public interface FollowDAO {

	// 팔로잉 (로그인유저가 팔로우하는 사람 리스트)
	public List<FollowListVO> followingList(int followAccountId) throws Exception;

	// 팔로워(로그인유저를 팔로우하는 사람 리스트)
	public List<FollowListVO> followerList(int followAccountId) throws Exception;

	// 팔로우 추가
	public void insert(FollowListVO vo) throws Exception;

	// 팔로우 삭제
	public void delete(FollowListVO vo) throws Exception;

}
