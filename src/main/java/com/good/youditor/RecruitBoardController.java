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
import com.good.dto.RecruitBoardVO;
import com.good.service.RecruitBoardService;

@Controller
@RequestMapping("/recruitboard")
public class RecruitBoardController {

	//	@RequestMapping(value = "/RecruitboardList", method = RequestMethod.GET)
	//	public void boardlist(Model model) throws Exception {
	//
	//		System.out.println("dd");
	//	}

	// 주입
	@Inject
	RecruitBoardService recruitBoardService;

	// 게시물 목록
	@RequestMapping(value = "/recruitBoardList")
	public ModelAndView list() throws Exception {
		List<RecruitBoardVO> list = recruitBoardService.listAll();

		ModelAndView mav = new ModelAndView();
		mav.setViewName("recruitboard/recruitBoardList");
		System.out.println("RecruitBoardController RecruitBoardList open");
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
		System.out.println("RecruitBoardController boardView open");
		return mav;
	}

	// 게시물 상세정보
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public ModelAndView writedo() throws Exception {
		System.out.println("*************************************************");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("recruitboard/boardWrite");
		System.out.println("RecruitBoardController boardWrite open");
		return mav;
	}

	// 글작성
	@RequestMapping(value="/insertRecruitBoardForm")
	public String insertRecruitBoardForm() throws Exception{
		return "recruitboard/insertRecruitBoard";
	}

	// 글작성 완료
	// insertRecruitBoardForm-> insertRecruitBoardPro
	@RequestMapping(value="/insertRecruitBoardPro" , method=RequestMethod.POST)
	public String insertRecruitBoardPro(RecruitBoardVO vo) throws Exception{
		System.out.println("============insertRecruitBoardPro 성공==============");
		System.out.println(vo);
		recruitBoardService.insertRecruitBoard(vo);

		return "redirect:/";

	}

	//파일 이동
	//게시글 수정
	//'recruitBoardUpdate.jsp' 로 이동 <-- 이동하고자 하는 파일로 명 바꾸면됨
	@RequestMapping(value = "/recruitBoardUpdate", method=RequestMethod.GET)
	public ModelAndView join(Locale locale, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("recruitboard/recruitBoardUpdate");
		System.out.println("String recruitboardlist open");
		return mav;
	}

	// 글 수정
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void getUpdatey(@RequestParam("boardId") int boardId, Model model) throws Exception {

		RecruitBoardVO vo = recruitBoardService.view(boardId);

	  model.addAttribute("updateRecruitBoard", vo);

	}

	// 글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void getDelete(@RequestParam("boardId") int boardId, Model model) throws Exception {
		model.addAttribute("deleteRecruitBoard", boardId);

	}

	// 글 수정  POST
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String postUpdate(RecruitBoardVO vo) throws Exception {
		recruitBoardService.updateRecruitBoard(vo);

	  return "redirect:/recruitboard/recruitBoardList";

	}

	// 글 삭제  POST
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String postDelete(@RequestParam("boardId") int boardId) throws Exception {
		recruitBoardService.deleteRecruitBoard(boardId);

	  return "redirect:/recruitboard/recruitBoardList";
	}
}
