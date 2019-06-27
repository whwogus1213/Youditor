package com.good.youditor;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public String loginProcess(HttpSession session, AccountsVO paraVo, RedirectAttributes rttr) throws Exception {
		String returnURL = "";
		if (session.getAttribute("login") != null) {
			// 기존에 login이란 세션 값이 존재한다면
			session.removeAttribute("login"); // 기존값을 제거해 준다.
		}

		// 로그인이 성공하면 UserVO 객체를 반환함.
		AccountsVO vo = service.login(paraVo);

		if (vo != null) { // 로그인 성공
			session.setAttribute("login", vo);
			returnURL = "redirect:/";
		} else { // 로그인에 실패한 경우
			rttr.addFlashAttribute("msg", false);
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

}
