package com.good.service;

import java.util.List;

import com.good.dto.AccountsVO;

public interface AccountsService {
	 public List<AccountsVO> selectAccounts() throws Exception;
}
