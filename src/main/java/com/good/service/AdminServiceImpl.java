package com.good.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.AdminDAO;
import com.good.dto.AccountsVO;
import com.good.dto.AdminVO;
import com.good.dto.CategoryCount;
import com.good.dto.EditCategoryVO;
import com.good.dto.NoticeCategoryVO;
import com.good.dto.RecruitCategoryVO;
import com.good.dto.SearchAccounts;
import com.good.dto.TipCategoryVO;
import com.good.dto.VideoCategoryVO;

@Service
public class AdminServiceImpl implements AdminService {
	@Inject
	private AdminDAO dao;

	@Override
	public List<AccountsVO> selectAccounts(SearchAccounts search) throws Exception {
		return dao.selectAccounts(search);
	}

	@Override
	public int getAccountListCnt(SearchAccounts search) throws Exception {
		return dao.getAccountListCnt(search);
	}

	@Override
	public AdminVO login(AdminVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(vo);
	}

	@Override
	public AccountsVO getAccountInfo(int accountId) throws Exception {
		return dao.getAccountInfo(accountId);
	}

	// 공지 게시판 카테고리 정보 취득
	@Override
	public List<NoticeCategoryVO> getNoticeCatInfo() throws Exception {
		return dao.getNoticeCatInfo();
	}

	// 영상 게시판 카테고리 정보 취득
	@Override
	public List<VideoCategoryVO> getVideoCatInfo() throws Exception {
		return dao.getVideoCatInfo();
	}

	// 팁 게시판 카테고리 정보 취득
	@Override
	public List<TipCategoryVO> getTipCatInfo() throws Exception {
		return dao.getTipCatInfo();
	}

	// 구인구직 게시판 카테고리 정보 취득
	@Override
	public List<RecruitCategoryVO> getRecruitCatInfo() throws Exception {
		return dao.getRecruitCatInfo();
	}

	// 공지 게시판 각 카테고리별 게시물 갯수
	@Override
	public List<CategoryCount> getNoticeCatCount() throws Exception {
		return dao.getNoticeCatCount();
	}

	// 영상 게시판 각 카테고리별 게시물 갯수
	@Override
	public List<CategoryCount> getVideoCatCount() throws Exception {
		return dao.getVideoCatCount();
	}

	// 팁 게시판 각 카테고리별 게시물 갯수
	@Override
	public List<CategoryCount> getTipCatCount() throws Exception {
		return dao.getTipCatCount();
	}

	// 구인구직 게시판 각 카테고리별 게시물 갯수
	@Override
	public List<CategoryCount> getRecruitCatCount() throws Exception {
		return dao.getRecruitCatCount();
	}

	// 공지 게시판 categoryId 소속 게시물을 moveTo 카테고리로 옮기기
	@Override
	public void moveNoticeCat(Map<String, Integer> fromTo) throws Exception {
		dao.moveNoticeCat(fromTo);
	}

	// 영상 게시판 categoryId 소속 게시물을 moveTo 카테고리로 옮기기
	@Override
	public void moveVideoCat(Map<String, Integer> fromTo) throws Exception {
		dao.moveVideoCat(fromTo);
	}

	// 팁 게시판 categoryId 소속 게시물을 moveTo 카테고리로 옮기기
	@Override
	public void moveTipCat(Map<String, Integer> fromTo) throws Exception {
		dao.moveTipCat(fromTo);
	}

	// 구인구직 게시판 categoryId 소속 게시물을 moveTo 카테고리로 옮기기
	@Override
	public void moveRecruitCat(Map<String, Integer> fromTo) throws Exception{
		dao.moveRecruitCat(fromTo);
	}

	// 공지 게시판 categoryId 카테고리 지우기
	@Override
	public void delNoticeCat(int categoryId) throws Exception {
		dao.delNoticeCat(categoryId);
	}

	// 영상 게시판 categoryId 카테고리 지우기
	@Override
	public void delVideoCat(int categoryId) throws Exception {
		dao.delVideoCat(categoryId);
	}

	// 팁 게시판 categoryId 카테고리 지우기
	@Override
	public void delTipCat(int categoryId) throws Exception {
		dao.delTipCat(categoryId);
	}

	// 구인구직 게시판 categoryId 카테고리 지우기
	@Override
	public void delRecruitCat(int categoryId) throws Exception {
		dao.delRecruitCat(categoryId);
	}

	// 공지 게시판 카테고리 업데이트
	@Override
	public void editNoticeCat(EditCategoryVO catVO) throws Exception {
		dao.editNoticeCat(catVO);
	}

	// 영상 게시판 카테고리 업데이트
	@Override
	public void editVideoCat(EditCategoryVO catVO) throws Exception {
		dao.editVideoCat(catVO);
	}

	// 팁 게시판 카테고리 업데이트
	@Override
	public void editTipCat(EditCategoryVO catVO) throws Exception {
		dao.editTipCat(catVO);
	}

	// 구인구직 게시판 카테고리 업데이트
	@Override
	public void editRecruitCat(EditCategoryVO catVO) throws Exception {
		dao.editRecruitCat(catVO);
	}

	// 영상 게시판 헤더 이미지 파일명 취득
	@Override
	public String getCatPic(int categoryId) throws Exception {
		return dao.getCatPic(categoryId);
	}

	// 영상 카테고리 헤더이미지 업데이트
	@Override
	public void updateCatPic(EditCategoryVO editCatVO) throws Exception {
		dao.updateCatPic(editCatVO);
	}

	// 이메일 중복체크
	@Override
	public int checkEmail(String email) throws Exception {
		return dao.checkEmail(email);
	}

	// 닉네임 중복체크
	@Override
	public int checkNickname(String nickname) throws Exception {
		return dao.checkNickname(nickname);
	}

	// 기존 포트레이트 파일 이름 취득
	@Override
	public String getOriPic(int accountId) throws Exception {
		return dao.getOriPic(accountId);
	}

	// 유저 정보 업데이트
	@Override
	public void accountUpdate(AccountsVO updateUser) throws Exception {
		dao.accountUpdate(updateUser);
	}
	
	// 공지 카테고리 번호 체크
	@Override
	public int checkNoticeCatId(int newCatId) throws Exception {
		return dao.checkNoticeCatId(newCatId);
	}
	
	// 영상 카테고리 번호 체크
	@Override
	public int checkVideoCatId(int newCatId) throws Exception {
		return dao.checkVideoCatId(newCatId);
	}
	
	// 팁 카테고리 번호 체크
	@Override
	public int checkTipCatId(int newCatId) throws Exception {
		return dao.checkTipCatId(newCatId);
	}
	
	// 구인구직 카테고리 번호 체크
	@Override
	public int checkRecruitCatId(int newCatId) throws Exception {
		return dao.checkRecruitCatId(newCatId);
	}
	
	// 공지 카테고리 추가
	@Override
	public void insertNewNoticeCat(EditCategoryVO newCat) throws Exception {
		dao.insertNewNoticeCat(newCat);
	}
	
	// 영상 카테고리 추가
	@Override
	public void insertNewVideoCat(EditCategoryVO newCat) throws Exception {
		dao.insertNewVideoCat(newCat);
	}
	
	// 팁 카테고리 추가
	@Override
	public void insertNewTipCat(EditCategoryVO newCat) throws Exception {
		dao.insertNewTipCat(newCat);
	}
	
	// 구인구직 카테고리 추가
	@Override
	public void insertNewRecruitCat(EditCategoryVO newCat) throws Exception {
		dao.insertNewRecruitCat(newCat);
	}

}
