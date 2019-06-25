package com.good.dao;

import java.util.List;
import com.good.dto.AccountsVO;
import com.good.dto.ManagerVO;

public interface ManagerDAO {

	
	public List<AccountsVO> selectAccounts() throws Exception;
	
	public ManagerVO login(ManagerVO vo) throws Exception;
	
	public void authorUp(AccountsVO vo) throws Exception;
	public void authorDown(AccountsVO vo) throws Exception;
}
