package com.good.youditor;

import java.util.List;
import java.util.Locale;

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
import com.good.dto.Search;
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
	public ModelAndView list(@RequestParam(required = false, defaultValue = "0") int category,
							 @RequestParam(required = false, defaultValue = "1") int page,
							 @RequestParam(required = false, defaultValue = "1") int range,
							 @RequestParam(required = false, defaultValue = "object") String searchType,
							 @RequestParam(required = false) String keyword, HttpServletRequest request) throws Exception {		
		VideoCategoryVO videoCategoryVO = new VideoCategoryVO();
		ModelAndView mav = new ModelAndView();
		
		// 검색
		videoCategoryVO.setSearchType(searchType);
		videoCategoryVO.setKeyword(keyword);
		videoCategoryVO.setCategoryId(category);
		
		
		// 게시물 갯수
		int listCnt = videoBoardService.getBoardListCnt(videoCategoryVO);
		System.out.println(" videoboard 게시물 갯수 : " + listCnt);
		
		videoCategoryVO.setListSize(6);
		videoCategoryVO.pageInfo(page, range, listCnt);
		
		mav.addObject("pagination", videoCategoryVO);
		
		List<VideoBoardVO> list = videoBoardService.listAll(videoCategoryVO);
		
		mav.setViewName("videoboard/videoBoardList");
		mav.addObject("VideoBoardList", list);
		
		String categoryName = "";
		if (category == 0) {
			categoryName = "전체";
		} else if (category == 1) {
			categoryName = "게임";
		} else if (category == 2) {
			categoryName = "먹방";
		} else if (category == 3) {
			categoryName = "일상";
		} else if (category == 4) {
			categoryName = "모터";
		} else if (category == 5) {
			categoryName = "스포츠";
		} else if (category == 6) {
			categoryName = "예능";
		}
		request.setAttribute("categoryId", category);
		request.setAttribute("categoryName", categoryName);
		return mav;
	}

	// 게시물 상세정보
	@RequestMapping(value = "/videoBoardView", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam("boardId") int boardId, HttpServletRequest request) throws Exception {

		// 로그인 세션->followerAccountId
		HttpSession session = request.getSession();
		AccountsVO loginVO = (AccountsVO) session.getAttribute("login");

		VideoBoardVO row = videoBoardService.view(boardId);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("videoboard/videoBoardView");
		mav.addObject("row", row);

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
	public ModelAndView joinUpdate(Locale locale, Model model, @RequestParam("boardId") int boardId) throws Exception {
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
		rttr.addFlashAttribute("result", "deleteOK");
		System.out.println("============ deleteVideoBoard 성공==============");

		return "redirect:/videoboard/videoBoardList";
	}

}
