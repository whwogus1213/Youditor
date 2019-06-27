package com.good.service;

import java.util.List;

import com.good.dto.AccountsVO;
import com.good.dto.AdminVO;

public interface AdminService {
	public List<AccountsVO> selectAccounts() throws Exception;

	public AdminVO login(AdminVO vo) throws Exception;

	public void authorUp(AccountsVO vo) throws Exception;

	public void authorDown(AccountsVO vo) throws Exception;

}
