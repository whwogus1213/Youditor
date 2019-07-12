package com.good.youditor;

import java.util.List;

import javax.inject.Inject;
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

	// 받은 메시지 읽기
	@RequestMapping(value = "/messageReceiveView", method = RequestMethod.GET)
	public String receiveMessageView(Model model, @RequestParam("messageId") int messageId) throws Exception {
		System.out.println("*************************************************");
		MessageList rMessage = service.receiveMessageView(messageId);
		if(rMessage.getRead_date() == null) {
			service.updateReadDate(messageId);
			rMessage = service.receiveMessageView(messageId);
		}

		model.addAttribute("rMessage", rMessage);
		System.out.println("MessageController messageReceiveView open");
		return "message/messageReceiveView";
	}

	// 보낸 메시지 읽기
	@RequestMapping(value = "/messageSendView", method = RequestMethod.GET)
	public String sendMessageView(Model model, @RequestParam("messageId") int messageId) throws Exception {
		System.out.println("*************************************************");
		MessageList rMessage = service.sendMessageView(messageId);

		model.addAttribute("rMessage", rMessage);
		System.out.println("MessageController messageSendView open");
		return "message/messageSendView";
	}
	
	// 메시지 쓰기
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public String writedo() throws Exception {
		System.out.println("*************************************************");
		
		System.out.println("MessageController messageWrite open");
		return "message/messageWrite";
	}
	
	// 메시지 답장 쓰기
	@RequestMapping(value = "/reply.do", method = RequestMethod.GET)
	public String replydo(Model model, @RequestParam("messageId") int messageId) throws Exception {
		System.out.println("*************************************************");
		// senderAccountId로 nickname 추출, subject & object 추출
		MessageList replyInfo = service.getReplyInfo(messageId);
		
		model.addAttribute("replyInfo", replyInfo);
		System.out.println("MessageController messageWrite open");
		return "message/messageWrite";
	}
	
	// 메시지 보내기
	@RequestMapping(value = "/sendMessagePro", method = RequestMethod.POST)
	public String sendMessagePro(@RequestParam("senderAccountId") int senderAccountId,
								@RequestParam("nickname") String nickname,
								@RequestParam("subject") String subject,
								@RequestParam("object") String object) throws Exception {
		System.out.println("============sendMessagePro 성공==============");
		MessageVO vo = new MessageList();
		vo.setSenderAccountId(senderAccountId);
		
		int receiverAccountId = service.getAccountIdByNickname(nickname);
		vo.setReceiverAccountId(receiverAccountId);
		vo.setSubject(subject);
		vo.setObject(object);
		service.sendMessage(vo);
		return "message/messageWritePro";
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
