package com.good.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.FollowDAO;
import com.good.dto.FollowListVO;

@Service
public class FollowServicImpl implements FollowService {

	@Inject
	FollowDAO followDAO;

	// 팔로잉 (로그인유저가 팔로우하는 사람 리스트)
	@Override
	public List<FollowListVO> followingList(int followAccountId) throws Exception {
		return followDAO.followingList(followAccountId);
	}

	// 팔로워(로그인유저를 팔로우하는 사람 리스트)
	@Override
	public List<FollowListVO> followerList(int followAccountId) throws Exception {
		return followDAO.followerList(followAccountId);
	}

	// 팔로잉 추가
	@Override
	public void insert(FollowListVO vo) throws Exception {
		followDAO.insert(vo);
	}
	
//	@Override
//	public List<FollowListVO> listAll(Search search) throws Exception {
//		return followDAO.listAll(search);
//	}
//
//	@Override
//	public int getFollowListCnt(Search search) throws Exception {
//		return followDAO.getFollowListCnt(search);
//	}

}
