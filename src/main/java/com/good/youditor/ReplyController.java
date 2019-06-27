package com.good.youditor;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public String insertComment(@ModelAttribute("ReplyVO") ReplyVO vo, HttpServletRequest request) throws Exception{
        
        HttpSession session = request.getSession();
        AccountsVO loginVO = (AccountsVO)session.getAttribute("login");
        
		
        try{
            service.insert(vo);
            
        } catch (Exception e){
            e.printStackTrace();
        }
        
        return "success";
    }
	/*
	 * public void insert(HttpSession session, ReplyVO vo) throws Exception{
	 * AccountsVO av = (AccountsVO)session.getAttribute("login"); int accountId =
	 * av.getAccountId(); System.out.println("댓글 작성자 계정번호 : "+accountId);
	 * vo.setAccountId(accountId); service.insert(vo); }
	 */
	
	@RequestMapping(value="/listAll")
	public ResponseEntity listComment(@ModelAttribute("ReplyVO") ReplyVO vo, HttpServletRequest request) throws Exception{
        
        HttpHeaders responseHeaders = new HttpHeaders();
        ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
        
        // 해당 게시물 댓글
        List<ReplyVO> replyVO
        
        if(replyVO.size() > 0){
            for(int i=0; i<replyVO.size(); i++){
                HashMap hm = new HashMap();
                hm.put("commentId", replyVO.get(i).getCommentId());
                hm.put("object", replyVO.get(i).getObject());
                hm.put("nickname", replyVO.get(i).getNickname());
                
                hmlist.add(hm);
            }
            
        }
        
        JSONArray json = new JSONArray(hmlist);        
        return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
        
    }
	/*public void listAll(HttpSession session, int boardId, Model model) throws Exception {
		AccountsVO av = (AccountsVO)session.getAttribute("login");
		
		ModelAndView mav = new ModelAndView();
		
		List<ReplyVO> list = service.listAll(boardId);
		System.out.println(list);
		model.addAttribute("list", list);
		
	}*/
}
