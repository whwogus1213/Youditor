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
import com.good.dto.NoticeBoardVO;
import com.good.dto.NoticeBoardVO;
import com.good.service.NoticeBoardService;
import com.good.service.VideoBoardService;

@Controller
@RequestMapping("/noticeboard")
public class NoticeBoardController {

	@Inject
	NoticeBoardService noticeBoardService;

	@RequestMapping(value = "/noticeBoardList")
	public ModelAndView list() throws Exception {
		List<NoticeBoardVO> list = noticeBoardService.listAll();

		ModelAndView mav = new ModelAndView();
		mav.setViewName("noticeboard/noticeBoardList");
		System.out.println("NoticeBoardController NoticeBoardList open");
		mav.addObject("NoticeBoardList", list);
		return mav;
	}

	// 게시물 상세정보
	@RequestMapping(value = "/noticeBoardView", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam("boardId") int boardId) throws Exception {
		System.out.println("*************************************************");
		NoticeBoardVO row = noticeBoardService.view(boardId);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("noticeboard/noticeBoardView");
		mav.addObject("row", row);
		System.out.println("NoticeBoardController boardView open");
		return mav;
	}

	// 게시물 쓰기
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public ModelAndView writedo() throws Exception {
		System.out.println("*************************************************");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("noticeboard/boardWrite");
		System.out.println("NoticeBoardController boardWrite open");
		return mav;
	}
}
