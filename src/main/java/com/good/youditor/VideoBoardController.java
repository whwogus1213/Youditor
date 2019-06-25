package com.good.youditor;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.good.dto.AccountsVO;
import com.good.dto.VideoBoardVO;
import com.good.service.VideoBoardService;

@Controller
@RequestMapping("/videoboard")
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
		mav.setViewName("videoboard/videoBoardList");
		System.out.println("VideoBoardController VideoBoardList open");
		mav.addObject("VideoBoardList", list);
		return mav;
	}

	// 게시물 상세정보
	@RequestMapping(value = "/videoBoardView", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam("boardId") int boardId) throws Exception {
		System.out.println("*************************************************");
		VideoBoardVO row = videoBoardService.view(boardId);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("videoboard/videoBoardView");
		mav.addObject("row", row);
		System.out.println("VideoBoardController boardView open");
		return mav;
	}
}
