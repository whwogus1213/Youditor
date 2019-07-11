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
import org.springframework.web.servlet.ModelAndView;

import com.good.dto.MessageVO;
import com.good.dto.AccountsVO;
import com.good.dto.MessageList;
import com.good.dto.MessageSearch;
import com.good.service.MessageService;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Inject
	MessageService service;
	
	// 받은 메세지 목록 + 페이징 + 검색
	@RequestMapping(value = "/messageReceiveList", method = RequestMethod.GET)
	public String receiveList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
									@RequestParam(required = false, defaultValue = "1") int range,
									@RequestParam(required = false, defaultValue = "object") String searchType,
									@RequestParam(required = false) String keyword,
									HttpSession session) throws Exception {
		MessageSearch search = new MessageSearch();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		AccountsVO vo = (AccountsVO) session.getAttribute("login");
		search.setAccountId(vo.getAccountId());
		List<MessageList> messageReceiveList = service.receiveListAll(search);
		
		// 전체 게시글 개수
		int listCnt = service.getReceiveListCnt(search);
		
		search.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", search);
		model.addAttribute("MessageReceiveList", messageReceiveList);
		System.out.println("MessageController MessageReceiveList open");
		return "message/messageReceiveList";
	}
	
	// 보낸 메세지 목록 + 페이징 + 검색
	@RequestMapping(value = "/messageSendList", method = RequestMethod.GET)
	public String sendList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
									@RequestParam(required = false, defaultValue = "1") int range,
									@RequestParam(required = false, defaultValue = "object") String searchType,
									@RequestParam(required = false) String keyword,
									HttpSession session) throws Exception {
		MessageSearch search = new MessageSearch();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		AccountsVO vo = (AccountsVO) session.getAttribute("login");
		search.setAccountId(vo.getAccountId());
		List<MessageList> messageSendList = service.sendListAll(search);
		
		// 전체 게시글 개수
		int listCnt = service.getSendListCnt(search);
		
		search.pageInfo(page, range, listCnt);

		model.addAttribute("pagination", search);
		model.addAttribute("MessageSendList", messageSendList);
		System.out.println("MessageController MessageSendList open");
		return "message/messageSendList";
	}

	// 메시지 읽기
	@RequestMapping(value = "/messageView", method = RequestMethod.GET)
	public ModelAndView messageView(@RequestParam("messageId") int messageId) throws Exception {
		System.out.println("*************************************************");
		MessageVO row = service.view(messageId);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("message/messageView");
		mav.addObject("row", row);
		System.out.println("MessageController messageView open");
		return mav;
	}
	
	// 메시지 쓰기
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public ModelAndView writedo() throws Exception {
		System.out.println("*************************************************");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("message/messageWrite");
		System.out.println("MessageController messageWrite open");
		return mav;
	}
	
	// 메시지 쓰기
	@RequestMapping(value = "/reply.do", method = RequestMethod.GET)
	public ModelAndView replydo(@RequestParam("messageId") int messageId) throws Exception {
		System.out.println("*************************************************");
		MessageVO row = service.view(messageId);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("message/messageReply");
		mav.addObject("row", row);
		System.out.println("MessageController messageReply open");
		return mav;
	}
	
	// 메시지 보내기
	@RequestMapping(value = "/sendMessagePro", method = RequestMethod.POST)
	public String sendMessagePro(MessageVO vo) throws Exception {
		System.out.println("============sendMessagePro 성공==============");
		System.out.println(vo);
		service.sendMessage(vo);

		return "redirect:/";
	}
	
	// 받은 메시지 숨기기
	@RequestMapping(value="/hideReceivedMessage")
	public String hideReceivedMessage(List<String> list) throws Exception {
		System.out.println(list);
		service.hideReceivedMessage(list);
		
		return "redirect:/";
	}
	
	// 보낸 메시지 숨기기
	@RequestMapping(value="/hideSendMessage")
	public String hideSendMessage(List<String> list) throws Exception {
		System.out.println(list);
		service.hideSendMessage(list);
		
		return "redirect:/";
	}
	
	
}
