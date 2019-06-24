package com.good.youditor;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
		model.addAttribute("list",list);
	}

	
	@RequestMapping(value = "/join.do", method=RequestMethod.GET)
	public ModelAndView join(Locale locale, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("accounts/join");
		System.out.println("String join open");
		return mav;	
	}
	
	@RequestMapping(value = "/login.do", method=RequestMethod.GET)
	public ModelAndView login(Locale locale, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("accounts/login");
		System.out.println("String login open");
		return mav;	
	}

	@RequestMapping(value="/insertAccountsForm")
	public String insertAccountsForm() throws Exception{
		return "accounts/insertAccounts";
	}
	
	// insertAccountsForm-> insertAccountsPro
	@RequestMapping(value="/insertAccountsPro")
	public String insertAccountsPro(AccountsVO vo) throws Exception{
		service.insertAccounts(vo);
		System.out.println("============insertAccountsPro 성공==============");
			
		return "redirect:/";
		
	}
}
