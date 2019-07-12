package com.good.youditor;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.good.dto.AccountsVO;
import com.good.service.AccountsService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/accounts")
public class AccountsController {

	@Inject
	AccountsService service;
	
	//servlet-context,xml에 선언한 bean을 참조
	@Resource(name="uploadPath")
	String uploadPath;// <== 공통으로 사용하기 위해서

	@RequestMapping(value = "/show", method = RequestMethod.GET)
	public void show(Model model) throws Exception {
		List<AccountsVO> list = service.selectAccounts();
		model.addAttribute("list", list);
	}

	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public ModelAndView join(Locale locale, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("accounts/join");
		System.out.println("String join open");
		return mav;
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public ModelAndView login(Locale locale, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("accounts/login");
		System.out.println("String login open");
		return mav;
	}

	// 로그인 처리하는 부분
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginProcess(HttpSession session, AccountsVO accountsVo, RedirectAttributes rttr) throws Exception {
		String returnURL = "";
		if (session.getAttribute("login") != null) {
			// 기존에 login이란 세션 값이 존재한다면
			session.removeAttribute("login"); // 기존값을 제거해 준다.
		}
		
		// 로그인이 성공하면 UserVO 객체를 반환함.
		AccountsVO vo = service.login(accountsVo);
		
		if (vo != null) { // 로그인 성공
			int authority = vo.getAuthority();
			
			if(authority < 3) {		// 권한에 문제가 있는 경우
				Map<String, Object> map = new HashMap<String,Object>();
				map.put("error", false);
				map.put("msg", authority);
				rttr.addFlashAttribute("error", map);
				returnURL = "redirect:/accounts/login.do";
			} else {
				session.setAttribute("login", vo);
				returnURL = "redirect:/";
			}
		} else { // 로그인에 실패한 경우
			int errorCase = 3;
			Map<String, Object> map = new HashMap<String,Object>();
			map.put("error", false);
			map.put("msg", errorCase);
			rttr.addFlashAttribute("error", map);
			returnURL = "redirect:/accounts/login.do"; // 로그인 폼으로 다시 가도록 함
		}

		return returnURL; // 위에서 설정한 returnURL 을 반환해서 이동시킴
	}

	// 로그아웃 하는 부분
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 전체를 날려버림
		return "redirect:/";
	}

	@RequestMapping(value = "/insertAccountsForm")
	public String insertAccountsForm() throws Exception {
		return "accounts/insertAccounts";
	}

	// insertAccountsForm-> insertAccountsPro
	@RequestMapping(value = "/insertAccountsPro", method = RequestMethod.POST)
	public String insertAccountsPro(HttpSession session, AccountsVO vo) throws Exception {

		System.out.println(vo.getPicture());
		System.out.println(vo.getUploadFile());
		
		MultipartFile uploadfile = vo.getUploadFile();
		String savedName = uploadfile.getOriginalFilename();
		UUID uid = UUID.randomUUID();
		
		//파일 이름 수정 후 저장
		StringTokenizer pst = new StringTokenizer(savedName,".");
		pst.nextToken();
		String file_ext = pst.nextToken();
		savedName = uid.toString().substring(0, 10) + "." + file_ext;	// 저장 이름
		
		// new File (디렉토리, 파일이름)
		File target = new File(uploadPath, savedName);
		
		vo.setPicture(savedName);

		FileCopyUtils.copy(uploadfile.getBytes(), target);
		service.insertAccounts(vo);
		System.out.println("============insertAccountsPro 성공==============");

		return "redirect:/";

	}


	//가입시 이메일 중복 체크
	@RequestMapping("/checkEmail.do")
	@ResponseBody
	public Map<Object, Object> checkEmail(@RequestBody String email) throws Exception {

		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();

		count = service.checkEmail(email);
		map.put("cnt", count);

		return map;
	}

	//가입시 닉네임 중복 체크
	@RequestMapping("/checkNickname.do")
	@ResponseBody
	public Map<Object, Object> checkNickname(@RequestBody String nickname) throws Exception {

		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();

		count = service.checkNickname(nickname);
		map.put("cnt", count);

		return map;
	}
	
	@RequestMapping(value = "/resetPassword.do", method = RequestMethod.GET)
	public ModelAndView resetPassword(Locale locale, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("accounts/resetPassword");
		System.out.println("String resetPassword open");
		return mav;
	}
	
	@RequestMapping(value = "/resetPasswordPro")
	public ModelAndView resetPasswordPro(String email) throws Exception {
		service.resetPassword(email);
		System.out.println("============resetPasswordPro 성공==============");

		ModelAndView mav = new ModelAndView();
		mav.setViewName("accounts/resetPwdMsg");
		System.out.println("String resetPwdMsg open");
		return mav;
	}
		
