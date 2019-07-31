package com.good.dao;

import com.good.dto.AccountsVO;

public interface AlarmDAO {

	public AccountsVO getAccount(int accountId) throws Exception;

}
