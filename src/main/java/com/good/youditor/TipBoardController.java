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
import com.good.dto.TipBoardVO;
import com.good.service.TipBoardService;

@Controller
@RequestMapping("/tipboard")
public class TipBoardController {

	//	@RequestMapping(value = "/TipboardList", method = RequestMethod.GET)
	//	public void boardlist(Model model) throws Exception {
	//
	//		System.out.println("dd");
	//	}

	// 주입
	@Inject
	TipBoardService tipBoardService;

	// 게시물 목록
	@RequestMapping(value = "/tipBoardList")
	public ModelAndView list() throws Exception {
		List<TipBoardVO> list = tipBoardService.listAll();

		ModelAndView mav = new ModelAndView();
		mav.setViewName("tipboard/tipBoardList");
		System.out.println("TipBoardController TipBoardList open");
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
		System.out.println("TipBoardController boardView open");
		return mav;
	}

	// 게시물 상세정보
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public ModelAndView writedo() throws Exception {
		System.out.println("*************************************************");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("tipboard/boardWrite");
		System.out.println("TipBoardController boardWrite open");
		return mav;
	}

	// 글작성
	@RequestMapping(value="/insertTipBoardForm")
	public String insertTipBoardForm() throws Exception{
		return "tipboard/insertTipBoard";
	}

	// 글작성 완료
	// insertTipBoardForm-> insertTipBoardPro
	@RequestMapping(value="/insertTipBoardPro" , method=RequestMethod.POST)
	public String insertTipBoardPro(TipBoardVO vo) throws Exception{
		System.out.println("============insertTipBoardPro 성공==============");
		System.out.println(vo);
		tipBoardService.insertTipBoard(vo);

		return "redirect:/";

	}

	//파일 이동
	//게시글 수정
	//'tipBoardUpdate.jsp' 로 이동 <-- 이동하고자 하는 파일로 명 바꾸면됨
	@RequestMapping(value = "/tipBoardUpdate", method=RequestMethod.GET)
	public ModelAndView join(Locale locale, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("tipboard/tipBoardUpdate");
		System.out.println("String tipboardlist open");
		return mav;
	}

	// 글 수정
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void getUpdatey(@RequestParam("boardId") int boardId, Model model) throws Exception {

		TipBoardVO vo = tipBoardService.view(boardId);

	  model.addAttribute("updateTipBoard", vo);

	}

	// 글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void getDelete(@RequestParam("boardId") int boardId, Model model) throws Exception {
		model.addAttribute("deleteTipBoard", boardId);

	}

	// 글 수정  POST
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String postUpdate(TipBoardVO vo) throws Exception {
		tipBoardService.updateTipBoard(vo);

	  return "redirect:/tipboard/tipBoardList";

	}

	// 글 삭제  POST
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String postDelete(@RequestParam("boardId") int boardId) throws Exception {
		tipBoardService.deleteTipBoard(boardId);

	  return "redirect:/tipboard/tipBoardList";
	}
}
