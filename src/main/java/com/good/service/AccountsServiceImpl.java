package com.good.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.good.dao.AccountsDAO;
import com.good.dto.AccountCheckVO;
import com.good.dto.AccountsVO;

@Service
public class AccountsServiceImpl implements AccountsService {
	@Inject
	private AccountsDAO dao;

	@Override
	public List<AccountsVO> selectAccounts() throws Exception {
		return dao.selectAccounts();
	}

	
	@Autowired
	private JavaMailSender mailSender;
	
	@Override
	public void insertAccounts(AccountsVO vo) throws Exception {
		
		int accountId = dao.insertAccounts(vo);	//회원정보 등록
		int check=0;
		
		do {
			check = (int)(Math.random() * 99999) + 10000;
			System.out.println(check + "--------------------check");
		} while(dao.duplicateCheck(check)!=0);
			
		
		AccountCheckVO Cvo = new AccountCheckVO();
		Cvo.setAccountId(accountId);
		Cvo.setCheck(check);
		dao.insertAccountCheck(Cvo);	//회원 메일인증을 위한 accountcheck 등록
		System.out.println("accountcheck : "+Cvo);
		
		// mail 작성 관련 
		MailUtils sendMail = new MailUtils(mailSender);

		sendMail.setSubject("[YouditoR] 회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
				.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
				.append("<a href='http://localhost:8180/accounts/joinConfirm?")
				.append("accountId=")
				.append(Cvo.getAccountId())
				.append("&check=")
				.append(Cvo.getCheck())
				.append("' target='_blenk'>이메일 인증 확인</a>")
				.toString());
		sendMail.setFrom("YouditoR", "유디터");
		sendMail.setTo(vo.getEmail());
		sendMail.send();
	}
	

	@Override
	public void updateAuthority(AccountCheckVO Cvo) throws Exception {
		dao.updateAuthority(Cvo);
	}


	@Override
	public AccountsVO login(AccountsVO vo) throws Exception {
		return dao.login(vo);

	}

	@Override
	public int checkEmail(String email) throws Exception {
		return dao.checkEmail(email);
	}

	@Override
	public int checkNickname(String nickname) throws Exception {
		return dao.checkNickname(nickname);
	}
	
	public void resetPassword(String email) throws Exception {
		dao.resetPassword(email);
	}
		
	@Override
	public void deleteAccount(AccountsVO vo) throws Exception {
		dao.deleteAccount(vo);
	}
	
	@Override
	public void updateAccount(AccountsVO vo) throws Exception {
		dao.updateAccount(vo);
	}
	
	@Override
	public void updatePassword(int accountId, String newPwd) throws Exception {
		dao.updatePassword(accountId, newPwd);
	}
	
	@Override
	public boolean insertAccount(AccountsVO vo) throws Exception {
		return dao.insertAccount(vo) > 0;
	}
	
	@Override
	public void loginDate(AccountsVO vo) throws Exception {
		dao.loginDate(vo);
	}
	@Override
	public String getPwd(Map<String, String> paramMap) throws Exception {
		return dao.getPwd(paramMap);
	}
	@Override
	public String getEmail(Map<String, String> paramMap) throws Exception {
		return dao.getEmail(paramMap);
	}
	@Override
	public String getNickname(Map<String, String> paramMap) throws Exception {
		return dao.getNickname(paramMap);
	}

	@Override
	public int getAccountId(Map<String, String> paramMap) throws Exception {
		return dao.getAccountId(paramMap);
	}
}
