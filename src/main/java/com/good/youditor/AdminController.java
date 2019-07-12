package com.good.youditor;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.good.dto.AccountsVO;
import com.good.dto.AdminVO;
import com.good.dto.Search;
import com.good.service.AccountsService;
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
		if (session.getAttribute("loginAdmin") != null) {
			// 기존에 login이란 세션 값이 존재한다면
			session.removeAttribute("loginAdmin"); // 기존값을 제거해 준다.
		}

		AdminVO vo = service.login(mavo);

		if (vo != null) { // 로그인 성공
			session.setAttribute("loginAdmin", vo);
			returnURL = "redirect:/adminView";
		} else { // 로그인에 실패한 경우
			returnURL = "redirect:/admin"; // 로그인 폼으로 다시 가도록 함
		}

		return returnURL; // 위에서 설정한 returnURL 을 반환해서 이동시킴
	}

	@RequestMapping(value = "/adminView", method = RequestMethod.GET)
	public String adminView(Model model, @RequestParam(required = false, defaultValue = "1") int page,
										 @RequestParam(required = false, defaultValue = "1") int range,
										 @RequestParam(required = false, defaultValue = "nickname") String searchType,
										 @RequestParam(required = false) String keyword) throws Exception {
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		int listCnt = service.getAccountListCnt(search);
		
		System.out.println(" listCnt : " + listCnt);

		search.pageInfo(page, range, listCnt);
		
		System.out.println("1111111111");

		model.addAttribute("pagination", search);
		
		System.out.println("22222222");
		List<AccountsVO> list = null;
		list = service.selectAccounts(search);
		
		System.out.println("3333333333");
		model.addAttribute("list", list);
		
		System.out.println("4444444444444");
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
