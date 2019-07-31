package com.good.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.good.dao.AccountsDAO;
import com.good.dao.AlarmDAO;
import com.good.dto.AccountCheckVO;
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
