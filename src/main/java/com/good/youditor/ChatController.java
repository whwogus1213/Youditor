package com.good.youditor;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.good.dto.AccountsVO;
import com.good.service.AccountsService;
import com.mysql.cj.Session;

@Controller
public class ChatController {

	@RequestMapping(value = "/chatting.do")
	public ModelAndView chat(ModelAndView mv, HttpServletRequest req) throws Exception {
		//사용자정보 출력(세션)
		HttpSession session = req.getSession();
		AccountsVO login = (AccountsVO)session.getAttribute("login");
		System.out.println(login);
		mv.addObject("userid",login.getAccountId());
		mv.addObject("userNickname",login.getNickname());
		mv.setViewName("chat/chattingview");
	
		return mv;
	}

}
