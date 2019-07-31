package com.good.service;

import com.good.dto.AccountsVO;

public interface AlarmService {
	public AccountsVO getAccount(int accountId) throws Exception;
}
