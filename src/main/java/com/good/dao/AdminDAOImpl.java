package com.good.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.AccountsVO;
import com.good.dto.AdminVO;
import com.good.dto.NoticeCategoryVO;
import com.good.dto.RecruitCategoryVO;
import com.good.dto.Search;
import com.good.dto.TipCategoryVO;
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
	public List<NoticeCategoryVO> getNoticeCatInfo() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getNoticeCatInfo");
	}
	
	@Override
	public List<VideoCategoryVO> getVideoCatInfo() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getVideoCatInfo");
	}
	
	@Override
	public List<TipCategoryVO> getTipCatInfo() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getTipCatInfo");
	}
	
	@Override
	public List<RecruitCategoryVO> getRecruitCatInfo() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getRecruitCatInfo");
	}
	
	// 공지 게시판 각 카테고리별 게시물 갯수
	@Override
	public Map<Integer, Integer> getNoticeCatCount() throws Exception {
		return sqlSession.selectMap(NAMESPACE + ".getNoticeCatCount", "accountId");
	}

	// 영상 게시판 각 카테고리별 게시물 갯수
	@Override
	public Map<Integer, Integer> getVideoCatCount() throws Exception {
		return sqlSession.selectMap(NAMESPACE + ".getVideoCatCount", "accountId");
	}

	// 팁 게시판 각 카테고리별 게시물 갯수
	@Override
	public Map<Integer, Integer> getTipCatCount() throws Exception {
		return sqlSession.selectMap(NAMESPACE + ".getTipCatCount", "accountId");
	}

	// 구인구직 게시판 각 카테고리별 게시물 갯수
	@Override
	public Map<Integer, Integer> getRecruitCatCount() throws Exception {
		return sqlSession.selectMap(NAMESPACE + ".getRecruitCatCount", "accountId");
	}

	@Override
	public void moveNoticeCat(Map<String, Integer> fromTo) throws Exception {
		sqlSession.update(NAMESPACE + ".moveNoticeCat", fromTo);
	}

	@Override
	public void moveVideoCat(Map<String, Integer> fromTo) throws Exception {
		sqlSession.update(NAMESPACE + ".moveVideoCat", fromTo);
	}

	@Override
	public void moveTipCat(Map<String, Integer> fromTo) throws Exception {
		sqlSession.update(NAMESPACE + ".moveTipCat", fromTo);
	}

	@Override
	public void moveRecruitCat(Map<String, Integer> fromTo) throws Exception {
		sqlSession.update(NAMESPACE + ".moveRecruitCat", fromTo);
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
