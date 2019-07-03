package com.good.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.AccountsVO;

@Repository
public class AccountsDAOImpl implements AccountsDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.good.mapper.accountsMapper";

	@Override
	public List<AccountsVO> selectAccounts() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".selectAccounts");
	}

	@Override
	public void insertAccounts(AccountsVO accountsVO) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertAccounts", accountsVO);
	}

	@Override
	public int checkEmail(String email) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".checkEmail", email);
	}
	
	@Override
	public int checkEmail(String email) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".checkEmail", email);
	}

	@Override
	public int checkNickname(String nickname) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".checkNickname", nickname);
	}

	@Override
	public int checkNickname(String nickname) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".checkNickname", nickname);
	}

	@Override
	public AccountsVO login(AccountsVO accountsVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".login", accountsVO);
	}


}
