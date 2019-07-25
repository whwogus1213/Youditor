package com.good.dao;

import java.util.List;
import com.good.dto.AccountsVO;
import com.good.dto.AdminVO;
import com.good.dto.Search;
import com.good.dto.VideoCategoryVO;

public interface AdminDAO {

	public List<AccountsVO> selectAccounts(Search search) throws Exception;

	public int getAccountListCnt(Search search) throws Exception;

	public AdminVO login(AdminVO vo) throws Exception;

	public AccountsVO getAccountInfo(int accountId) throws Exception;

	public List<VideoCategoryVO> getNoticeCatInfo() throws Exception;

	public List<VideoCategoryVO> getVideoCatInfo() throws Exception;

	public List<VideoCategoryVO> getTipCatInfo() throws Exception;

	public List<VideoCategoryVO> getRecruitCatInfo() throws Exception;
	
	// 이메일 중복체크
	public int checkEmail(String email) throws Exception;

	// 닉네임 중복체크
	public int checkNickname(String nickname) throws Exception;
	
	// 기존 포트레이트 파일 이름 취득
	public String getOriPic(int accountId) throws Exception;
	
	// 유저 정보 업데이트
	public void accountUpdate(AccountsVO updateUser) throws Exception;
}
