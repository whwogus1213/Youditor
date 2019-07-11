package com.good.youditor;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.good.dto.AccountsVO;
import com.good.dto.AdminVO;
import com.good.service.AdminService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {

	@Inject
	AdminService service;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminLogin() throws Exception {
		return "admin/adminLogin";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.POST)
	public String AccountsList(HttpSession session, AdminVO mavo, Model model) throws Exception {

		String returnURL = "";
		if (session.getAttribute("login") != null) {
			// 기존에 login이란 세션 값이 존재한다면
			session.removeAttribute("login"); // 기존값을 제거해 준다.
		}

		AdminVO vo = service.login(mavo);

		if (vo != null) { // 로그인 성공
			session.setAttribute("login", vo);
			returnURL = "redirect:/adminView";
		} else { // 로그인에 실패한 경우
			returnURL = "redirect:/admin"; // 로그인 폼으로 다시 가도록 함
		}

		return returnURL; // 위에서 설정한 returnURL 을 반환해서 이동시킴
	}

	@RequestMapping(value = "/adminView", method = RequestMethod.GET)
	public String adminView(Model model) throws Exception {

		List<AccountsVO> list = null;
		list = service.selectAccounts();
		model.addAttribute("list", list);
		return "admin/adminView";
	}

	@RequestMapping(value = "/admin/authorUp", method = RequestMethod.POST)
	public String authorUp(AccountsVO vo, Model model) throws Exception {
		service.authorUp(vo);
		return "admin/adminView";
	}

	@RequestMapping(value = "/admin/authorDown", method = RequestMethod.POST)
	public String authorDown(AccountsVO vo, Model model) throws Exception {
		service.authorDown(vo);
		return "admin/adminView";
	}

}
