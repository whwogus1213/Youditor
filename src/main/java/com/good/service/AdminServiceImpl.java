package com.good.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.AccountsDAO;
import com.good.dao.AdminDAO;
import com.good.dto.AccountsVO;
import com.good.dto.AdminVO;
import com.good.dto.Search;
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

	@Override
	public List<VideoCategoryVO> getNoticeCatInfo() throws Exception {
		return dao.getNoticeCatInfo();
	}

	@Override
	public List<VideoCategoryVO> getVideoCatInfo() throws Exception {
		return dao.getVideoCatInfo();
	}

	@Override
	public List<VideoCategoryVO> getTipCatInfo() throws Exception {
		return dao.getTipCatInfo();
	}

	@Override
	public List<VideoCategoryVO> getRecruitCatInfo() throws Exception {
		return dao.getRecruitCatInfo();
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
