package com.good.youditor;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.good.dto.NoticeBoardVO;
import com.good.dto.NoticeCategoryVO;
import com.good.dto.RecruitBoardVO;
import com.good.dto.RecruitCategoryVO;
import com.good.dto.SearchBoard;
import com.good.dto.TipCategoryVO;
import com.good.dto.VideoCategoryVO;
import com.good.service.HomeService;
import com.good.service.RecruitBoardService;

@Controller
@RequestMapping("/recruitboard")
public class RecruitBoardController {

	@Inject
	RecruitBoardService recruitBoardService;
	
	@Inject
	HomeService homeService;

	// 게시물 목록
	@RequestMapping(value = "/recruitBoardList", method = RequestMethod.GET)
	public String list(Model model, HttpSession session,
							@RequestParam(required = false, defaultValue = "0") int categoryId,
							@RequestParam(required = false, defaultValue = "1") int page,
							@RequestParam(required = false, defaultValue = "object") String searchType,
							@RequestParam(required = false) String keyword) throws Exception {
		SearchBoard search = new SearchBoard();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		search.setCategoryId(categoryId);

		// 전체 게시글 개수
		int listCnt = recruitBoardService.getBoardListCnt(search);

		System.out.println(" listCnt : " + listCnt);
		System.out.println(" categoryId : " + categoryId);

		int rangeSize = search.getRangeSize();
		int range = ((page - 1) / rangeSize) + 1;
		
		search.pageInfo(page, range, listCnt);
		
		RecruitCategoryVO rCatVO = new RecruitCategoryVO();
		if(categoryId != 0) {
			System.out.println(" 카테고리 정보 취득 ");
			rCatVO = recruitBoardService.getCatInfo(categoryId);
			System.out.println(" TipCategoryVO : " + rCatVO);
		} else {
			rCatVO.setCategoryName("전체공지");
			rCatVO.setEditAuthority(4);
			rCatVO.setViewAuthority(3);
		}
		
		List<NoticeCategoryVO> nCatList = homeService.bringNoticeCategory();
		List<VideoCategoryVO> vCatList = homeService.bringVideoCategory();
		List<TipCategoryVO> tCatList = homeService.bringTipCategory();
		List<RecruitCategoryVO> rCatList = homeService.bringRecruitCategory();
		
		session.setAttribute("nCatList", nCatList);
		session.setAttribute("vCatList", vCatList);
		session.setAttribute("tCatList", tCatList);
		session.setAttribute("rCatList", rCatList);

		model.addAttribute("pagination", search);
		model.addAttribute("categoryInfo", rCatVO);
		model.addAttribute("RecruitBoardList", recruitBoardService.listAll(search));
		System.out.println("RecruitBoardController RecruitBoardList open");
		return "recruitboard/recruitBoardList";
	}

	// 게시물 상세정보
	@RequestMapping(value = "/recruitBoardView", method = RequestMethod.GET)
	public ModelAndView view(HttpSession session, @RequestParam("boardId") int boardId) throws Exception {

		RecruitBoardVO row = recruitBoardService.view(boardId);
		
		List<NoticeCategoryVO> nCatList = homeService.bringNoticeCategory();
		List<VideoCategoryVO> vCatList = homeService.bringVideoCategory();
		List<TipCategoryVO> tCatList = homeService.bringTipCategory();
		List<RecruitCategoryVO> rCatList = homeService.bringRecruitCategory();
		
		session.setAttribute("nCatList", nCatList);
		session.setAttribute("vCatList", vCatList);
		session.setAttribute("tCatList", tCatList);
		session.setAttribute("rCatList", rCatList);

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
	
	@ResponseBody
	@RequestMapping(value = "/newRecruit2", method = {RequestMethod.GET,RequestMethod.POST})
	public List<RecruitBoardVO> rankList2() throws Exception {
		System.out.println("Start RecruitBoard List");
		List<RecruitBoardVO> rankList = recruitBoardService.rankList2();
		System.out.println("List : " + rankList);
		return rankList;
	}
	@ResponseBody
	@RequestMapping(value = "/newRecruit1", method = {RequestMethod.GET,RequestMethod.POST})
	public List<RecruitBoardVO> rankList1() throws Exception {
		System.out.println("Start RecruitBoard List");
		List<RecruitBoardVO> rankList = recruitBoardService.rankList1();
		System.out.println("List : " + rankList);
		return rankList;
	}
}
