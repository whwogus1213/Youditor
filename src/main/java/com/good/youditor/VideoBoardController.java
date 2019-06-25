package com.good.youditor;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.good.dto.AccountsVO;

@Controller
@RequestMapping("/board")
public class VideoBoardController {

	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	public void boardlist(Model model) throws Exception {

		System.out.println("dd");
	}
	
}
