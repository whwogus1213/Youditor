package com.good.youditor;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.good.dto.AccountsVO;
import com.good.service.AccountsService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/accounts")
public class AccountsController {

	@Inject
	AccountsService service;

	@RequestMapping(value = "/show", method = RequestMethod.GET)
	public void show(Model model) throws Exception {
		List<AccountsVO> list = service.selectAccounts();
		model.addAttribute("list", list);
	}

	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public ModelAndView join(Locale locale, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("accounts/join");
		System.out.println("String join open");
		return mav;
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public ModelAndView login(Locale locale, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("accounts/login");
		System.out.println("String login open");
		return mav;
	}

	// 로그인 처리하는 부분
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginProcess(HttpSession session, AccountsVO accountsVo, RedirectAttributes rttr) throws Exception {
		String returnURL = "";
		if (session.getAttribute("login") != null) {
			// 기존에 login이란 세션 값이 존재한다면
			session.removeAttribute("login"); // 기존값을 제거해 준다.
		}
		
		// 로그인이 성공하면 UserVO 객체를 반환함.
		AccountsVO vo = service.login(accountsVo);
		
		if (vo != null) { // 로그인 성공
			int authority = vo.getAuthority();
			
			if(authority < 3) {		// 권한에 문제가 있는 경우
				Map<String, Object> map = new HashMap<String,Object>();
				map.put("error", false);
				map.put("msg", authority);
				rttr.addFlashAttribute("error", map);
				returnURL = "redirect:/accounts/login.do";
			} else {
				session.setAttribute("login", vo);
				returnURL = "redirect:/";
			}
		} else { // 로그인에 실패한 경우
			int errorCase = 3;
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("error", false);
			map.put("msg", errorCase);
			rttr.addFlashAttribute("error", map);
			returnURL = "redirect:/accounts/login.do"; // 로그인 폼으로 다시 가도록 함
		}

		return returnURL; // 위에서 설정한 returnURL 을 반환해서 이동시킴
	}

	// 로그아웃 하는 부분
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 전체를 날려버림
		return "redirect:/";
	}

	@RequestMapping(value = "/insertAccountsForm")
	public String insertAccountsForm() throws Exception {
		return "accounts/insertAccounts";
	}

	// insertAccountsForm-> insertAccountsPro
	@RequestMapping(value = "/insertAccountsPro")
	public String insertAccountsPro(AccountsVO vo) throws Exception {
		service.insertAccounts(vo);
		System.out.println("============insertAccountsPro 성공==============");

		return "redirect:/";

	}


	//가입시 이메일 중복 체크
	@RequestMapping("/checkEmail.do")
	@ResponseBody
	public Map<Object, Object> checkEmail(@RequestBody String email) throws Exception {

		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();

		count = service.checkEmail(email);
		map.put("cnt", count);

		return map;
	}

	//가입시 닉네임 중복 체크
	@RequestMapping("/checkNickname.do")
	@ResponseBody
	public Map<Object, Object> checkNickname(@RequestBody String nickname) throws Exception {

		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();

		count = service.checkNickname(nickname);
		map.put("cnt", count);

		return map;
	}
	
	@RequestMapping(value = "/resetPassword.do", method = RequestMethod.GET)
	public ModelAndView resetPassword(Locale locale, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("accounts/resetPassword");
		System.out.println("String resetPassword open");
		return mav;
	}
	
	@RequestMapping(value = "/resetPasswordPro")
	public ModelAndView resetPasswordPro(String email) throws Exception {
		service.resetPassword(email);
		System.out.println("============resetPasswordPro 성공==============");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("accounts/resetPwdMsg");
		System.out.println("String resetPwdMsg open");
		return mav;
	}
		
	// 회원정보수정화면으로 
	@RequestMapping(value = "/modAccount.do", method = RequestMethod.GET)
	public ModelAndView modAccount(Locale locale, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("accounts/modAccount");
		System.out.println("String modAccount open");
		return mav;
	}
	
	// 비밀번호수정화면으로 
	@RequestMapping(value = "/updatePassword.do", method = RequestMethod.POST)
	public ModelAndView updatePassword(Locale locale, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("accounts/updatePassword");
		System.out.println("String updatePassword open");
		return mav;
	}
	
	@RequestMapping(value="/updatePasswordPro")
	public ModelAndView updatePasswordPro(HttpSession session, int accountId, String email, String pwd) throws Exception {
		service.updatePassword(accountId, pwd);
		System.out.println("============resetPasswordPro 성공==============");
		
		AccountsVO vo = new AccountsVO();
		
		vo.setEmail(email);
		vo.setPwd(pwd);

		if (session.getAttribute("login") != null) {
			// 기존에 login이란 세션 값이 존재한다면
			session.removeAttribute("login"); // 기존값을 제거해 준다.
		}
		
		vo = service.login(vo);
		
		session.setAttribute("login", vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("accounts/modAccount");
		System.out.println("String modAccount open");
		return mav;
	}
	
	// 회원정보수정처리
	@RequestMapping(value = "/updateAccount.do")
	public ModelAndView updateAccount(HttpSession session, int accountId, String email, String pwdCfm, String nickname, String picture, String footer) throws Exception {
		AccountsVO vo = new AccountsVO();
		
		vo.setAccountId(accountId);
		vo.setEmail(email);
		vo.setPwd(pwdCfm);
		vo.setNickname(nickname);
		vo.setPicture(picture);
		vo.setFooter(footer);
		
		service.updateAccount(vo);
		
		if (session.getAttribute("login") != null) {
			// 기존에 login이란 세션 값이 존재한다면
			session.removeAttribute("login"); // 기존값을 제거해 준다.
		}
		
		vo = service.login(vo);
		
		session.setAttribute("login", vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("accounts/updateAccount");
		System.out.println("String updateAccount open");
		return mav;
	}
	
	@RequestMapping(value="/deleteAccount.do")
	public String deleteAccount(HttpSession session, int accountId, String pwdCfm, RedirectAttributes rttr) throws Exception {
		AccountsVO vo = new AccountsVO();
		
		vo.setAccountId(accountId);
		vo.setPwd(pwdCfm);
		
		service.deleteAccount(vo);
		
		if(service.login(vo).getAuthority() != 0) {	// 삭제에 실패한 경우
			rttr.addFlashAttribute("msg", false);
			return "redirect:/accounts/modAccount.do";
		}

		if (session.getAttribute("login") != null) {
			// 기존에 login이란 세션 값이 존재한다면
			session.removeAttribute("login"); // 기존값을 제거해 준다.
		}
		
		return "redirect:/accounts/deleteAccount.do";
	}
	
}
