package com.good.youditor;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.good.dto.AccountsVO;
import com.good.dto.ReplyVO;
import com.good.service.ReplyService;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {

	@Inject
	ReplyService service;

	@RequestMapping(value = "/insert", method=RequestMethod.POST)
	public String insertComment(ReplyVO vo, HttpServletRequest request) throws Exception{
        
        HttpSession session = request.getSession();
        AccountsVO loginVO = (AccountsVO)session.getAttribute("login");
        vo.setAccountId(loginVO.getAccountId());
        
        try{
            service.insert(vo);
            
        } catch (Exception e){
            e.printStackTrace();
        }
        
        return "success";
    }

	@RequestMapping(value = "/reInsert", method=RequestMethod.POST)
	public String reInsertComment(ReplyVO vo, HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		AccountsVO loginVO = (AccountsVO)session.getAttribute("login");
		vo.setAccountId(loginVO.getAccountId());
		
		service.reInsert(vo);
		
		return "success";
	}
	
	@RequestMapping(value = "/isReReply", method=RequestMethod.POST)
	public int isReReply(ReplyVO vo) throws Exception{
		System.out.println("isReReply : " + vo);
		
		/* 대댓글이 있으면 1 없으면 0 */
		return service.isReReply(vo);
	}
	
	@RequestMapping(value="/listAll", method = RequestMethod.POST)
	public List<ReplyVO> listComment(ReplyVO vo) throws Exception{
        
		System.out.println("-----listComment : "+vo);

        // 해당 게시물 댓글
        List<ReplyVO> replyList = service.listAll(vo);
        
        System.out.println(replyList);
        return replyList;
        
    }

	@RequestMapping(value="/reList", method = RequestMethod.POST)
	public List<ReplyVO> reList(ReplyVO vo) throws Exception{
		
		// 해당 게시물 댓글
		List<ReplyVO> rereplyList = service.reList(vo);
		
		System.out.println(rereplyList);
		return rereplyList;
		
	}
	
	
	@RequestMapping(value = "/delete", method=RequestMethod.POST)
	public void deleteComment(ReplyVO vo) throws Exception{
		service.delete(vo);
        
    }

	
	@RequestMapping(value = "/update", method=RequestMethod.POST)
	public void updateComment(ReplyVO vo) throws Exception{
		service.update(vo);
		
	}
	

}
