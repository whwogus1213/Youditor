package com.good.youditor;

import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.good.dto.NoticeBoardVO;
import com.good.dto.Search;
import com.good.dto.VideoBoardVO;
import com.good.service.NoticeBoardService;

@Controller
@RequestMapping("/noticeboard")
public class NoticeBoardController {

	@Inject
	NoticeBoardService noticeBoardService;

	// 게시물 목록 + 페이징 + 검색
	@RequestMapping(value = "/noticeBoardList", method = RequestMethod.GET)
	public String list(Model model, @RequestParam(required = false, defaultValue = "1") int page,
									@RequestParam(required = false, defaultValue = "1") int range,
									@RequestParam(required = false, defaultValue = "object") String searchType,
									@RequestParam(required = false) String keyword) throws Exception {
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		// 전체 게시글 개수
		int listCnt = noticeBoardService.getBoardListCnt(search);
		
		search.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", search);
		model.addAttribute("NoticeBoardList", noticeBoardService.listAll(search));
		System.out.println("NoticeBoardController NoticeBoardList open");
		return "noticeboard/noticeBoardList";
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
		mav.setViewName("noticeboard/noticeBoardWrite");
		System.out.println("NoticeBoardController boardWrite open");
		return mav;
	}


	// 글작성 완료
	@RequestMapping(value = "/insertNoticeBoardPro", method = RequestMethod.POST)
	public String insertNoticeBoardPro(NoticeBoardVO vo) throws Exception {
		System.out.println("============insertNoticeBoardPro 성공==============");
		System.out.println(vo);
		noticeBoardService.insertNoticeBoard(vo);

		return "redirect:/";

	}
	// 글 수정
	@RequestMapping(value = "/updateNoticeBoardPro")
	public String updateNoticeBoardPro(NoticeBoardVO vo) throws Exception {
		noticeBoardService.updateNoticeBoard(vo);
		System.out.println("============ updateNoticeBoard 성공==============");
		return "redirect:/noticeboard/noticeBoardList";
	}
	// 파일 이동
	// 게시글 수정
	// 'noticeBoardUpdate.jsp' 로 이동 <-- 이동하고자 하는 파일로 명 바꾸면됨
	@RequestMapping(value = "/updateNoticeBoard.do", method = RequestMethod.GET)
	public ModelAndView joinUpdate(Locale locale, Model model,@RequestParam("boardId") int boardId) throws Exception {
		NoticeBoardVO update = noticeBoardService.view(boardId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("noticeboard/noticeBoardUpdate");
		mav.addObject("noticeBoardUpdate", update);
		System.out.println("String noticeBoardUpdate open");
		return mav;
	}

	// 글 수정
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void getUpdatey(@RequestParam("boardId") int boardId, Model model) throws Exception {
		NoticeBoardVO vo = noticeBoardService.view(boardId);

		model.addAttribute("updateNoticeBoard", vo);

	}

	// 글 삭제
	@RequestMapping(value = "/deleteNoticeBoardPro")
	public String deleteNoticeBoardPro(NoticeBoardVO vo, RedirectAttributes rttr) throws Exception {
		noticeBoardService.deleteNoticeBoard(vo);
		rttr.addFlashAttribute("result","deleteOK");
		System.out.println("============ deleteVideoBoard 성공==============");

		return "redirect:/noticeboard/noticeBoardList";
	}
}
