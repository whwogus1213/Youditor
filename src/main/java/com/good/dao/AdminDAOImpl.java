package com.good.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.AccountsVO;
import com.good.dto.AdminVO;
import com.good.dto.Search;
import com.good.dto.VideoCategoryVO;

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
	public int getAccountListCnt(Search search) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getAccountListCnt", search);
	}

	@Override
	public AdminVO login(AdminVO vo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".login", vo);
	}

	@Override
	public AccountsVO getAccountInfo(int accountId) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getAccountInfo", accountId);
	}
	
	@Override
	public List<VideoCategoryVO> getCatInfo(String category) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getCatInfo", category);
	}
	
	// 이메일 중복체크
	@Override
	public int checkEmail(String email) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".checkEmail", email);
	}

	// 닉네임 중복체크
	@Override
	public int checkNickname(String nickname) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".checkNickname", nickname);
	}
	
	// 기존 포트레이트 파일 이름 취득
	@Override
	public String getOriPic(int accountId) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getOriPic", accountId);
	}
	
	// 유저 정보 업데이트
	@Override
	public void accountUpdate(AccountsVO updateUser) throws Exception {
		sqlSession.update(NAMESPACE + ".accountUpdate", updateUser);
	}

}
