package com.good.service;

import java.util.List;

import com.good.dto.AccountsVO;

public interface AccountsService {


	public List<AccountsVO> selectAccounts() throws Exception;

	//회원가입 Service
	public void insertAccounts(AccountsVO accountsVO) throws Exception;

	//회원가입시 이메일 중복체크 service
	public int checkEmail(String email) throws Exception;

	//회원가입시 닉네임 중복체크 service
	public int checkNickname(String nickname) throws Exception;

	//로그인 Service
	public AccountsVO login(AccountsVO accountsVO) throws Exception;
}
