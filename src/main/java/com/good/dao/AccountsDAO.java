package com.good.dao;

import java.util.List;
import com.good.dto.AccountsVO;

public interface AccountsDAO {

	public List<AccountsVO> selectAccounts() throws Exception;
}
