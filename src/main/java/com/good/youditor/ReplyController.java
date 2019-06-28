package com.good.youditor;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
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
import com.mysql.cj.x.json.JsonArray;

@RestController
@RequestMapping("/reply/*")
public class ReplyController {

	@Inject
	ReplyService service;

	// 게시물 목록
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
	
	@RequestMapping(value="/listAll")
	public ArrayList<HashMap<String, String>> listComment(ReplyVO vo) throws Exception{
        
        ArrayList<HashMap<String, String>> hmlist = new ArrayList<HashMap<String,String>>();

        // 해당 게시물 댓글
        List<ReplyVO> replyList = service.listAll(vo.getBoardId());
        
        if(replyList.size() > 0){
            for(int i=0; i<replyList.size(); i++){
            	
                HashMap<String, String> hm = new HashMap<String,String>();
                hm.put("commentId", replyList.get(i).getCommentId()+"");
                hm.put("object", replyList.get(i).getObject());
                hm.put("nickname", replyList.get(i).getNickname());
                
                hmlist.add(hm);
            }
            
        }
        
        return hmlist;
        
    }

}
