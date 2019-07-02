package com.good.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.good.dao.FollowDAO;
import com.good.dto.FollowListVO;
import com.good.dto.Search;

@Service
public class FollowServicImpl implements FollowService {

	@Inject
	FollowDAO followDAO;

	// 팔로잉
	@Override
	public List<FollowListVO> followingList(int followAccountId) throws Exception {
		return followDAO.followingList(followAccountId);
	}

	// 팔로워
	@Override
	public List<FollowListVO> followerList(int followAccountId) throws Exception {
		return followDAO.followerList(followAccountId);
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
