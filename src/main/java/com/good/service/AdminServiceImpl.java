package com.good.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.good.dao.AdminDAO;
import com.good.dto.AccountsVO;
import com.good.dto.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {
	@Inject
	private AdminDAO dao;

	@Override
	public List<AccountsVO> selectAccounts() throws Exception {
		// TODO Auto-generated method stub
		return dao.selectAccounts();
	}

	@Override
	public AdminVO login(AdminVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.login(vo);
	}

	@Override
	public void authorUp(AccountsVO vo) throws Exception {
		System.out.println(vo.toString());
		if (vo.getAuthority() <= 4) {
			vo.setAuthority(vo.getAuthority() + 1);
			dao.authorUp(vo);
		}

	}

	@Override
	public void authorDown(AccountsVO vo) throws Exception {
		if (vo.getAuthority() >= 2) {
			vo.setAuthority(vo.getAuthority() - 1);
			dao.authorDown(vo);
		}

	}

}
