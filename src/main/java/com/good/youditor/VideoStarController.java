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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.good.dto.AccountsVO;
import com.good.dto.VideoStarVO;
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
	
	@RequestMapping(value = "/insertVideoStarPro")
	public String insertStar(VideoStarVO vo, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		System.out.println("============ insertVideoStarPro 성공==============");
        HttpSession session = request.getSession();
        AccountsVO loginVO = (AccountsVO)session.getAttribute("login");
        vo.setAccountId(loginVO.getAccountId());
		mav.addObject("star", loginVO);
		
        try{
        	videoStarService.insert(vo);
            
        } catch (Exception e){
            e.printStackTrace();
        }
        
        return "redirect:/videoboard/videoBoardList";
    }
	
	// 평점1
	@RequestMapping(value = "/updateVideoStarPro1")
	public String updateVideoStarPro1(VideoStarVO vo) throws Exception {
		videoStarService.update1(vo);
		System.out.println("============ updateVideoStarPro1 성공==============");
		
		return "redirect:/videoboard/videoBoardView?boardId=row.boardId";
	}

	// 평점2
	@RequestMapping(value = "/updateVideoStarPro2")
	public String updateVideoStarPro2(VideoStarVO vo) throws Exception {
		videoStarService.update2(vo);
		System.out.println("============ updateVideoStarPro2 성공==============");
		return "redirect:/videoboard/videoBoardView?boardId=row.boardId";

	}
	// 평점3
	@RequestMapping(value = "/updateVideoStarPro3")
	public String updateVideoStarPro3(VideoStarVO vo) throws Exception {
		videoStarService.update3(vo);
		System.out.println("============ updateVideoStarPro3 성공==============");
		return "redirect:/videoboard/videoBoardView?boardId=row.boardId";
		
	}
	// 평점4
	@RequestMapping(value = "/updateVideoStarPro4")
	public String updateVideoStarPro4(VideoStarVO vo) throws Exception {
		videoStarService.update4(vo);
		System.out.println("============ updateVideoStarPro4 성공==============");
		return "redirect:/videoboard/videoBoardView?boardId=row.boardId";
		
	}
	// 평점5
	@RequestMapping(value = "/updateVideoStarPro5")
	public String updateVideoStarPro5(VideoStarVO vo) throws Exception {
		videoStarService.update5(vo);
		System.out.println("============ updateVideoStarPro5 성공==============");
		return "redirect:/videoboard/videoBoardView?boardId=row.boardId";
		
	}
		
}
