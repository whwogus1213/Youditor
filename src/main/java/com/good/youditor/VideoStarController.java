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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.good.dto.AccountsVO;
import com.good.dto.VideoStarVO;
import com.good.service.VideoBoardService;
import com.good.service.VideoStarService;

@Controller
@RequestMapping("/videostar")
public class VideoStarController {

	@Inject
	VideoStarService videoStarService;
	
	/*
	// 처음 평가
	@RequestMapping(value = "/insertVideoStarPro")
	public String insert(VideoStarVO vo) throws Exception {
		System.out.println("============insertVideoBoardPro 성공==============");
		System.out.println(vo);
		videoStarService.insert(vo);

		return "redirect:/videoboard/videoBoardList";
	}*/
	
	// 평점 추가
	@RequestMapping(value = "/insertVideoStarPro", method = RequestMethod.POST)
	public @ResponseBody String insert(HttpServletRequest request, VideoStarVO vo) throws Exception {

		
		System.out.println("Start videostar insert");
		System.out.println(vo);

		HttpSession session = request.getSession();
		AccountsVO loginVO = (AccountsVO) session.getAttribute("login");

		// 로그인 유저 아이디
		vo.setAccountId(loginVO.getAccountId());

		System.out.println("accountId : " + vo.getAccountId()); //
//			System.out.println("accountId" + accountId);

		try {
			System.out.println("videoStarService.insert 진입");
			videoStarService.insert(vo);
			System.out.println("videoStarService.insert 성공");
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success2";
	}
	
	
	@RequestMapping(value = "/starload", method = RequestMethod.POST)
	public @ResponseBody int load(VideoStarVO vo) throws Exception {
		
		int check = videoStarService.starCheck(vo.getAccountId(), vo.getBoardId());
		int star = 0;
		if(check == 1) {
			star = videoStarService.starload(vo);
		}
		
		return star;
	}
	
	@RequestMapping(value = "/starSum", method = RequestMethod.POST)
	public @ResponseBody int loadSum( VideoStarVO vo) throws Exception {
		
		
			int ss = videoStarService.starSum(vo);
		
		return ss;
	}
	
	
	// 평점 업데이트
	@RequestMapping(value = "/updateVideoStarPro", method = RequestMethod.POST)
	public @ResponseBody String updateVideoStarPro(HttpServletRequest request, VideoStarVO vo) throws Exception {
		System.out.println("Start videostar update");
		System.out.println(vo);

		HttpSession session = request.getSession();
		AccountsVO loginVO = (AccountsVO) session.getAttribute("login");

		// 로그인 유저 아이디
		vo.setAccountId(loginVO.getAccountId());

		System.out.println("accountId : " + vo.getAccountId());
		try {
			System.out.println("videoStarService.update 진입");
			videoStarService.update(vo);
			System.out.println("videoStarService.update 성공");
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "updatesuccess";
	}

	
		
}
