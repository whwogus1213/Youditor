package com.good.service;

import java.util.List;

import com.good.dto.AccountsVO;

public interface AccountsService {
	 public List<AccountsVO> selectAccounts() throws Exception;
	 public void insertAccounts(AccountsVO vo) throws Exception;
	 public AccountsVO login(AccountsVO vo) throws Exception;
}
