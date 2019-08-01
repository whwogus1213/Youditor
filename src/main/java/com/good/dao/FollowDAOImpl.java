package com.good.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.FollowListVO;
import com.good.dto.FollowingListVO;

@Repository
public class FollowDAOImpl implements FollowDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.good.mapper.followMapper";

	// 팔로잉 (로그인유저가 팔로우하는 사람 리스트)
	@Override
	public List<FollowingListVO> followingList(int accountId) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".followingList", accountId);
	}

	// 팔로워(로그인유저를 팔로우하는 사람 리스트)
	@Override
	public List<FollowingListVO> followerList(int accountId) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".followerList", accountId);
	}

	// 맛팔 체크
	@Override
	public boolean followEachOtherCheck(FollowListVO vo) throws Exception {
		boolean check = false;
		int result = sqlSession.selectOne(NAMESPACE + ".followEachOtherCheck", vo);

		if(result != 0) {
			check = true;
		}

		return check;
	}

	// 팔로우 추가
	@Override
	public void insert(FollowListVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insert", vo);
	}

	// 팔로우 삭제
	@Override
	public void delete(FollowListVO vo) throws Exception {
		sqlSession.delete(NAMESPACE + ".delete", vo);
	}

	@Override
	public int followCnt(int accountId) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".followCnt", accountId);
	}

	@Override
	public int starCnt(int accountId) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".starCnt", accountId);
	}

	@Override
	public int starRank(int accountId) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".starRank", accountId);
	}
	
	// 마지막 팔로워 체크 시간 갱신
	@Override
	public void updateLastFollowerCheck(int accountId) throws Exception {
		sqlSession.update(NAMESPACE + ".updateLastFollowerCheck", accountId);
	}
}
