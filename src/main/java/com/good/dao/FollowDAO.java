package com.good.dao;

import java.util.List;

import org.springframework.ui.Model;

import com.good.dto.FollowListVO;
import com.good.dto.Search;

public interface FollowDAO {

	public List<FollowListVO> followingList(int followAccountId) throws Exception;

//	public List<FollowListVO> listAll(Search search) throws Exception;
//
//	public int getFollowListCnt(Search search);
}
