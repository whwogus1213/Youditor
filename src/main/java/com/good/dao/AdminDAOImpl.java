package com.good.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.AccountsVO;
import com.good.dto.AdminVO;
import com.good.dto.Search;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.good.mapper.adminMapper";

	@Override
	public List<AccountsVO> selectAccounts(Search search) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".selectAccounts", search);
	}

	@Override
	public AdminVO login(AdminVO vo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".login", vo);
	}

	@Override
	public void authorUp(AccountsVO vo) throws Exception {
		sqlSession.update(NAMESPACE + ".authorUp", vo);
	}

	@Override
	public void authorDown(AccountsVO vo) throws Exception {
		sqlSession.update(NAMESPACE + ".authorUp", vo);
	}

	@Override
	public int getAccountListCnt(Search search) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getAccountListCnt", search);
	}

}
