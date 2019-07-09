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

import com.good.dto.Search;
import com.good.dto.TipBoardVO;
import com.good.service.TipBoardService;

@Controller
@RequestMapping("/tipboard")
public class TipBoardController {

	@Inject
	TipBoardService tipBoardService;

	// 게시물 목록 + 페이징 + 검색
	@RequestMapping(value = "/tipBoardList", method = RequestMethod.GET)
	public String list(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "object") String searchType,
			@RequestParam(required = false) String keyword) throws Exception {
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);

		// 전체 게시글 개수
		int listCnt = tipBoardService.getBoardListCnt(search);

		search.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", search);
		model.addAttribute("TipBoardList", tipBoardService.listAll(search));
		System.out.println("TipBoardController TipBoardList open");
		return "tipboard/tipBoardList";
	}

	// 게시물 상세정보
	@RequestMapping(value = "/tipBoardView", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam("boardId") int boardId) throws Exception {
		System.out.println("*************************************************");
		TipBoardVO row = tipBoardService.view(boardId);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("tipboard/tipBoardView");
		mav.addObject("row", row);
		System.out.println("TipBoardController boardView open");
		System.out.println(row);
		return mav;
	}

	// 게시물 쓰기
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public ModelAndView writedo() throws Exception {
		System.out.println("*************************************************");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("tipboard/tipBoardWrite");
		System.out.println("TipBoardController boardWrite open");
		return mav;
	}

	// 글작성 완료
	@RequestMapping(value = "/insertTipBoardPro", method = RequestMethod.POST)
	public String insertTipBoardPro(TipBoardVO vo) throws Exception {
		System.out.println("============insertTipBoardPro 성공==============");
		System.out.println(vo);
		tipBoardService.insertTipBoard(vo);

		return "redirect:/tipboard/tipBoardList";
	}
	
	// 글 수정
	@RequestMapping(value = "/updateTipBoardPro")
	public String updateNoticeBoardPro(TipBoardVO vo) throws Exception {
		tipBoardService.updateTipBoard(vo);
		System.out.println("============ updateTipBoard 성공==============");
		return "redirect:/tipboard/tipBoardList";
	}

	// 파일 이동
	// 게시글 수정
	@RequestMapping(value = "/updateTipBoard.do", method = RequestMethod.GET)
	public ModelAndView joinUpdate(Locale locale, Model model, @RequestParam("boardId") int boardId) throws Exception {
		TipBoardVO update = tipBoardService.view(boardId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tipboard/tipBoardUpdate");
		mav.addObject("tipBoardUpdate", update);
		System.out.println("String tipBoardUpdate open");
		return mav;
	}

	// 글 수정
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void getUpdatey(@RequestParam("boardId") int boardId, Model model) throws Exception {
		TipBoardVO vo = tipBoardService.view(boardId);

		model.addAttribute("updateTipBoard", vo);

	}

	// 글 삭제
	@RequestMapping(value = "/deleteTipBoardPro")
	public String deleteTipBoardPro(TipBoardVO vo, RedirectAttributes rttr) throws Exception {
		tipBoardService.deleteTipBoard(vo);
		rttr.addFlashAttribute("result","deleteOK");
		System.out.println("============ deleteVideoBoard 성공==============");

		return "redirect:/tipboard/tipBoardList";
	}
}
