package com.good.youditor;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.good.dto.AccountsVO;
import com.good.dto.TipStarVO;
import com.good.service.TipStarService;

@Controller
@RequestMapping("/tipstar")
public class TipStarController {

	@Inject
	TipStarService tipStarService;
	
	// 게시물 목록
	@ResponseBody
	@RequestMapping(value = "/StarList", method = {RequestMethod.GET,RequestMethod.POST})
	public List<TipStarVO> list() throws Exception {
		System.out.println("Start videostar List");
		List<TipStarVO> list = tipStarService.listAll();
		System.out.println("List : " + list);
		return list;
	}
	
	// 평점 추가
	@RequestMapping(value = "/insertVideoStarPro", method = RequestMethod.POST)
	public @ResponseBody String insert(HttpServletRequest request, TipStarVO vo) throws Exception {

		
		System.out.println("Start tipstar insert");
		System.out.println(vo);

		HttpSession session = request.getSession();
		AccountsVO loginVO = (AccountsVO) session.getAttribute("login");

		// 로그인 유저 아이디
		vo.setAccountId(loginVO.getAccountId());

		System.out.println("accountId : " + vo.getAccountId()); //
//			System.out.println("accountId" + accountId);

		try {
			System.out.println("tipStarService.insert 진입");
			tipStarService.insert(vo);
			System.out.println("tipStarService.insert 성공");
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success2";
	}
	
	
	@RequestMapping(value = "/starload", method = RequestMethod.POST)
	public @ResponseBody int load(TipStarVO vo) throws Exception {
		
		int check = tipStarService.starCheck(vo.getAccountId(), vo.getBoardId());
		int star = 0;
		if(check == 1) {
			star = tipStarService.starload(vo);
		}
		
		return star;
	}
	
	
	// 평점 업데이트
	@RequestMapping(value = "/updateVideoStarPro", method = RequestMethod.POST)
	public @ResponseBody String updateVideoStarPro(HttpServletRequest request, TipStarVO vo) throws Exception {
		System.out.println("Start videostar update");
		System.out.println(vo);

		HttpSession session = request.getSession();
		AccountsVO loginVO = (AccountsVO) session.getAttribute("login");

		// 로그인 유저 아이디
		vo.setAccountId(loginVO.getAccountId());

		System.out.println("accountId : " + vo.getAccountId());
		try {
			System.out.println("tipStarService.update 진입");
			tipStarService.update(vo);
			System.out.println("tipStarService.update 성공");
			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "updatesuccess";
	}

	
		
}