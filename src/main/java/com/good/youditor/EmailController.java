package com.good.youditor;

import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.good.dto.AccountCheckVO;
import com.good.dto.EmailSender;
import com.good.dto.EmailVO;
import com.good.service.AccountsService;
import com.good.service.EmailService;

@Controller
@RequestMapping("/email")
public class EmailController {

	@Inject
	AccountsService service;
	
	@Inject
	EmailService emailService;
	
	@Inject
	AccountsService accountsService;
	
	@Inject
	private EmailSender emailSender;
	
	@Inject
	private EmailVO email;
	
	@RequestMapping(value = "/send.do")
	public String send(@ModelAttribute EmailVO vo,Model model) throws Exception {
		try {
			emailService.sendMail(vo);
			model.addAttribute("message","메일이 발송되었습니다.");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("message","이메일 발송 실패");
		}
		return "email/emailSender";
	}
	
	@RequestMapping("/sendpwd.do")
    public ModelAndView sendEmailAction(@RequestParam Map<String, String> paramMap, ModelMap model,RedirectAttributes ra) throws Exception {
        ModelAndView mav;
        String id= (String) paramMap.get("nickname");
        String e_mail= (String) paramMap.get("email");
        int check = service.checkEmail(e_mail);
        if(check == 0) {
        	System.out.println("실패했습니다.");
            mav=new ModelAndView("email/emailSenderPwd");
            mav.addObject("message","해당 이메일로 가입된 정보가 없습니다. 가입하신 이메일로 정확히 입력해 주세요. 메일이 발송됩니다.");
            return mav;
        	
        }
        String pw = service.getPwd(paramMap);
        String name = service.getEmail(paramMap);
        int accountId = service.getAccountId(paramMap);
        System.out.println(accountId);
        if(accountId == 0) {
        	System.out.println("실패했습니다.");
            mav=new ModelAndView("email/emailSenderPwd");
            mav.addObject("message","해당 이메일이나 닉네임으로 가입된 정보가 없습니다.  가입하신 이메일로 정확히 입력해 주세요. 메일이 발송됩니다.");
            return mav;
        }
        if(name != null) {
	        if(pw!=null) {
	        	AccountCheckVO chVO = new AccountCheckVO();
	        	chVO.setAccountId(accountId);
	        	if(accountsService.findAccountCheckKey(accountId) == 1) {
	        		chVO.setCheckNum(accountsService.getCheckNUm(accountId));
	        	} else {
		        	int checkNum = 0;
		    		do {
		    			checkNum = (int)(Math.random() * 99999) + 10000;
		    			System.out.println(checkNum + "--------------------check");
		    		} while(accountsService.duplicateCheck(checkNum) != 0);
		        	chVO.setCheckNum(checkNum);
		        	
		        	accountsService.insertCheckNum(chVO);	        		
	        	}
	        	
	            email.setMessage("비밀번호를 바꾸려면 아래 링크를 클릭하세요." + new StringBuffer().append("\n http://localhost:8080/accounts/passwordFinder.do?accountId=" + chVO.getAccountId() + "&checkNum=" + chVO.getCheckNum()));
	            email.setReceiveMail(e_mail);
	            email.setSubject(id+"님 비밀번호 찾기 메일입니다.");
	            emailSender.SendEmail(email);
	            mav= new ModelAndView("email/emailSender");
	    		mav.addObject("message","비밀번호 찾기 완료");
	            return mav;
	        }else {
	        	System.out.println("실패했습니다.");
	            mav=new ModelAndView("email/emailSenderPwd");
	            mav.addObject("message","해당 이메일이나 닉네임으로 가입된 정보가 없습니다.  가입하신 이메일로 정확히 입력해 주세요. 메일이 발송됩니다.");
	            return mav;
        }
        }else {
        	System.out.println("해당 아이디로 가입된 정보가 없습니다.");
            mav=new ModelAndView("email/emailSenderPwd");
            mav.addObject("message","해당 이메일이나 닉네임으로 가입된 정보가 없습니다.  가입하신 이메일로 정확히 입력해 주세요. 메일이 발송됩니다.");
            return mav;
        }
    }
	//아이디 찾기
	@RequestMapping("/sendnick.do")
    public ModelAndView sendNickEmailAction(@RequestParam Map<String, String> paramMap, ModelMap model,RedirectAttributes ra) throws Exception {
        ModelAndView mav;
        String e_mail= (String) paramMap.get("email");
        int check = service.checkEmail(e_mail);
        if(check == 0) {
        	System.out.println("실패했습니다.");
            mav=new ModelAndView("email/emailSenderNick");
            mav.addObject("message","해당 이메일로 가입된 정보가 없습니다. 가입하신 이메일로 정확히 입력해 주세요. 메일이 발송됩니다.");
            return mav;
        	
        }
        String name = service.getNickname(paramMap);
        if(name != null) {

	            email.setMessage("회원님의 닉네임은 "+name+" 입니다.");
	            email.setReceiveMail(e_mail);
	            email.setSubject("YouditoR 회원님 닉네임 찾기 메일입니다.");
	            emailSender.SendEmail(email);
	            mav= new ModelAndView("email/emailSender");
	    		mav.addObject("message","닉네임 찾기 완료");
	            return mav;
	        }else {
	        	System.out.println("실패했습니다.");
	            mav=new ModelAndView("email/emailSenderNick");
	            mav.addObject("message","해당 이메일로 가입된 정보가 없습니다. 가입하신 이메일로 정확히 입력해 주세요. 메일이 발송됩니다.");
	            return mav;
        }
        
    }
	// 비밀번호 찾기 화면
	@RequestMapping(value = "/senderpwd.do", method = RequestMethod.GET)
	public ModelAndView senderPwd(Locale locale, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("email/emailSenderPwd");
		System.out.println("String emailSenderPwd open");
		return mav;
	}
	// 아이디 찾기 화면 
	@RequestMapping(value = "/sendernick.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView updatePassword(Locale locale, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("email/emailSenderNick");
		System.out.println("String emailSenderNick open");
		return mav;
	}
	
	@RequestMapping(value="/emailUpdatePasswordPro")
	public ModelAndView updatePasswordPro(HttpSession session, int accountId, String pwd) throws Exception {
		service.updatePassword(accountId, pwd);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		System.out.println("success emailpwdupdate");
		return mav;
	}
	
	/*@ResponseBody
	@RequestMapping("/emailcheck")
    public ModelAndView emailcheck(@RequestParam Map<String, String> paramMap, ModelMap model,RedirectAttributes ra) throws Exception {
        ModelAndView mav;
        
        return mav;
	}*/
}
