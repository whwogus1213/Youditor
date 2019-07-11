package com.good.youditor;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.good.dto.RecruitBoardVO;
import com.good.dto.RecruitCategoryVO;
import com.good.service.RecruitBoardService;

@Controller
@RequestMapping("/recruitboard")
public class RecruitBoardController {

	@Inject
	RecruitBoardService recruitBoardService;

	// 게시물 목록
	@RequestMapping(value = "/recruitBoardList", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam(required = false, defaultValue = "1") int categoryId,
			 @RequestParam(required = false, defaultValue = "1") int page,
			 @RequestParam(required = false, defaultValue = "1") int range,
			 @RequestParam(required = false, defaultValue = "object") String searchType,
			 @RequestParam(required = false) String keyword, HttpServletRequest request) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		RecruitCategoryVO recruitCategoryVO = new RecruitCategoryVO();
		// 검색
		recruitCategoryVO.setSearchType(searchType);
		recruitCategoryVO.setKeyword(keyword);
		recruitCategoryVO.setCategoryId(categoryId);

		// 게시물 갯수
		int listCnt = recruitBoardService.getBoardListCnt(recruitCategoryVO);
		System.out.println(" recruitboard 게시물 갯수 : " + listCnt);

		recruitCategoryVO.setListSize(6);
		recruitCategoryVO.pageInfo(page, range, listCnt);

		mav.addObject("pagination", recruitCategoryVO);
		List<RecruitBoardVO> list = recruitBoardService.listAll(recruitCategoryVO);

		
		mav.setViewName("recruitboard/recruitBoardList");
		System.out.println("RecruitBoardController RecruitBoardList open");
		mav.addObject("RecruitBoardList", list);
		return mav;
	}

	// 게시물 상세정보
	@RequestMapping(value = "/recruitBoardView", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam("boardId") int boardId) throws Exception {

		RecruitBoardVO row = recruitBoardService.view(boardId);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("recruitboard/recruitBoardView");
		mav.addObject("row", row);
		System.out.println("RecruitBoardController boardView open");
		return mav;
	}

	// 게시물 쓰기
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public ModelAndView writedo() throws Exception {
		System.out.println("*************************************************");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("recruitboard/recruitBoardWrite");
		System.out.println("RecruitBoardController boardWrite open");
		return mav;
	}

	// 글작성
	@RequestMapping(value = "/insertRecruitBoardForm")
	public String insertRecruitBoardForm() throws Exception {
		return "recruitboard/insertRecruitBoard";
	}

	// 글작성 완료
	@RequestMapping(value = "/insertRecruitBoardPro", method = RequestMethod.POST)
	public String insertRecruitBoardPro(RecruitBoardVO vo) throws Exception {
		System.out.println("============insertRecruitBoardPro 성공==============");
		System.out.println(vo);
		recruitBoardService.insertRecruitBoard(vo);

		return "redirect:/recruitboard/recruitBoardList";

	}

	// 글 수정
	@RequestMapping(value = "/updateRecruitBoard", method = RequestMethod.GET)
	public ModelAndView getUpdate(@RequestParam("boardId") int boardId) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		RecruitBoardVO vo = recruitBoardService.view(boardId);
		mav.addObject("row",vo);
		mav.setViewName("recruitboard/recruitBoardUpdate");
		return mav;
	}

	// 글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("boardId") int boardId) throws Exception {
		recruitBoardService.deleteRecruitBoard(boardId);
		return "redirect:/recruitboard/recruitBoardList";
	}

	// 글 수정  POST
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String postUpdate(RecruitBoardVO vo) throws Exception {
		recruitBoardService.updateRecruitBoard(vo);
		System.out.println("============ updateRecruitBoard 성공==============");
		return "redirect:/recruitboard/recruitBoardList";		
	}

}
