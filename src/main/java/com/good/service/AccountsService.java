package com.good.service;

import java.util.List;

import com.good.dto.AccountsVO;

public interface AccountsService {
	public List<AccountsVO> selectAccounts() throws Exception;

	public void insertAccounts(AccountsVO vo) throws Exception;

	public AccountsVO login(AccountsVO vo) throws Exception;
	
	//회원가입시 이메일 중복체크 service
	public int checkEmail(String email) throws Exception;

	//회원가입시 닉네임 중복체크 service
	public int checkNickname(String nickname) throws Exception;
	
	public void resetPassword(String email) throws Exception;
		
	public void deleteAccount(AccountsVO vo) throws Exception;
	
	public void updateAccount(AccountsVO vo) throws Exception;
	
	public void updatePassword(int accountId, String pwd) throws Exception;
	
	public boolean insertAccount(AccountsVO vo) throws Exception;
	
	public void loginDate(AccountsVO vo) throws Exception;
}
