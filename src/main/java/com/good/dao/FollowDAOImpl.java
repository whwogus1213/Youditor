package com.good.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.good.dto.FollowListVO;
import com.good.dto.Search;

@Repository
public class FollowDAOImpl implements FollowDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.good.mapper.followMapper";

	// 팔로잉
	@Override
	public List<FollowListVO> followingList(int followAccountId) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".followingList", followAccountId);
	}
	
	// 팔로워
	@Override
	public List<FollowListVO> followerList(int followAccountId) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".followerList", followAccountId);
	}


//	@Override
//	public List<FollowListVO> listAll(Search search) throws Exception {
//		return sqlSession.selectList(NAMESPACE + ".listAll", search);
//	}
//
//	@Override
//	public int getFollowListCnt(Search search) {
//		return sqlSession.selectOne(NAMESPACE + ".getFollowListCnt", search);
//	}
}
