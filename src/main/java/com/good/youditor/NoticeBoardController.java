package com.good.youditor;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.good.dto.NoticeBoardVO;
import com.good.service.NoticeBoardService;

@Controller
@RequestMapping("/noticeboard")
public class NoticeBoardController {

	@Inject
	NoticeBoardService noticeBoardService;

	// 게시물 목록
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

	// 페이징
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPage(Model model, int num) throws Exception {
		System.out.println("paging start");
		// 게시물 총 갯수
		int count = noticeBoardService.count();
		
		// 한 페이지에 출력할 게시물 갯수
		int postNum = 5;
		
		// 게시물 총 갯수 / 한 페이지에 출력할 게시물 갯수 = 하단 페이징
		int pageNum = (int)Math.ceil((double)count/(double)5);
		
		// 선택한 페이지 번호(임시)
		//int selectNum = 1;

		// 출력할 게시물
		int displayPost = (num - 1) * 5;
		
		List<NoticeBoardVO> list = null;
		list = noticeBoardService.listPage(displayPost, postNum);		
		
		model.addAttribute("NoticeBoardList", list);
		model.addAttribute("pageNum", pageNum);
		
		System.out.println("paging end");
	}
	
	
}
