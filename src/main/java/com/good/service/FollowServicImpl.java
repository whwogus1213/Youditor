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

	@Override
	public int followCnt(int accountId) throws Exception {
		System.out.println("---------------------------------------- : "+accountId);
		return followDAO.followCnt(accountId);
	}

	@Override
	public int starCnt(int accountId) throws Exception {
		return followDAO.starCnt(accountId);
	}

	@Override
	public int starRank(int accountId) throws Exception {
		return followDAO.starRank(accountId);
	}
	
	// 마지막 팔로워 체크 시간 갱신
	@Override
	public void updateLastFollowerCheck(int accountId) throws Exception {
		followDAO.updateLastFollowerCheck(accountId);
	}
	
}
