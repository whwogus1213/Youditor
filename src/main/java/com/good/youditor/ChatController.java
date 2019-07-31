package com.good.youditor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.good.dto.AccountsVO;

@Controller
public class ChatController {

	@RequestMapping(value = "/chatting.do")
	public ModelAndView chat(ModelAndView mv, HttpServletRequest req) throws Exception {
		//사용자정보 출력(세션)
		HttpSession session = req.getSession();
		AccountsVO login = (AccountsVO)session.getAttribute("login");
		System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"+login);
		mv.addObject("userid",login.getAccountId());
		mv.addObject("userNickname",login.getNickname());
		mv.setViewName("chat/chattingview");
	
		return mv;
	}

}
