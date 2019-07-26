package com.good.dao;

import java.util.List;

import com.good.dto.AccountCheckVO;
import com.good.dto.AccountsVO;

public interface AccountsDAO {

	public List<AccountsVO> selectAccounts() throws Exception;

	public int insertAccounts(AccountsVO vo) throws Exception;

	public void insertAccountCheck(AccountCheckVO Cvo) throws Exception;

	public AccountsVO login(AccountsVO vo) throws Exception;
	
	public int checkEmail(String email) throws Exception;

	public int checkNickname(String nickname) throws Exception;
	
	public void resetPassword(String email) throws Exception;
		
	public void deleteAccount(AccountsVO vo) throws Exception;
	
	public void updateAuthority(AccountCheckVO Cvo) throws Exception;
	
	public void updateAccount(AccountsVO vo) throws Exception;
	
	public void updatePassword(int accountId, String pwd) throws Exception;
	
	public int insertAccount(AccountsVO vo) throws Exception;

	public void loginDate(AccountsVO vo) throws Exception;

	public int duplicateCheck(int check) throws Exception;
}
