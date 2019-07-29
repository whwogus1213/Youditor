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

import com.good.dto.AccountsVO;
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

	@RequestMapping(value = "/sender.do", method = RequestMethod.GET)
	public ModelAndView sender(Locale locale, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("email/emailSender");
		System.out.println("String emailSender open");
		return mav;
	}
	
	@RequestMapping("/sendpwd.do")
    public ModelAndView sendEmailAction(@RequestParam Map<String, String> paramMap, ModelMap model,RedirectAttributes ra) throws Exception {
        ModelAndView mav;
        String id= (String) paramMap.get("nickname");
        String e_mail= (String) paramMap.get("email");
        String pw = service.getPwd(paramMap);
        String name = service.getEmail(paramMap);
        int accountId = service.getAccountId(paramMap);
        System.out.println(accountId);
        if(name != null) {
	        if(pw!=null) {
	        	pw = "";
				for (int i = 0; i < 12; i++) {
					pw += (char) ((Math.random() * 26) + 97);
				}
				service.updatePassword(accountId ,pw);
	            email.setMessage("임시 비밀번호는 "+pw+" 입니다. \n 비밀번호를 변경하여 사용해 주세요!!" + new StringBuffer().append("\n 비밀번호를 바꾸려면 아래 링크를 클릭하세요. \n").append("\n http://localhost:8080/email/emailUpdatePassword.do?accountId=").append(service.getAccountId(paramMap)).toString());
	            email.setReceiveMail(e_mail);
	            email.setSubject(id+"님 비밀번호 찾기 메일입니다.");
	            emailSender.SendEmail(email);
	            mav= new ModelAndView("email/emailSender");
	            return mav;
	        }else {
	        	System.out.println("실패했습니다.");
	            mav=new ModelAndView("redirect:/");
	            return mav;
        }
        }else {
        	System.out.println("해당 아이디로 가입된 정보가 없습니다.");
            mav=new ModelAndView("redirect:/");
            return mav;
        }
    }
	@RequestMapping(value = "/senderpwd.do", method = RequestMethod.GET)
	public ModelAndView senderPwd(Locale locale, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("email/emailSenderPwd");
		System.out.println("String emailSenderPwd open");
		return mav;
	}
	// 비밀번호수정화면으로 
	@RequestMapping(value = "/emailUpdatePassword.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView updatePassword(Locale locale, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("email/emailUpdatePassword");
		System.out.println("String emailUpdatePassword open");
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
}
