package com.good.youditor;

import java.io.File;
import java.util.ArrayList;
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
import com.good.dto.CategoryCount;
import com.good.dto.EditCategoryVO;
import com.good.dto.NoticeCategoryVO;
import com.good.dto.RecruitCategoryVO;
import com.good.dto.SearchAccounts;
import com.good.dto.TipCategoryVO;
import com.good.dto.VideoCategoryVO;
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
										 @RequestParam(required = false, defaultValue = "accountId") String orderBy,
										 @RequestParam(required = false, defaultValue = "DESC") String orderType,
										 @RequestParam(required = false, defaultValue = "nickname") String searchType,
										 @RequestParam(required = false) String keyword) throws Exception {
		SearchAccounts search = new SearchAccounts();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		search.setOrderBy(orderBy);
		search.setOrderType(orderType);
		
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
		if(category.equals("notice")) {
			System.out.println("공지");
			List<NoticeCategoryVO> CatInfo = new ArrayList<NoticeCategoryVO>();
			CatInfo = service.getNoticeCatInfo();
			List<CategoryCount> catCount = service.getNoticeCatCount();
			System.out.println("CatInfo : " + CatInfo);
			System.out.println("CatCount : " + catCount);
			model.addAttribute("CatName", category);
			model.addAttribute("CategoryInfo", CatInfo);
			model.addAttribute("CatCount", catCount);
		} else if(category.equals("video")) {
			System.out.println("영상공유");
			List<VideoCategoryVO> CatInfo = new ArrayList<VideoCategoryVO>();
			CatInfo = service.getVideoCatInfo();
			List<CategoryCount> catCount = service.getVideoCatCount();
			System.out.println("CatInfo : " + CatInfo);
			System.out.println("CatCount : " + catCount);
			model.addAttribute("CatName", category);
			model.addAttribute("CategoryInfo", CatInfo);
			model.addAttribute("CatCount", catCount);
		} else if(category.equals("tip")) {
			System.out.println("팁");
			List<TipCategoryVO> CatInfo = new ArrayList<TipCategoryVO>();
			CatInfo = service.getTipCatInfo();
			List<CategoryCount> catCount = service.getTipCatCount();
			System.out.println("CatInfo : " + CatInfo);
			System.out.println("CatCount : " + catCount);
			model.addAttribute("CatName", category);
			model.addAttribute("CategoryInfo", CatInfo);
			model.addAttribute("CatCount", catCount);
		} else if(category.equals("recruit")) {
			System.out.println("구인구직");
			List<RecruitCategoryVO> CatInfo = new ArrayList<RecruitCategoryVO>();
			CatInfo = service.getRecruitCatInfo();
			List<CategoryCount> catCount = service.getRecruitCatCount();
			System.out.println("CatInfo : " + CatInfo);
			System.out.println("CatCount : " + catCount);
			model.addAttribute("CatName", category);
			model.addAttribute("CategoryInfo", CatInfo);
			model.addAttribute("CatCount", catCount);
		}
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

	@RequestMapping(value = "/adminMoveCatPro", method = RequestMethod.POST)
	@ResponseBody
	public int adminMoveCatPro(@RequestParam("category") String category,
							@RequestParam("categoryId") int categoryId,
							@RequestParam("moveTo") int moveTo) throws Exception {
		int result = 0;
		Map<String, Integer> fromTo = new HashMap<String, Integer>();
		fromTo.put("from", categoryId);
		fromTo.put("to", moveTo);
		if(category.equals("notice")) {
			service.moveNoticeCat(fromTo);
			result = 1;
		} else if(category.equals("video")) {
			service.moveVideoCat(fromTo);
			result = 1;
		} else if(category.equals("tip")) {
			service.moveTipCat(fromTo);
			result = 1;
		} else if(category.equals("recruit")) {
			service.moveRecruitCat(fromTo);
			result = 1;
		} else {
			result = 0;
		}

		return result;
	}

	@RequestMapping(value = "/adminDelCatPro", method = RequestMethod.POST)
	@ResponseBody
	public int adminDelCatPro(@RequestParam("category") String category,
							@RequestParam("categoryId") int categoryId,
							@RequestParam("moveTo") int moveTo) throws Exception {
		int result = 0;
		Map<String, Integer> fromTo = new HashMap<String, Integer>();
		fromTo.put("from", categoryId);
		fromTo.put("to", moveTo);
		if(category.equals("notice")) {
			service.moveNoticeCat(fromTo);
			service.delNoticeCat(categoryId);
			result = 1;
		} else if(category.equals("video")) {
			service.moveVideoCat(fromTo);
			service.delVideoCat(categoryId);
			result = 1;
		} else if(category.equals("tip")) {
			service.moveTipCat(fromTo);
			service.delTipCat(categoryId);
			result = 1;
		} else if(category.equals("recruit")) {
			service.moveRecruitCat(fromTo);
			service.delRecruitCat(categoryId);
			result = 1;
		} else {
			result = 0;
		}

		return result;
	}

	@RequestMapping(value = "/adminEditCatPro")
	@ResponseBody
	public int adminEditCatPro(@RequestParam("category") String category,
								@RequestParam("categoryId") int categoryId,
								@RequestParam("catId") int catId,
								@RequestParam("catName") String catName,
								@RequestParam("catEditAuth") int catEditAuth,
								@RequestParam("catViewAuth") int catViewAuth) throws Exception {
		System.out.println("카테고리 수정");
		int result = 0;

		EditCategoryVO catVO = new EditCategoryVO();
		catVO.setCatOldId(categoryId);
		catVO.setCatNewId(catId);
		catVO.setCatName(catName);
		catVO.setEditAuth(catEditAuth);
		catVO.setViewAuth(catViewAuth);
		
		if(category.equals("notice")) {
			System.out.println("nCatVO : " + catVO);
			service.editNoticeCat(catVO);
			result = 1;
		} else if(category.equals("video")) {
			System.out.println("vCatVO : " + catVO);
			service.editVideoCat(catVO);
			result = 1;
		} else if(category.equals("tip")) {
			System.out.println("tCatVO : " + catVO);
			service.editTipCat(catVO);
			result = 1;
		} else if(category.equals("recruit")) {
			System.out.println("rCatVO : " + catVO);
			service.editRecruitCat(catVO);
			result = 1;
		} else {
			result = 0;
		}

		return result;
	}

	@RequestMapping(value = "/adminNewCatPicPro")
	@ResponseBody
	public int adminNewCatPicPro(@RequestParam("categoryId") int categoryId,
									@RequestParam("CatPic") MultipartFile CatPic) throws Exception {
		System.out.println(categoryId);
		int result = 0;
		//기본 사진이 아닌 경우사진 파일 삭제
		String savedName = "";
		String oriPic = service.getCatPic(categoryId);
		System.out.println(oriPic);
		try {
			oriPic.isEmpty();
		} catch(Exception e) {
			oriPic = "nothing.jpg";
		} finally {
			savedName = oriPic;
			if(!oriPic.equals("nothing.jpg") && !CatPic.isEmpty()) {
				String filePath = uploadPath + "/videoboard/" + oriPic;
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
		if(!CatPic.isEmpty()) {
			savedName = CatPic.getOriginalFilename();
			StringTokenizer pst = new StringTokenizer(savedName,".");
			pst.nextToken();
			String file_ext = pst.nextToken();
			UUID uid = UUID.randomUUID();
			savedName = uid.toString().substring(0, 16) + "." + file_ext;	// 저장 이름
			// new File (디렉토리, 파일이름)
			File target = new File(uploadPath + "/videoboard/", savedName);

			FileCopyUtils.copy(CatPic.getBytes(), target);

			result = 1;
		}
		EditCategoryVO editCatVO = new EditCategoryVO();
		editCatVO.setCatOldId(categoryId);
		editCatVO.setCatPic(savedName);
		System.out.println(editCatVO);
		service.updateCatPic(editCatVO);

		return result;
	}
	
	@RequestMapping(value = "/adminAddCatPro")
	@ResponseBody
	public int adminAddCatPro(@RequestParam("board") String board,
							@RequestParam("newCatId") int newCatId,
							@RequestParam("newCatName") String newCatName,
							@RequestParam("newEditAuth") int newEditAuth,
							@RequestParam("newViewAuth") int newViewAuth) throws Exception {
		System.out.println("board : " + board + ", newCatId : " + newCatId + ", newCatName : " + newCatName);
		int result = 0;
		EditCategoryVO newCat = new EditCategoryVO();
		newCat.setCatNewId(newCatId);
		newCat.setCatName(newCatName);
		newCat.setEditAuth(newEditAuth);
		newCat.setViewAuth(newViewAuth);
		System.out.println(newCat);
		if(board.equals("notice")) {
			if(service.checkNoticeCatId(newCatId) == 0) {
				System.out.println("nCatVO : " + newCat);
				service.insertNewNoticeCat(newCat);
				result = 1;
			}
		} else if(board.equals("video")) {
			if(service.checkVideoCatId(newCatId) == 0) {
				System.out.println("vCatVO : " + newCat);
				service.insertNewVideoCat(newCat);
				result = 1;
			}
		} else if(board.equals("tip")) {
			if(service.checkTipCatId(newCatId) == 0) {
				System.out.println("tCatVO : " + newCat);
				service.insertNewTipCat(newCat);
				result = 1;
			}
		} else if(board.equals("recruit")) {
			if(service.checkRecruitCatId(newCatId) == 0) {
				System.out.println("rCatVO : " + newCat);
				service.insertNewRecruitCat(newCat);
				result = 1;
			}
		} else {
			result = 0;
		}

		
		return result;
	}

}
