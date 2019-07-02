package com.good.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.FollowListVO;

@Repository
public class FollowDAOImpl implements FollowDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.good.mapper.followMapper";

	// 팔로잉 (로그인유저가 팔로우하는 사람 리스트)
	@Override
	public List<FollowListVO> followingList(int followAccountId) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".followingList", followAccountId);
	}
	
	// 팔로워(로그인유저를 팔로우하는 사람 리스트)
	@Override
	public List<FollowListVO> followerList(int followAccountId) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".followerList", followAccountId);
	}

	// 팔로잉 추가
	@Override
	public void insert(FollowListVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insert", vo);
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
