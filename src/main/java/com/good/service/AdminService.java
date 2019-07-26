package com.good.service;

import java.util.List;
import java.util.Map;

import com.good.dto.AccountsVO;
import com.good.dto.AdminVO;
import com.good.dto.NoticeCategoryVO;
import com.good.dto.RecruitCategoryVO;
import com.good.dto.Search;
import com.good.dto.TipCategoryVO;
import com.good.dto.VideoCategoryVO;

public interface AdminService {
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
	public Map<Integer, Integer> getNoticeCatCount() throws Exception;

	// 영상 게시판 각 카테고리별 게시물 갯수
	public Map<Integer, Integer> getVideoCatCount() throws Exception;

	// 팁 게시판 각 카테고리별 게시물 갯수
	public Map<Integer, Integer> getTipCatCount() throws Exception;

	// 구인구직 게시판 각 카테고리별 게시물 갯수
	public Map<Integer, Integer> getRecruitCatCount() throws Exception;

	// 공지 게시판 categoryId 소속 게시물을 moveTo 카테고리로 옮기기
	public void moveNoticeCat(Map<String, Integer> fromTo) throws Exception;

	// 영상 게시판 categoryId 소속 게시물을 moveTo 카테고리로 옮기기
	public void moveVideoCat(Map<String, Integer> fromTo) throws Exception;

	// 팁 게시판 categoryId 소속 게시물을 moveTo 카테고리로 옮기기
	public void moveTipCat(Map<String, Integer> fromTo) throws Exception;

	// 구인구직 게시판 categoryId 소속 게시물을 moveTo 카테고리로 옮기기
	public void moveRecruitCat(Map<String, Integer> fromTo) throws Exception;
	
	// 이메일 중복체크
	public int checkEmail(String email) throws Exception;

	// 닉네임 중복체크
	public int checkNickname(String nickname) throws Exception;
	
	// 기존 포트레이트 파일 이름 취득
	public String getOriPic(int accountId) throws Exception;
	
	// 유저 정보 업데이트
	public void accountUpdate(AccountsVO updateUser) throws Exception;

}
