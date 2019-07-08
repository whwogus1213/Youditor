package com.good.youditor;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.good.dto.AccountsVO;
import com.good.dto.FollowListVO;
import com.good.dto.VideoBoardVO;
import com.good.dto.VideoCategoryVO;
import com.good.service.VideoBoardService;

@Controller
@RequestMapping("/videoboard")
public class VideoBoardController {

	@Inject
	VideoBoardService videoBoardService;

	// 게시물 목록
	@RequestMapping(value = "/videoBoardList", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam(required = false, defaultValue = "0") int category, HttpServletRequest request) throws Exception {
		System.out.println(category+"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
		
		VideoCategoryVO videoCategoryVO = new VideoCategoryVO();
		videoCategoryVO.setCategoryId(category);
		
		List<VideoBoardVO> list = videoBoardService.listAll(videoCategoryVO);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("videoboard/videoBoardList");
		System.out.println("VideoBoardController VideoBoardList open");
		mav.addObject("VideoBoardList", list);
		String categoryName = "";
		if(category == 0) {
			categoryName = "전체";
		}else if(category == 1) {
			categoryName = "게임";
		}else if(category == 2) {
			categoryName = "먹방";
		}else if(category == 3) {
			categoryName = "일상";
		}else if(category == 4) {
			categoryName = "모터";
		}else if(category == 5) {
			categoryName = "스포츠";
		}else if(category == 6) {
			categoryName = "예능";
		}
		request.setAttribute("categoryName", categoryName);
		return mav;
	}

	// 게시물 상세정보
	@RequestMapping(value = "/videoBoardView", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam("boardId") int boardId, HttpServletRequest request) throws Exception {
		
		// 로그인 세션->followerAccountId
		HttpSession session = request.getSession();
		AccountsVO loginVO = (AccountsVO)session.getAttribute("login");
		
		VideoBoardVO row = videoBoardService.view(boardId);
		
		System.out.println("로그인세션 : " + loginVO.getAccountId());
		System.out.println("글쓴이아이디 : " + row.getAccountId());
		
		// 로그인 아이디, 글쓴이 아이디
		int fc = videoBoardService.followCheck(loginVO.getAccountId(), row.getAccountId());
		System.out.println(fc);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("videoboard/videoBoardView");
		mav.addObject("row", row);
		mav.addObject("followCheck", fc);
		
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

		return "redirect:/videoboard/videoBoardList";
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
