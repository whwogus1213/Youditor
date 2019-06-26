package com.good.youditor;

import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/noticeboard")
public class NoticeBoardController {
	@RequestMapping(value = "/noticeBoardList")
	public ModelAndView listdo(Locale locale, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("noticeboard/noticeBoardList");
		
		System.out.println("String notice-main open");
		return mav;	
	}
}
