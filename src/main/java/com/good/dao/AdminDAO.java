package com.good.dao;

import java.util.List;
import com.good.dto.AccountsVO;
import com.good.dto.AdminVO;
import com.good.dto.Search;

public interface AdminDAO {

	public List<AccountsVO> selectAccounts(Search search) throws Exception;

	public AdminVO login(AdminVO vo) throws Exception;

	public void authorUp(AccountsVO vo) throws Exception;

	public void authorDown(AccountsVO vo) throws Exception;

	public int getAccountListCnt(Search search) throws Exception;
}
