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
import com.good.dto.NoticeCategoryVO;
import com.good.dto.RecruitCategoryVO;
import com.good.dto.SearchBoard;
import com.good.dto.TipCategoryVO;
import com.good.dto.VideoBoardVO;
import com.good.dto.VideoCategoryVO;
import com.good.service.HomeService;
import com.good.service.VideoBoardService;

@Controller
@RequestMapping("/videoboard")
public class VideoBoardController {

	@Inject
	VideoBoardService videoBoardService;
	
	@Inject
	HomeService homeService;

	// 게시물 목록
	@RequestMapping(value = "/videoBoardList", method = RequestMethod.GET)
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
		int listCnt = videoBoardService.getBoardListCnt(search);

		System.out.println(" listCnt : " + listCnt);
		System.out.println(" categoryId : " + categoryId);
		
		int rangeSize = search.getRangeSize();
		int range = ((page - 1) / rangeSize) + 1;
		search.setListSize(6);
		search.pageInfo(page, range, listCnt);
		
		VideoCategoryVO vCatVO = new VideoCategoryVO();
		if(categoryId != 0) {
			System.out.println(" 카테고리 정보 취득 ");
			vCatVO = videoBoardService.getCatInfo(categoryId);
			System.out.println(" VideoCategoryVO : " + vCatVO);
		} else {
			vCatVO.setCategoryName("전체보기");
			vCatVO.setCategoryPicture("all.jpg");
			vCatVO.setEditAuthority(4);
			vCatVO.setViewAuthority(3);
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
		model.addAttribute("categoryInfo", vCatVO);
		model.addAttribute("VideoBoardList", videoBoardService.listAll(search));
		System.out.println("VideoBoardController VideoBoardList open");
		return "videoboard/videoBoardList";
	}

	// 게시물 상세정보
	@RequestMapping(value = "/videoBoardView", method = RequestMethod.GET)
	public String view(@RequestParam("boardId") int boardId, HttpSession session, Model model) throws Exception {

		VideoBoardVO row = videoBoardService.view(boardId);
		
		List<NoticeCategoryVO> nCatList = homeService.bringNoticeCategory();
		List<VideoCategoryVO> vCatList = homeService.bringVideoCategory();
		List<TipCategoryVO> tCatList = homeService.bringTipCategory();
		List<RecruitCategoryVO> rCatList = homeService.bringRecruitCategory();
		
		session.setAttribute("nCatList", nCatList);
		session.setAttribute("vCatList", vCatList);
		session.setAttribute("tCatList", tCatList);
		session.setAttribute("rCatList", rCatList);
		
		model.addAttribute("row", row);
		return "videoboard/videoBoardView";
	}

	
	// 게시물 쓰기
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public ModelAndView writedo() throws Exception {
		System.out.println("*************************************************");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("videoboard/videoBoardWrite");
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
