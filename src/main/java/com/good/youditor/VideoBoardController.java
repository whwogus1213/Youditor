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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.good.dto.VideoBoardVO;
import com.good.service.VideoBoardService;

@Controller
@RequestMapping("/videoboard")
public class VideoBoardController {

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

	// 게시물 쓰기
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public ModelAndView writedo() throws Exception {
		System.out.println("*************************************************");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("videoboard/boardWrite");
		System.out.println("VideoBoardController boardWrite open");
		return mav;
	}

	// 글작성
	@RequestMapping(value = "/insertVideoBoardForm")
	public String insertVideoBoardForm() throws Exception {
		return "videoboard/insertVideoBoard";
	}

	// 글작성 완료
	// insertVideoBoardForm-> insertVideoBoardPro
	@RequestMapping(value = "/insertVideoBoardPro")
	public String insertVideoBoardPro(VideoBoardVO vo) throws Exception {
		System.out.println("============insertVideoBoardPro 성공==============");
		System.out.println(vo);
		videoBoardService.insertVideoBoard(vo);

		return "redirect:/";
	}

	// 파일 이동
	// 게시글 수정
	// 'videoBoardUpdate.jsp' 로 이동 <-- 이동하고자 하는 파일로 명 바꾸면됨
	@RequestMapping(value = "/updateVideoBoard.do", method = RequestMethod.GET)
	public ModelAndView joinUpdate(Locale locale, Model model,@RequestParam("boardId") int boardId) throws Exception {
		VideoBoardVO update = videoBoardService.view(boardId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("videoboard/videoBoardUpdate");
		mav.addObject("videoBoardUpdate", update);
		System.out.println("String videoBoardUpdate open");
		return mav;
	}
	// 파일 이동
	// 게시글 삭제
	// 'videoBoardDelete.jsp' 로 이동 <-- 이동하고자 하는 파일로 명 바꾸면됨
	@RequestMapping(value = "/deleteVideoBoard.do", method = RequestMethod.GET)
	public ModelAndView joinDelete(Locale locale, Model model,@RequestParam("boardId") int boardId) throws Exception {
		VideoBoardVO delete = videoBoardService.view(boardId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("videoboard/videoBoardDelete");
		mav.addObject("videoBoardDelete", delete);
		System.out.println("String videoBoardDelete open");
		return mav;
	}

	// 글 수정
	@RequestMapping(value = "/updateVideoBoardPro")
	public String updateVideoBoardPro(VideoBoardVO vo) throws Exception {
		videoBoardService.updateVideoBoard(vo);
		System.out.println("============ updateVideoBoard 성공==============");
		return "redirect:/videoboard/videoBoardList";

	}

	// 글 삭제
	@RequestMapping(value = "/deleteVideoBoardPro")
	public String deleteVideoBoardPro(VideoBoardVO vo, RedirectAttributes rttr) throws Exception {
		videoBoardService.deleteVideoBoard(vo);
		rttr.addFlashAttribute("result","deleteOK");
		System.out.println("============ deleteVideoBoard 성공==============");

		return "redirect:/videoboard/videoBoardList";
	}
}
