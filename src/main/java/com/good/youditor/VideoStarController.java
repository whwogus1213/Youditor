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

import com.good.dto.VideoStarVO;
import com.good.service.VideoStarService;

@Controller
@RequestMapping("/videostar")
public class VideoStarController {

	@Inject
	VideoStarService videoStarService;
	
	// 처음 평가
	@RequestMapping(value = "/insertVideoStarPro")
	public String insert(VideoStarVO vo) throws Exception {
		System.out.println("============insertVideoBoardPro 성공==============");
		System.out.println(vo);
		videoStarService.insert(vo);

		return "redirect:/videoboard/videoBoardList";
	}
	
	// 평점1
	@RequestMapping(value = "/updateVideoStarPro1")
	public String updateVideoStarPro1(int boardId) throws Exception {
		videoStarService.update1(boardId);
		System.out.println("============ updateVideoStarPro1 성공==============");
		
		return "ok";
	}

	// 평점2
	@RequestMapping(value = "/updateVideoStarPro2")
	public String updateVideoStarPro2(int boardId) throws Exception {
		videoStarService.update2(boardId);
		System.out.println("============ updateVideoStarPro2 성공==============");
		return "ok";

	}
	// 평점3
	@RequestMapping(value = "/updateVideoStarPro3")
	public String updateVideoStarPro3(int boardId) throws Exception {
		videoStarService.update3(boardId);
		System.out.println("============ updateVideoStarPro3 성공==============");
		return "ok";

	}
	// 평점4
	@RequestMapping(value = "/updateVideoStarPro4")
	public String updateVideoStarPro4(int boardId) throws Exception {
		videoStarService.update4(boardId);
		System.out.println("============ updateVideoStarPro4 성공==============");
		return "ok";

	}
	// 평점5
	@RequestMapping(value = "/updateVideoStarPro5")
	public String updateVideoStarPro5(int boardId) throws Exception {
		videoStarService.update5(boardId);
		System.out.println("============ updateVideoStarPro5 성공==============");
		return "ok";
		
	}
		
}
