package com.good.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.AccountsDAO;
import com.good.dto.AccountsVO;

@Service
public class AccountsServiceImpl implements AccountsService {

	// 주입
	@Inject
	private AccountsDAO dao;

	@Override
	public List<AccountsVO> selectAccounts() throws Exception {
		return dao.selectAccounts();
	}

	@Override
	public void insertAccounts(AccountsVO accountsVO) throws Exception {
		dao.insertAccounts(accountsVO);
	}

	@Override
	public int checkEmail(String email) throws Exception {
		return dao.checkEmail(email);
	}

	@Override
	public int checkNickname(String nickname) throws Exception {
		return dao.checkNickname(nickname);
	}
	@Override
	public AccountsVO login(AccountsVO accountsVO) throws Exception {
		return dao.login(accountsVO);

	}

	@Override
	public int checkEmail(String email) throws Exception {
		return dao.checkEmail(email);
	}

	@Override
	public int checkNickname(String nickname) throws Exception {
		return dao.checkNickname(nickname);
	}
	
	public void resetPassword(String email) throws Exception {
		dao.resetPassword(email);
	}
		
	@Override
	public void deleteAccount(AccountsVO vo) throws Exception {
		dao.deleteAccount(vo);
	}
	
	@Override
	public void updateAccount(AccountsVO vo) throws Exception {
		dao.updateAccount(vo);
	}
	
	@Override
	public void updatePassword(int accountId, String newPwd) throws Exception {
		dao.updatePassword(accountId, newPwd);
	}
	
	@Override
	public boolean insertAccount(AccountsVO vo) throws Exception {
		return dao.insertAccount(vo) > 0;
	}
}
