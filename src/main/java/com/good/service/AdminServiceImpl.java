package com.good.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.AccountsDAO;
import com.good.dao.AdminDAO;
import com.good.dto.AccountsVO;
import com.good.dto.AdminVO;
import com.good.dto.NoticeCategoryVO;
import com.good.dto.RecruitCategoryVO;
import com.good.dto.Search;
import com.good.dto.TipCategoryVO;
import com.good.dto.VideoCategoryVO;

@Service
public class AdminServiceImpl implements AdminService {
	@Inject
	private AdminDAO dao;

	@Override
	public List<AccountsVO> selectAccounts(Search search) throws Exception {
		return dao.selectAccounts(search);
	}

	@Override
	public int getAccountListCnt(Search search) throws Exception {
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
	public Map<Integer, Integer> getNoticeCatCount() throws Exception {
		return dao.getNoticeCatCount();
	}

	// 영상 게시판 각 카테고리별 게시물 갯수
	@Override
	public Map<Integer, Integer> getVideoCatCount() throws Exception {
		return dao.getVideoCatCount();
	}

	// 팁 게시판 각 카테고리별 게시물 갯수
	@Override
	public Map<Integer, Integer> getTipCatCount() throws Exception {
		return dao.getTipCatCount();
	}

	// 구인구직 게시판 각 카테고리별 게시물 갯수
	@Override
	public Map<Integer, Integer> getRecruitCatCount() throws Exception {
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

}
