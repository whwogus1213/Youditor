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
import com.good.dto.TipBoardVO;
import com.good.dto.TipBoardVO;
import com.good.service.TipBoardService;

@Controller
@RequestMapping("/noticeboard")
public class TipBoardController {

	@Inject
	TipBoardService tipBoardService;

	@RequestMapping(value = "/recruitBoardList")
	public ModelAndView list() throws Exception {
		List<TipBoardVO> list = tipBoardService.listAll();

		ModelAndView mav = new ModelAndView();
		mav.setViewName("tipboard/tipBoardList");
		System.out.println("TipBoardController tipBoardList open");
		mav.addObject("TipBoardList", list);
		return mav;
	}

	// 게시물 상세정보
	@RequestMapping(value = "/tipBoardView", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam("boardId") int boardId) throws Exception {
		System.out.println("*************************************************");
		TipBoardVO row = tipBoardService.view(boardId);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("tipboard/tipBoardView");
		mav.addObject("row", row);
		System.out.println("TipBoardController tipBoardView open");
		return mav;
	}

	// 게시물 쓰기
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public ModelAndView writedo() throws Exception {
		System.out.println("*************************************************");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("tipboard/boardWrite");
		System.out.println("TipBoardController boardWrite open");
		return mav;
	}
}
