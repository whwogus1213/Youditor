package com.good.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.AccountsVO;
import com.good.dto.AdminVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.good.mapper.adminMapper";

	@Override
	public List<AccountsVO> selectAccounts() throws Exception {
		return sqlSession.selectList("com.good.mapper.accountsMapper.selectAccounts");
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

}
