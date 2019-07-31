package com.good.dao;

import java.util.List;
import java.util.Map;

import com.good.dto.AccountsVO;
import com.good.dto.AdminVO;
import com.good.dto.CategoryCount;
import com.good.dto.EditCategoryVO;
import com.good.dto.NoticeCategoryVO;
import com.good.dto.RecruitCategoryVO;
import com.good.dto.Search;
import com.good.dto.TipCategoryVO;
import com.good.dto.VideoCategoryVO;

public interface AdminDAO {

	public List<AccountsVO> selectAccounts(Search search) throws Exception;

	public int getAccountListCnt(Search search) throws Exception;

	public AdminVO login(AdminVO vo) throws Exception;

	public AccountsVO getAccountInfo(int accountId) throws Exception;

	// 공지 게시판 카테고리 정보 취득
	public List<NoticeCategoryVO> getNoticeCatInfo() throws Exception;

	// 영상 게시판 카테고리 정보 취득
	public List<VideoCategoryVO> getVideoCatInfo() throws Exception;

	// 팁 게시판 카테고리 정보 취득
	public List<TipCategoryVO> getTipCatInfo() throws Exception;

	// 구인구직 게시판 카테고리 정보 취득
	public List<RecruitCategoryVO> getRecruitCatInfo() throws Exception;
	
	// 공지 게시판 각 카테고리별 게시물 갯수
	public List<CategoryCount> getNoticeCatCount() throws Exception;

	// 영상 게시판 각 카테고리별 게시물 갯수
	public List<CategoryCount> getVideoCatCount() throws Exception;

	// 팁 게시판 각 카테고리별 게시물 갯수
	public List<CategoryCount> getTipCatCount() throws Exception;

	// 구인구직 게시판 각 카테고리별 게시물 갯수
	public List<CategoryCount> getRecruitCatCount() throws Exception;

	// 공지 게시판 categoryId 소속 게시물을 moveTo 카테고리로 옮기기
	public void moveNoticeCat(Map<String, Integer> fromTo) throws Exception;

	// 영상 게시판 categoryId 소속 게시물을 moveTo 카테고리로 옮기기
	public void moveVideoCat(Map<String, Integer> fromTo) throws Exception;

	// 팁 게시판 categoryId 소속 게시물을 moveTo 카테고리로 옮기기
	public void moveTipCat(Map<String, Integer> fromTo) throws Exception;

	// 구인구직 게시판 categoryId 소속 게시물을 moveTo 카테고리로 옮기기
	public void moveRecruitCat(Map<String, Integer> fromTo) throws Exception;
	
	// 공지 게시판 categoryId 카테고리 지우기
	public void delNoticeCat(int categoryId) throws Exception;
	
	// 영상 게시판 categoryId 카테고리 지우기
	public void delVideoCat(int categoryId) throws Exception;
	
	// 팁 게시판 categoryId 카테고리 지우기
	public void delTipCat(int categoryId) throws Exception;
	
	// 구인구직 게시판 categoryId 카테고리 지우기
	public void delRecruitCat(int categoryId) throws Exception;
	
	// 공지 게시판 카테고리 업데이트
	public void editNoticeCat(EditCategoryVO catVO) throws Exception;
	
	// 영상 게시판 카테고리 업데이트
	public void editVideoCat(EditCategoryVO catVO) throws Exception;
	
	// 팁 게시판 카테고리 업데이트
	public void editTipCat(EditCategoryVO catVO) throws Exception;
	
	// 구인구직 게시판 카테고리 업데이트
	public void editRecruitCat(EditCategoryVO catVO) throws Exception;
	
	// 영상 게시판 헤더 이미지 파일명 취득 
	public String getCatPic(int categoryId) throws Exception;
	
	// 영상 카테고리 헤더이미지 업데이트
	public void updateCatPic(EditCategoryVO editCatVO) throws Exception;
	
	// 이메일 중복체크
	public int checkEmail(String email) throws Exception;

	// 닉네임 중복체크
	public int checkNickname(String nickname) throws Exception;
	
	// 기존 포트레이트 파일 이름 취득
	public String getOriPic(int accountId) throws Exception;
	
	// 유저 정보 업데이트
	public void accountUpdate(AccountsVO updateUser) throws Exception;
	
	// 공지 카테고리 번호 체크
	public int checkNoticeCatId(int newCatId) throws Exception;
	
	// 영상 카테고리 번호 체크
	public int checkVideoCatId(int newCatId) throws Exception;
	
	// 팁 카테고리 번호 체크
	public int checkTipCatId(int newCatId) throws Exception;
	
	// 구인구직 카테고리 번호 체크
	public int checkRecruitCatId(int newCatId) throws Exception;
	
	// 공지 카테고리 추가
	public void insertNewNoticeCat(EditCategoryVO newCat) throws Exception;
	
	// 영상 카테고리 추가
	public void insertNewVideoCat(EditCategoryVO newCat) throws Exception;
	
	// 팁 카테고리 추가
	public void insertNewTipCat(EditCategoryVO newCat) throws Exception;
	
	// 구인구직 카테고리 추가
	public void insertNewRecruitCat(EditCategoryVO newCat) throws Exception;
	
}
