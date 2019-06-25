package com.good.youditor;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.good.dto.AccountsVO;
import com.good.dto.VideoBoardVO;
import com.good.service.VideoBoardService;

@Controller
@RequestMapping("/board")
public class VideoBoardController {

//	@RequestMapping(value = "/VideoboardList", method = RequestMethod.GET)
//	public void boardlist(Model model) throws Exception {
//
//		System.out.println("dd");
//	}
	
	@Inject
	VideoBoardService videoBoardService;
	
	// 게시물 목록
	@RequestMapping(value = "/videoBoardList")
	public ModelAndView list() throws Exception {
		List<VideoBoardVO> list = videoBoardService.listAll();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("videoBoard/videoBoardList");
		System.out.println("VideoBoardController VideoBoardList open");
		mav.addObject("VideoBoardlist", list);
		return mav;
	}
}
