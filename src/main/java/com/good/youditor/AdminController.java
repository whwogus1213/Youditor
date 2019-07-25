package com.good.youditor;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.good.dto.AccountsVO;
import com.good.dto.AdminVO;
import com.good.dto.Search;
import com.good.service.AdminService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {

	@Inject
	AdminService service;
	
	@Resource(name="uploadPath")
	String uploadPath;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminLogin() throws Exception {
		return "admin/adminLogin";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.POST)
	public String AccountsList(HttpSession session, AdminVO mavo, Model model) throws Exception {

		String returnURL = "";
		if (session.getAttribute("loginAdmin") != null) {
			// 기존에 login이란 세션 값이 존재한다면
			session.removeAttribute("loginAdmin"); // 기존값을 제거해 준다.
		}

		AdminVO vo = service.login(mavo);

		if (vo != null) { // 로그인 성공
			session.setAttribute("loginAdmin", vo);
			returnURL = "redirect:/adminView";
		} else { // 로그인에 실패한 경우
			returnURL = "redirect:/admin"; // 로그인 폼으로 다시 가도록 함
		}

		return returnURL; // 위에서 설정한 returnURL 을 반환해서 이동시킴
	}

	@RequestMapping(value = "/adminView", method = RequestMethod.GET)
	public String adminView(Model model, @RequestParam(required = false, defaultValue = "1") int page,
										 @RequestParam(required = false, defaultValue = "nickname") String searchType,
										 @RequestParam(required = false) String keyword) throws Exception {
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		int listCnt = service.getAccountListCnt(search);
		
		System.out.println(" listCnt : " + listCnt);

		int rangeSize = search.getRangeSize();
		int range = ((page - 1) / rangeSize) + 1;
		
		search.pageInfo(page, range, listCnt);
		
		model.addAttribute("pagination", search);
		model.addAttribute("list", service.selectAccounts(search));
		return "admin/adminView";
	}

	@RequestMapping(value = "/adminAccount", method = RequestMethod.GET)
	public String adminAccount(@RequestParam("accountId") int accountId, Model model) throws Exception {
		
		model.addAttribute("AccountInfo", service.getAccountInfo(accountId));
		return "admin/adminAccount";
	}

	@RequestMapping(value = "/adminCategory", method = RequestMethod.GET)
	public String adminCategory(@RequestParam("category") String category, Model model) throws Exception {
		category += "category";
		System.out.println(category);
		model.addAttribute("CatInfo", service.getCatInfo(category));
		return "admin/adminCategory";
	}

	// 이메일 중복 체크
	@RequestMapping("/checkEmail.do")
	@ResponseBody
	public Map<Object, Object> checkEmail(@RequestBody String email) throws Exception {

		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();

		count = service.checkEmail(email);
		map.put("cnt", count);

		return map;
	}

	// 닉네임 중복 체크
	@RequestMapping("/checkNickname.do")
	@ResponseBody
	public Map<Object, Object> checkNickname(@RequestBody String nickname) throws Exception {

		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();

		count = service.checkNickname(nickname);
		map.put("cnt", count);

		return map;
	}
	
	// 유저 계정 업뎃
	@RequestMapping(value = "/adminAccountUpdate", method = RequestMethod.POST)
	public String accountUpdate(@RequestParam("accountId") int accountId,
								@RequestParam("email") String email,
								@RequestParam("pwd") String pwd,
								@RequestParam("nickname") String nickname,
								@RequestParam("picture") MultipartFile picture,
								@RequestParam("footer") String footer,
								@RequestParam("authority") int authority) throws Exception {
		AccountsVO updateUser = new AccountsVO();
		updateUser.setAccountId(accountId);
		updateUser.setEmail(email);
		updateUser.setPwd(pwd);
		updateUser.setNickname(nickname);
		updateUser.setFooter(footer);
		updateUser.setAuthority(authority);

		//기본 사진이 아닌 경우사진 파일 삭제
		String savedName = "";
		String oriPic = service.getOriPic(accountId);
		try {
			oriPic.isEmpty();
		} catch(Exception e) {
			oriPic = "nothing.jpg";
		} finally {
			savedName = oriPic;
			if(!oriPic.equals("nothing.jpg") && !picture.isEmpty()) {
				String filePath = uploadPath + "/" + oriPic;
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
			}
		}

		//새로운 사진 등록
		if(!picture.isEmpty()) {
			savedName = picture.getOriginalFilename();
			StringTokenizer pst = new StringTokenizer(savedName,".");
			pst.nextToken();
			String file_ext = pst.nextToken();
			UUID uid = UUID.randomUUID();
			savedName = uid.toString().substring(0, 16) + "." + file_ext;	// 저장 이름
			// new File (디렉토리, 파일이름)
			File target = new File(uploadPath, savedName);
			
			FileCopyUtils.copy(picture.getBytes(), target);
		}
		updateUser.setPicture(savedName);
		
		service.accountUpdate(updateUser);
		
		return "redirect:/adminAccount?accountId=" + accountId;
	}

}
