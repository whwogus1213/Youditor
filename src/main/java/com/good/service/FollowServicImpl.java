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
	
	@Override
	public List<FollowListVO> listAll(Search search) throws Exception {
		return followDAO.listAll(search);
	}

	@Override
	public int getFollowListCnt(Search search) throws Exception {
		return followDAO.getFollowListCnt(search);
	}

}
