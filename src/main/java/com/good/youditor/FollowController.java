package com.good.youditor;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.good.dto.AccountsVO;
import com.good.dto.FollowListVO;
import com.good.dto.VideoBoardVO;
import com.good.service.FollowService;
import com.good.service.VideoBoardService;

@Controller
@RequestMapping("/follow")
public class FollowController {

	@Inject
	FollowService followService;

	// 팔로잉 (로그인유저가 팔로우하는 사람 리스트)
	@RequestMapping(value = "/followingList")
	public String followingList(Model model, FollowListVO vo, HttpServletRequest request) throws Exception {
		System.out.println("Start following List");

		HttpSession session = request.getSession();
		AccountsVO loginVO = (AccountsVO) session.getAttribute("login");
		vo.setFollowAccountId(loginVO.getAccountId());

		List<FollowListVO> followingList = followService.followingList(vo.getFollowAccountId());
		
		System.out.println(vo.getFollowAccountId());
		model.addAttribute("followingList", followingList);

		System.out.println(followingList);
		return "follow/followingList";
	}

	// 팔로워(로그인유저를 팔로우하는 사람 리스트)
	@RequestMapping(value = "/followerList")
	public String followerList(Model model, FollowListVO vo, HttpServletRequest request) throws Exception {
		System.out.println("Start follower List");

		HttpSession session = request.getSession();
		AccountsVO loginVO = (AccountsVO) session.getAttribute("login");
		vo.setFollowAccountId(loginVO.getAccountId());
		System.out.println(vo.getFollowAccountId());
		
		List<FollowListVO> followerList = followService.followerList(vo.getFollowAccountId());
		
		model.addAttribute("followerList", followerList);
		System.out.println(vo.getFollowerAccountId());
		System.out.println(followerList);
		return "follow/followerList";
	}

	// 팔로잉 추가
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public @ResponseBody String insert(HttpServletRequest request, FollowListVO vo) throws Exception {

		System.out.println("----------Start follow insert");
		System.out.println("글쓴이 아이디 정보 : " + vo);

		HttpSession session = request.getSession();
		AccountsVO loginVO = (AccountsVO) session.getAttribute("login");

		// 로그인 유저 아이디
		vo.setFollowerAccountId(loginVO.getAccountId());

		System.out.println("로그인 유저 아이디 -> followerAccountId : " + vo.getFollowerAccountId());
//		System.out.println("accountId" + accountId);
		System.out.println("followList : " + vo);

		// followService.insert(vo);
		try {
			System.out.println("followService.insert 진입");
			followService.insert(vo);
			System.out.println("followService.insert 성공");

		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("----------End follow insert");
		return "success";
	}

	// 팔로잉 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public @ResponseBody String delete(HttpServletRequest request, FollowListVO vo) throws Exception {

		System.out.println("-------------End follow delete");
		System.out.println("글쓴이 아이디 정보 : " + vo);

		// 로그인 유저 아이디
		HttpSession session = request.getSession();
		AccountsVO loginVO = (AccountsVO) session.getAttribute("login");

		// followerAccountId에 로그인 아이디 세팅
		vo.setFollowerAccountId(loginVO.getAccountId());

		System.out.println("로그인 유저 아이디 -> followerAccountId : " + vo.getFollowerAccountId());
//		System.out.println("accountId" + accountId);
		System.out.println("followList : " + vo);

		// followService.insert(vo);
		try {
			System.out.println("followService.delete 진입");
			followService.delete(vo);
			System.out.println("followService.delete 성공");

		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("-------------End follow delete");
		return "success1";
	}

	@Inject
	VideoBoardService videoBoardService;

	// 팔로잉 check
	@RequestMapping(value = "/check", method = RequestMethod.POST)
	public @ResponseBody int check(FollowListVO vo) throws Exception {
		System.out.println(vo);
		int fc = videoBoardService.followCheck(vo.getFollowerAccountId(), vo.getFollowAccountId());
		System.out.println(fc + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		return fc;
	}
	
	// 팔로우 게시물 목록
	@RequestMapping(value = "followBoardList")
	public ModelAndView followBoardList(@RequestParam("followAccountId") int followAccountId) throws Exception {
		System.out.println("팔로우 게시물 목록 시작");
		System.out.println("   followAccountId   " + followAccountId);
		
		List<VideoBoardVO> VideoBoardList = videoBoardService.followBoardList(followAccountId);
		
		ModelAndView mv = new ModelAndView();
//		mv.setViewName("follow/followBoardList");
		mv.setViewName("videoboard/videoBoardList");
		mv.addObject("VideoBoardList", VideoBoardList);
		
		System.out.println("팔로우 게시물 목록 끝");
		return mv;
	}	

}
