package com.good.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.AlarmDAO;
import com.good.dto.AccountsVO;

@Service
public class AlarmServiceImpl implements AlarmService {
	@Inject
	private AlarmDAO dao;

	@Override
	public AccountsVO getAccount(int accountId) throws Exception {
		return dao.getAccount(accountId);
	}


}
