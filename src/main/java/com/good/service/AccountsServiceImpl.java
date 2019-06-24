package com.good.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.AccountsDAO;
import com.good.dto.AccountsVO;

@Service
public class AccountsServiceImpl implements AccountsService {	
	@Inject
	private AccountsDAO dao;

	@Override
	public List<AccountsVO> selectAccounts() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectAccounts();
	}
	@Override
	public void insertAccounts(AccountsVO vo) throws Exception {
		dao.insertAccounts(vo);
		
	}
	@Override
	public AccountsVO login(AccountsVO vo) throws Exception {
		return dao.login(vo);
		
	}
	
}
