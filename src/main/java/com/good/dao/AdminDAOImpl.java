package com.good.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.good.dto.AccountsVO;
import com.good.dto.AdminVO;
import com.good.dto.CategoryCount;
import com.good.dto.EditCategoryVO;
import com.good.dto.NoticeCategoryVO;
import com.good.dto.RecruitCategoryVO;
import com.good.dto.SearchAccounts;
import com.good.dto.TipCategoryVO;
import com.good.dto.VideoCategoryVO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String NAMESPACE = "com.good.mapper.adminMapper";

	@Override
	public List<AccountsVO> selectAccounts(SearchAccounts search) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".selectAccounts", search);
	}

	@Override
	public int getAccountListCnt(SearchAccounts search) throws Exception {
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
	public List<CategoryCount> getNoticeCatCount() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getNoticeCatCount");
	}

	// 영상 게시판 각 카테고리별 게시물 갯수
	@Override
	public List<CategoryCount> getVideoCatCount() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getVideoCatCount");
	}

	// 팁 게시판 각 카테고리별 게시물 갯수
	@Override
	public List<CategoryCount> getTipCatCount() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getTipCatCount");
	}

	// 구인구직 게시판 각 카테고리별 게시물 갯수
	@Override
	public List<CategoryCount> getRecruitCatCount() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getRecruitCatCount");
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

	// 공지 게시판 categoryId 카테고리 지우기
	@Override
	public void delNoticeCat(int categoryId) throws Exception {
		sqlSession.delete(NAMESPACE + ".delNoticeCat", categoryId);
	}

	// 영상 게시판 categoryId 카테고리 지우기
	@Override
	public void delVideoCat(int categoryId) throws Exception {
		sqlSession.delete(NAMESPACE + ".delVideoCat", categoryId);
	}

	// 팁 게시판 categoryId 카테고리 지우기
	@Override
	public void delTipCat(int categoryId) throws Exception {
		sqlSession.delete(NAMESPACE + ".delTipCat", categoryId);
	}

	// 구인구직 게시판 categoryId 카테고리 지우기
	@Override
	public void delRecruitCat(int categoryId) throws Exception {
		sqlSession.delete(NAMESPACE + ".delRecruitCat", categoryId);

	}

	// 공지 게시판 카테고리 업데이트
	@Override
	public void editNoticeCat(EditCategoryVO catVO) throws Exception {
		sqlSession.update(NAMESPACE + ".editNoticeCat", catVO);
	}

	// 영상 게시판 카테고리 업데이트
	@Override
	public void editVideoCat(EditCategoryVO catVO) throws Exception {
		sqlSession.update(NAMESPACE + ".editVideoCat", catVO);
	}

	// 팁 게시판 카테고리 업데이트
	@Override
	public void editTipCat(EditCategoryVO catVO) throws Exception {
		sqlSession.update(NAMESPACE + ".editTipCat", catVO);
	}

	// 구인구직 게시판 카테고리 업데이트
	@Override
	public void editRecruitCat(EditCategoryVO catVO) throws Exception {
		sqlSession.update(NAMESPACE + ".editRecruitCat", catVO);
	}

	// 영상 게시판 헤더 이미지 파일명 취득
	@Override
	public String getCatPic(int categoryId) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getCatPic", categoryId);
	}

	// 영상 카테고리 헤더이미지 업데이트
	@Override
	public void updateCatPic(EditCategoryVO editCatVO) throws Exception {
		sqlSession.update(NAMESPACE + ".updateCatPic", editCatVO);
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
	
	// 공지 카테고리 번호 체크
	@Override
	public int checkNoticeCatId(int newCatId) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".checkNoticeCatId", newCatId);
	}
	
	// 영상 카테고리 번호 체크
	@Override
	public int checkVideoCatId(int newCatId) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".checkVideoCatId", newCatId);
	}
	
	// 팁 카테고리 번호 체크
	@Override
	public int checkTipCatId(int newCatId) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".checkTipCatId", newCatId);
	}
	
	// 구인구직 카테고리 번호 체크
	@Override
	public int checkRecruitCatId(int newCatId) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".checkRecruitCatId", newCatId);
	}
	
	// 공지 카테고리 추가
	@Override
	public void insertNewNoticeCat(EditCategoryVO newCat) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertNewNoticeCat", newCat);
	}
	
	// 영상 카테고리 추가
	@Override
	public void insertNewVideoCat(EditCategoryVO newCat) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertNewVideoCat", newCat);
	}
	
	// 팁 카테고리 추가
	@Override
	public void insertNewTipCat(EditCategoryVO newCat) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertNewTipCat", newCat);
	}
	
	// 구인구직 카테고리 추가
	@Override
	public void insertNewRecruitCat(EditCategoryVO newCat) throws Exception {
		sqlSession.insert(NAMESPACE + ".insertNewRecruitCat", newCat);
	}


}
