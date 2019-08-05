package com.good.service;

import java.util.List;
import java.util.Map;

import com.good.dto.AccountCheckVO;
import com.good.dto.AccountsVO;

public interface AccountsService {
	public List<AccountsVO> selectAccounts() throws Exception;

	public void insertAccounts(AccountsVO vo) throws Exception;

	public AccountsVO login(AccountsVO vo) throws Exception;
	
	// 로그인시 발급된 임시인증키가 존재할 경우 제거
	public void removeUnusedCheckKey(int accountId) throws Exception;
	
	//회원가입시 이메일 중복체크 service
	public int checkEmail(String email) throws Exception;

	//회원가입시 닉네임 중복체크 service
	public int checkNickname(String nickname) throws Exception;
	
	public void resetPassword(String email) throws Exception;
		
	public void deleteAccount(AccountsVO vo) throws Exception;
	
	public void updateAuthority(AccountCheckVO Cvo) throws Exception;
	
	public void updateAccount(AccountsVO vo) throws Exception;
	
	public void updatePassword(int accountId, String pwd) throws Exception;
	
	public boolean insertAccount(AccountsVO vo) throws Exception;
	
	public void loginDate(AccountsVO vo) throws Exception;

	public int duplicateCheck(int check) throws Exception;
	
	public String getPwd(Map<String, String> paramMap) throws Exception;

	public String getEmail(Map<String, String> paramMap) throws Exception;
	
	public String getNickname(Map<String, String> paramMap) throws Exception;

	public int getAccountId(Map<String, String> paramMap) throws Exception;
	
	// 비번 리셋용 발급된 키 유무 체크
	public int findAccountCheckKey(int accountId) throws Exception;
	
	// 비번 리셋용 키 발급된 경우 취득
	public int getCheckNUm(int accountId) throws Exception;
	
	// 비번리셋용 1회용 키 발급
	public void insertCheckNum(AccountCheckVO chVO) throws Exception;
	
	// 비번리셋페이지로 넘어가기위한 확인
	public int accountCheckCheck(AccountCheckVO chVO) throws Exception;
	
	// 비번 리셋으로 새로운 패스워드 넣기
	public void newPassword(AccountsVO newPwd) throws Exception;
	
	// 비번 리셋용 1회용 키 사용불가 처리
	public void removeAccountCheckKey(AccountCheckVO chVO) throws Exception;
}
