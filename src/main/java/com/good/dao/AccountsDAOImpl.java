package com.good.dao;

import java.sql.ResultSet;
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
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + ".selectAccounts");
//		return null;
	}

	@Override
	public void insertAccounts(AccountsVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertAccounts", vo);
	}

	@Override
	public AccountsVO login(AccountsVO vo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".login", vo);
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
	public void resetPassword(String email) throws Exception {
		sqlSession.update(NAMESPACE + ".resetPassword", email);
	}
	
	@Override
	public void deleteAccount(AccountsVO vo) throws Exception {
		sqlSession.delete(NAMESPACE + ".deleteAccount", vo);
	}
	
	@Override
	public void updateAccount(AccountsVO vo) throws Exception {
		sqlSession.update(NAMESPACE + ".updateAccount", vo);
	}
	
	@Override
	public void updatePassword(int accountId, String pwd) throws Exception {
		AccountsVO vo = new AccountsVO();
		vo.setAccountId(accountId);
		vo.setPwd(pwd);
		sqlSession.update(NAMESPACE + ".updatePassword", vo);
	}
	
	@Override
	public int insertAccount(AccountsVO vo) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertAccount", vo);
	}

}