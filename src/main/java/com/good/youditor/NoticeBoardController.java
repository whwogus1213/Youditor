package com.good.youditor;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.good.dto.AccountsVO;
import com.good.dto.NoticeBoardVO;
import com.good.service.NoticeBoardService;

@Controller
@RequestMapping("/noticeboard")
public class NoticeBoardController {

	@Inject
	NoticeBoardService noticeBoardService;

//	// 게시물 목록
//	@RequestMapping(value = "/noticeBoardList")
//	public ModelAndView list() throws Exception {
//		List<NoticeBoardVO> list = noticeBoardService.listAll();
//
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("noticeboard/noticeBoardList");
//		System.out.println("NoticeBoardController NoticeBoardList open");
//		mav.addObject("NoticeBoardList", list);
//		return mav;
//	}

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

	// 페이징
	@RequestMapping(value = "/noticeBoardList", method = RequestMethod.GET)
	public void listPage(Model model, int num) throws Exception {
		System.out.println("paging start");
		// 게시물 총 갯수
		int count = noticeBoardService.count();

		// 한 페이지에 출력할 게시물 갯수
		int postNum = 10;

		// 게시물 총 갯수 / 한 페이지에 출력할 게시물 갯수 = 하단 페이징
		int pageNum = (int) Math.ceil((double) count / (double) 10);

		// 선택한 페이지 번호(임시)
		// int selectNum = 1;

		// 출력할 게시물
		int displayPost = (num - 1) * 10;

		List<NoticeBoardVO> list = null;
		list = noticeBoardService.listPage(displayPost, postNum);

		model.addAttribute("NoticeBoardList", list);
		model.addAttribute("pageNum", pageNum);

		System.out.println("paging end");
	}

	// 게시물 쓰기
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public ModelAndView writedo() throws Exception {
		System.out.println("*************************************************");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("noticeboard/noticeBoardWrite");
		System.out.println("NoticeBoardController boardWrite open");
		return mav;
	}

	// 글작성
	@RequestMapping(value = "/insertNoticeBoardForm")
	public String insertNoticeBoardForm() throws Exception {
		return "noticeboard/insertNoticeBoard";
	}

	// 글작성 완료
	// insertNoticeBoardForm-> insertNoticeBoardPro
	@RequestMapping(value = "/insertNoticeBoardPro", method = RequestMethod.POST)
	public String insertNoticeBoardPro(NoticeBoardVO vo) throws Exception {
		System.out.println("============insertNoticeBoardPro 성공==============");
		System.out.println(vo);
		noticeBoardService.insertNoticeBoard(vo);

		return "redirect:/";

	}

	// 파일 이동
	// 게시글 수정
	// 'noticeBoardUpdate.jsp' 로 이동 <-- 이동하고자 하는 파일로 명 바꾸면됨
	@RequestMapping(value = "/noticeBoardUpdate", method = RequestMethod.GET)
	public ModelAndView join(Locale locale, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("noticeboard/noticeBoardUpdate");
		System.out.println("String noticeboardlist open");
		return mav;
	}

	// 글 수정
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void getUpdatey(@RequestParam("boardId") int boardId, Model model) throws Exception {
		NoticeBoardVO vo = noticeBoardService.view(boardId);

		model.addAttribute("updateNoticeBoard", vo);

	}

	// 글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void getDelete(@RequestParam("boardId") int boardId, Model model) throws Exception {

		model.addAttribute("deleteNoticeBoard", boardId);
	}

	// 글 수정  POST
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String postUpdate(NoticeBoardVO vo) throws Exception {
		noticeBoardService.updateNoticeBoard(vo);

		return "redirect:/noticeboard/noticeBoardList";

	}

	// 글 삭제  POST
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String postDelete(@RequestParam("boardId") int boardId) throws Exception {
		noticeBoardService.deleteNoticeBoard(boardId);

		return "redirect:/noticeboard/noticeBoardList";
	}
}
