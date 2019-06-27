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
import com.good.dto.RecruitBoardVO;
import com.good.service.RecruitBoardService;

@Controller
@RequestMapping("/recruitboard")
public class RecruitBoardController {

	@Inject
	RecruitBoardService recruitBoardService;

	@RequestMapping(value = "/recruitBoardList")
	public ModelAndView list() throws Exception {
		List<RecruitBoardVO> list = recruitBoardService.listAll();

		ModelAndView mav = new ModelAndView();
		mav.setViewName("recruitboard/recruitBoardList");
		System.out.println("RecruitBoardController recruitBoardList open");
		mav.addObject("RecruitBoardList", list);
		return mav;
	}

	// 게시물 상세정보
	@RequestMapping(value = "/recruitBoardView", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam("boardId") int boardId) throws Exception {
		System.out.println("*************************************************");
		RecruitBoardVO row = recruitBoardService.view(boardId);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("recruitboard/recruitBoardView");
		mav.addObject("row", row);
		System.out.println("RecruitBoardController recruitBoardView open");
		return mav;
	}

	// 게시물 쓰기
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public ModelAndView writedo() throws Exception {
		System.out.println("*************************************************");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("recruitboard/boardWrite");
		System.out.println("RecruitBoardController boardWrite open");
		return mav;
	}
}
