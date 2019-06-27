package com.good.youditor;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.good.dto.AccountsVO;
import com.good.dto.ReplyVO;
import com.good.dto.VideoBoardVO;
import com.good.service.ReplyService;
import com.good.service.VideoBoardService;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {

	@Inject
	ReplyService service;
	
	// 게시물 목록
	@RequestMapping(value = "/insert", method=RequestMethod.POST)
	public void insert(HttpSession session, ReplyVO vo) throws Exception{
		System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");
		AccountsVO av = (AccountsVO)session.getAttribute("login");
		int accountId = av.getAccountId();
		System.out.println(accountId+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		vo.setAccountId(accountId);
		service.insert(vo);
	}
}
