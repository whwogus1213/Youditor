package com.good.youditor;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.good.dto.AccountsVO;
import com.good.dto.FollowListVO;
import com.good.service.FollowService;

@Controller
@RequestMapping("/follow")
public class FollowController {

	@Inject
	FollowService followService;
	
	// 팔로잉 (로그인유저가 팔로우하는 사람 리스트)
	@RequestMapping(value = "/followingList")
	public String followingList(Model model, FollowListVO vo, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		AccountsVO loginVO = (AccountsVO) session.getAttribute("login");
		vo.setFollowAccountId(loginVO.getAccountId());
		
		System.out.println("Start following List : " + vo);
		
		List<FollowListVO> followingList = followService.followingList(vo.getFollowAccountId());
		System.out.println(vo.getFollowAccountId());
		model.addAttribute("followingList", followingList);
		
		System.out.println(followingList);
		return "follow/followingList";
	}
	
	// 팔로워(로그인유저를 팔로우하는 사람 리스트)
	@RequestMapping(value = "/followerList")
	public String followerList(Model model, FollowListVO vo, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		AccountsVO loginVO = (AccountsVO) session.getAttribute("login");
		vo.setFollowAccountId(loginVO.getAccountId());
		
		System.out.println("Start follower List : " + vo);
		
		List<FollowListVO> followerList = followService.followerList(vo.getFollowAccountId());
		System.out.println(vo.getFollowAccountId());
		model.addAttribute("followerList", followerList);
		
		System.out.println(followerList);
		return "follow/followerList";
	}
	
//	// 팔로잉 목록 + 페이징 + 검색
//	@RequestMapping(value = "/followingList", method = RequestMethod.GET)
//	public String followingList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
//											 @RequestParam(required = false, defaultValue = "1") int range,
//											 @RequestParam(required = false, defaultValue = "followAccountId") String searchType,
//											 @RequestParam(required = false) String keyword) throws Exception {
//		Search search = new Search();
//		search.setSearchType(searchType);
//		search.setKeyword(keyword);
//		
//		// 팔로워 수
//		int listCnt = followService.getFollowListCnt(search);
//		
//		search.pageInfo(page, range, listCnt);
//
//		model.addAttribute("pagination", search);
//		model.addAttribute("FollowList", followService.listAll(search));
//		System.out.println("FollowController FollowingList open");
//		return "follow/followingList";
//	}
//	
//	// 팔로워 목록 + 페이징 + 검색
//	@RequestMapping(value = "/followerList", method = RequestMethod.GET)
//	public String followerList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
//											@RequestParam(required = false, defaultValue = "1") int range,
//											@RequestParam(required = false, defaultValue = "followAccountId") String searchType,
//											@RequestParam(required = false) String keyword) throws Exception {
//		Search search = new Search();
//		search.setSearchType(searchType);
//		search.setKeyword(keyword);
//		
//		// 팔로워 수
//		int listCnt = followService.getFollowListCnt(search);
//		
//		search.pageInfo(page, range, listCnt);
//		
//		model.addAttribute("pagination", search);
//		model.addAttribute("FollowList", followService.listAll(search));
//		System.out.println("FollowController FollowerList open");
//		return "follow/followerList";
//	}
}
