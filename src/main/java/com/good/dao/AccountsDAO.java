package com.good.dao;

import java.util.List;
import com.good.dto.AccountsVO;

public interface AccountsDAO {

	public List<AccountsVO> selectAccounts() throws Exception;

	public void insertAccounts(AccountsVO vo) throws Exception;

	public AccountsVO login(AccountsVO vo) throws Exception;
	
	public int checkEmail(String email) throws Exception;

	public int checkNickname(String nickname) throws Exception;
	
	public void resetPassword(String email) throws Exception;
}
