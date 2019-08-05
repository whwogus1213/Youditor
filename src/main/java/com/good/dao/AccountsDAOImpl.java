package com.good.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.AccountCheckVO;
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
	public int insertAccounts(AccountsVO vo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertAccounts", vo);
		return sqlSession.selectOne(NAMESPACE + ".returnAccountId", vo);
	}
	
	@Override
	public void insertAccountCheck(AccountCheckVO Cvo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertAccountCheck", Cvo);
	}

	@Override
	public AccountsVO login(AccountsVO vo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".login", vo);
	}
	
	// 로그인시 발급된 임시인증키가 존재할 경우 제거
	@Override
	public void removeUnusedCheckKey(int accountId) throws Exception {
		sqlSession.delete(NAMESPACE + ".removeUnusedCheckKey", accountId);
	}
	
	
	@Override
	public void updateAuthority(AccountCheckVO Cvo) throws Exception {
		sqlSession.update(NAMESPACE + ".updateAuthority", Cvo);
		sqlSession.delete(NAMESPACE + ".deleteAuthkey", Cvo);
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
	
	@Override
	public void loginDate(AccountsVO vo) throws Exception {
		sqlSession.update(NAMESPACE + ".loginDate", vo);
	}

	@Override
	public int duplicateCheck(int check) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".duplicateCheck", check);
	}
	
	@Override
	public String getPwd(Map<String, String> paramMap) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getPwd",paramMap);
	}
	
	@Override
	public String getEmail(Map<String, String> paramMap) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getEmail",paramMap);
	}
	
	@Override
	public String getNickname(Map<String, String> paramMap) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getNickname",paramMap);
	}
	
	@Override
	public int getAccountId(Map<String, String> paramMap) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getAccountId",paramMap);
	}
	
	// 비번 리셋용 발급된 키 유무 체크
	@Override
	public int findAccountCheckKey(int accountId) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".findAccountCheckKey", accountId);
	}
	
	// 비번 리셋용 키 발급된 경우 취득
	@Override
	public int getCheckNUm(int accountId) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getCheckNUm", accountId);
	}
	
	// 비번리셋용 1회용 키 발급
	@Override
	public void insertCheckNum(AccountCheckVO chVO) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertCheckNum", chVO);
	}
	
	// 비번리셋페이지로 넘어가기위한 확인
	@Override
	public int accountCheckCheck(AccountCheckVO chVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".accountCheckCheck", chVO);
	}
	
	// 비번 리셋으로 새로운 패스워드 넣기
	public void newPassword(AccountsVO newPwd) throws Exception {
		sqlSession.update(NAMESPACE + ".newPassword", newPwd);
	}
	
	// 비번 리셋용 1회용 키 사용불가 처리
	public void removeAccountCheckKey(AccountCheckVO chVO) throws Exception {
		sqlSession.delete(NAMESPACE + ".removeAccountCheckKey", chVO);
	}

}
