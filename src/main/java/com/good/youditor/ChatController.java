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

@Controller
public class ChatController {

	@RequestMapping(value = "/chattion.do", method = RequestMethod.GET)
	public ModelAndView chat(ModelAndView mv) throws Exception {
		mv.setViewName("chat/chattingview");
		
		//사용자정보 출력(세션)
		
	}

}