	// 회원정보수정화면으로 
	@RequestMapping(value = "/modAccount.do", method = RequestMethod.GET)
	public ModelAndView modAccount(Locale locale, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("accounts/modAccount");
		System.out.println("String modAccount open");
		return mav;
	}
	
	// 비밀번호수정화면으로 
	@RequestMapping(value = "/updatePassword.do", method = RequestMethod.POST)
	public ModelAndView updatePassword(Locale locale, Model model) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("accounts/updatePassword");
		System.out.println("String updatePassword open");
		return mav;
	}
	
	@RequestMapping(value="/updatePasswordPro")
	public ModelAndView updatePasswordPro(HttpSession session, int accountId, String email, String pwd) throws Exception {
		service.updatePassword(accountId, pwd);
		System.out.println("============resetPasswordPro 성공==============");
		
		AccountsVO vo = new AccountsVO();
		
		vo.setEmail(email);
		vo.setPwd(pwd);

		if (session.getAttribute("login") != null) {
			// 기존에 login이란 세션 값이 존재한다면
			session.removeAttribute("login"); // 기존값을 제거해 준다.
		}
		
		vo = service.login(vo);
		
		session.setAttribute("login", vo);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("accounts/modAccount");
		System.out.println("String modAccount open");
		return mav;
	}
	
	// 회원정보수정처리
	@RequestMapping(value = "/updateAccount.do")
	public ModelAndView updateAccount(HttpSession session, int accountId, String email, String pwdCfm, String nickname, MultipartFile picture, String footer) throws Exception {
		AccountsVO vo = new AccountsVO();
		
		vo.setAccountId(accountId);
		vo.setEmail(email);
		vo.setPwd(pwdCfm);
		vo.setNickname(nickname);
		
		AccountsVO login = (AccountsVO)session.getAttribute("login");
		
		//사진 파일 삭제
		String filePath = uploadPath + "/"+  login.getPicture();
		System.out.println(filePath);
		File picture_old = new File(filePath);
		if(picture_old.exists()) {
			if(picture_old.delete()) {
				System.out.println("기존 사진 삭제 성공");
			} else {
				System.out.println("기존 사진 삭제 실패");
			}
		} else {
			System.out.println("기존에 사진이 없었습니다.");
		}
		
		
		//새로운 사진 등록
		String savedName = picture.getOriginalFilename();
		StringTokenizer pst = new StringTokenizer(savedName,".");
		pst.nextToken();
		String file_ext = pst.nextToken();
		UUID uid = UUID.randomUUID();
		savedName = uid.toString().substring(0, 16) + "." + file_ext;	// 저장 이름
		// new File (디렉토리, 파일이름)
		File target = new File(uploadPath, savedName);
		
		vo.setPicture(savedName);
		vo.setFooter(footer);

		FileCopyUtils.copy(picture.getBytes(), target);
		
		service.updateAccount(vo);
		
		if (session.getAttribute("login") != null) {
			// 기존에 login이란 세션 값이 존재한다면
			session.removeAttribute("login"); // 기존값을 제거해 준다.
		}
		
		vo = service.login(vo);
		
		session.setAttribute("login", vo);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("accounts/updateAccount");
		System.out.println("String updateAccount open");
		return mav;
	}
	
	@RequestMapping(value = "/deleteAccount.do")
	public ModelAndView deleteAccount(HttpSession session, int accountId, String email, String pwdCfm, RedirectAttributes rttr) throws Exception {
		ModelAndView mav = new ModelAndView();
		AccountsVO vo = new AccountsVO();
		
		vo.setAccountId(accountId);
		vo.setEmail(email);
		vo.setPwd(pwdCfm);
		
		//사진 파일 삭제
		String filePath = uploadPath + "/"+  vo.getPicture();
		File picture = new File(filePath);
		if(picture.exists()) {
			if(picture.delete()) {
				System.out.println("사진 삭제 성공");
			} else {
				System.out.println("사진 삭제 실패");
			}
		} else {
			System.out.println("사진이 없습니다.");
		}
		
		service.deleteAccount(vo);
		vo = service.login(vo);
		int authority = vo.getAuthority(); 
		
		
		if(authority == 0) {	// 탈퇴 성공
			session.invalidate();
			mav.setViewName("accounts/deleteAccount");
			System.out.println("String deleteAccount open");
		} else {	// 탈퇴 실패
			rttr.addFlashAttribute("msg", false);
			mav.setViewName("accounts/modAccount");
			System.out.println("String modAccount open");
		}
		return mav;
	}
	
	@RequestMapping(value = "/signUp.do")
	public ModelAndView signUp() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("accounts/signUp");
		System.out.println("String signUp open");
		return mav;
	}
	
}
