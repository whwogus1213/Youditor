package com.good.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.FollowDAO;
import com.good.dto.FollowListVO;
import com.good.dto.FollowingListVO;

@Service
public class FollowServicImpl implements FollowService {

	@Inject
	FollowDAO followDAO;

	// 팔로잉 (로그인유저가 팔로우하는 사람 리스트)
	@Override
	public List<FollowingListVO> followingList(int accountId) throws Exception {
		return followDAO.followingList(accountId);
	}

	// 팔로워(로그인유저를 팔로우하는 사람 리스트)
	@Override
	public List<FollowingListVO> followerList(int accountId) throws Exception {
		return followDAO.followerList(accountId);
	}
	
	// 맛팔 체크
	@Override
	public boolean followEachOtherCheck(FollowListVO vo) throws Exception {
		return followDAO.followEachOtherCheck(vo);
	}

	// 팔로우 추가
	@Override
	public void insert(FollowListVO vo) throws Exception {
		followDAO.insert(vo);
	}

	// 팔로우 삭제
	@Override
	public void delete(FollowListVO vo) throws Exception {
		followDAO.delete(vo);
	}
	
}
