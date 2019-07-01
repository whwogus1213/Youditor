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

	@Override
	public List<FollowListVO> listAll(Search search) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll", search);
	}

	@Override
	public int getFollowListCnt(Search search) {
		return sqlSession.selectOne(NAMESPACE + ".getFollowListCnt", search);
	}
}
